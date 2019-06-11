# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "erb"
require "ruby-progressbar"
require "fileutils"
require "yaml"
require_relative "./shared"

WWW_DIR     = File.expand_path(File.join(__dir__, "..", "www")).freeze
DOCS_DIR    = File.expand_path(File.join(__dir__, "..", "docs")).freeze

begin
  require "git"
  require_relative "./contrib"
rescue LoadError
  puts "contrib tasks are unavailable because the git gem is not available."
end

class Markdown
  class << self
    def h1(msg)
      "# #{msg}\n\n"
    end

    def h2(msg)
      "## #{msg}\n\n"
    end

    def h3(msg)
      "### #{msg}\n\n"
    end

    def code(msg, syntax = nil)
      "```#{syntax}\n"\
      "#{msg}\n"\
      "```\n\n"
    end

    def li(msg)
      "* #{msg.gsub("\n", "\n    ")}\n"
    end

    def ul(msg)
      msg + "\n"
    end

    def p(msg)
      "#{msg}\n\n"
    end

    def a(name, dst = nil)
      dst ||= name
      "[#{name}](#{dst})"
    end

    def suffix
      ".md"
    end

    def meta(opts)
      o = opts.map { |k, v| "#{k}: #{v}" }.join("\n")
      "---\n#{o}\n---\n\n"
    end
  end
end

class RST
  class << self
    def h1(msg)
      "=====================================================\n"\
      "#{msg}\n"\
      "=====================================================\n\n"\
    end

    def h2(msg)
      "#{msg}\n"\
      "=====================================================\n\n"\
    end

    def h3(msg)
      "#{msg}\n"\
      "-----------------------------------------------------\n\n"\
    end

    def code(msg, syntax = nil)
      ".. code-block:: #{syntax}\n\n"\
      "   #{msg.gsub("\n", "\n   ")}\n\n"
    end

    def li(msg)
      "#{msg.gsub("\n", "\n   ")}\n\n"
    end

    def ul(msg)
      msg
    end

    def p(msg)
      "#{msg}\n\n"
    end

    def a(name, _dst = nil)
      # FIXME: needs link handling
      "`#{name}`_"
    end

    def suffix
      ".rst"
    end

    def meta(_o)
      "" # ignore for now
    end
  end
end

class ResourceDocs
  def initialize(root)
    @paths = {}  # cache of paths
    @root = root # relative root path for all docs
  end

  def render(path)
    @paths[path] ||= render_path(path)
  end

  def partial(x)
    render(x + ".md.erb")
  end

  def overview_page(resource_doc_files) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    renderer = Markdown
    markdown = renderer.meta(title: "InSpec Resources Reference")
    markdown << renderer.h1("InSpec Resources Reference")
    markdown << renderer.p("The following list of InSpec resources are available.")

    contrib_config = YAML.load(File.read(File.join(CONTRIB_DIR, "contrib.yaml")))

    # Build a list of resources keyed on the group they are a part of.
    # We'll determine the group using regexes.
    group_regexes = [
      # These are hardcoded present in the main repo.  If they become resource
      # packs, this should change.
      { group_name: "AWS", regex: /^aws_/ },
      { group_name: "Azure", regex: /^azure(rm)?_/ },
    ]
    # Also pick up regexes and group names from contrib resource packs.
    contrib_config["resource_packs"].values.each do |project_info|
      group_regexes << { group_name: project_info["doc_group_title"], regex: Regexp.new(project_info["resource_file_regex"]) }
    end

    # OK, apply the regexes we have to the resource doc file list we were passed.
    # doc_file looks like /resources/foo.md.erb - trim off directory and file extension
    trimmed_doc_files = resource_doc_files.dup.map { |file| File.basename(file).sub(/\.md(\.erb)?$/, "") }
    resources_by_group = Hash[group_regexes.map { |info| [info[:group_name], []] }] # Initialize each group to an empty array
    resources_by_group["OS"] = []
    trimmed_doc_files.each do |doc_file|
      matched = false
      group_regexes.each do |group_info|
        next if matched
        if doc_file =~ group_info[:regex]
          resources_by_group[group_info[:group_name]] << doc_file
          matched = true
        end
      end
      # Any resources that don't match a regex are assumed to be 'os' resources.
      resources_by_group["OS"] << doc_file unless matched
    end

    # Now transform the resource lists into HTML
    markdown_resource_links_by_group = {}
    resources_by_group.each do |group_name, resource_list|
      markdown_resource_links_by_group[group_name] = resource_list.map do |resource_name|
        renderer.li(renderer.a(resource_name.gsub("_", '\\_'), "resources/" + resource_name + ".html"))
      end.join("")
    end

    # Remove any groups that have no resource docs.
    resources_by_group.reject! { |_, resource_list| resource_list.empty? }

    # Generate the big buttons that jump to the section of the page for each group.
    markdown << '<div class="row columns align">'
    # "Sorted, except OS is always in first place"
    ordered_group_names = ["OS"] + resources_by_group.keys.sort.reject { |group_name| group_name == "OS" }
    button_template = '<a class="resources-button button btn-lg btn-purple-o shadow margin-right-xs" href="%s">%s</a>'
    ordered_group_names.each do |group_name|
      markdown << format(button_template, "#" + (group_name + "-resources").downcase, group_name)
      markdown << "\n"
    end
    markdown << "</div>"

    # Generate the actual long lists of links
    group_section_header_template = '
<div class="brdr-left margin-top-sm margin-under-xs">
  <h3 class="margin-left-xs"><a id="%s" class="a-purple"><h3 class="a-purple">%s</h3></a></h3>
</div>
'
    ordered_group_names.each do |group_name|
      markdown << format(group_section_header_template, (group_name + "-resources").downcase, group_name)
      markdown << renderer.ul(markdown_resource_links_by_group[group_name])
    end

    markdown
  end

  private

  def namify(n)
    n.capitalize.gsub(/\baws\b/i, "AWS")
  end

  def render_path(path)
    abs = File.join(@root, path)
    raise "Can't find file to render in #{abs}" unless File.file?(abs)

    ERB.new(File.read(abs)).result(binding)
  end
end

namespace :docs do # rubocop:disable Metrics/BlockLength
  desc "Create cli docs"
  task :cli do
    # formatter for the output file
    f = Markdown
    # list of subcommands we ignore; these are e.g. plugins
    skip_commands = %w{scap}

    res = f.meta(title: "About the InSpec CLI")
    res << f.h1("InSpec CLI")
    res << f.p("Use the InSpec CLI to run tests and audits against targets "\
               "using local, SSH, WinRM, or Docker connections.")

    require "inspec/cli"
    cmds = Inspec::InspecCLI.all_commands
    cmds.keys.sort.each do |key|
      next if skip_commands.include? key
      cmd = cmds[key]

      res << f.h2(cmd.usage.split.first)
      res << f.p(cmd.description.capitalize)
      if cmd.long_description
        res << f.p(cmd.long_description)
      end

      res << f.h3("Syntax")
      res << f.p("This subcommand has the following syntax:")
      res << f.code("$ inspec #{cmd.usage}", "bash")

      opts = cmd.options.reject { |_, o| o.hide }
      unless opts.empty?
        res << f.h3("Options") + f.p("This subcommand has additional options:")

        list = ""
        opts.keys.sort.each do |option|
          opt = cmd.options[option]
          # TODO: remove when UX of help is reworked 1.0
          usage = opt.usage.split(", ")
                     .map { |x| x.tr("[]", "") }
                     .map { |x| x.start_with?("-") ? x : "-" + x }
                     .map { |x| "``" + x + "``" }
          list << f.li("#{usage.join(', ')}  \n#{opt.description}")
        end.join
        res << f.ul(list)
      end

      # FIXME: for some reason we have extra lines in our RST; needs investigation
      res << "\n\n" if f == RST
    end

    dst = File.join(DOCS_DIR, "cli#{f.suffix}")
    File.write(dst, res)
    puts "Documentation generated in #{dst.inspect}"
  end

  desc "Create resources docs"
  # This task injects the contrib:cleanup_docs as a followup
  # to the actual doc building.
  task resources: [:resources_actual, :'contrib:cleanup_docs']

  task resources_actual: [:clean, :'contrib:copy_docs'] do
    src = DOCS_DIR
    dst = File.join(WWW_DIR, "source", "docs", "reference", "resources")
    FileUtils.mkdir_p(dst)

    docs = ResourceDocs.new(src)
    resources = Dir.glob([File.join(src, "resources/*.md.erb"), File.join(src, "resources/*.md")])
                   .map { |x| x.sub(/^#{src}/, "") }
                   .sort
    puts "Found #{resources.length} resource docs"
    puts "Rendering docs to #{dst}/"

    # Render all resources
    progressbar = ProgressBar.create(total: resources.length, title: "Rendering")
    resources.each do |file|
      progressbar.log("          " + file)
      dst_name = File.basename(file).sub(/\.md(\.erb)?$/, ".html.md")
      res = docs.render(file)
      File.write(File.join(dst, dst_name), res)
      progressbar.increment
    end
    progressbar.finish

    # Create a resource summary markdown doc
    dst = File.join(src, "resources.md")
    puts "Create #{dst}"
    File.write(dst, docs.overview_page(resources))
  end

  desc "Clean all rendered docs from www/"
  task :clean do
    dst = File.join(WWW_DIR, "source", "docs", "reference")
    puts "Clean up #{dst}"
    FileUtils.rm_rf(dst) if File.exist?(dst)
    FileUtils.mkdir_p(dst)
  end

  desc "Copy fixed doc files"
  task copy: [:clean, :resources] do
    src = DOCS_DIR
    dst = File.join(WWW_DIR, "source", "docs", "reference")
    files = Dir[File.join(src, "*.md")]

    progressbar = ProgressBar.create(total: files.length, title: "Copying")
    files.each do |path|
      name = File.basename(path).sub(/\.md$/, ".html.md")
      progressbar.log("          " + File.join(dst, name))
      FileUtils.cp(path, File.join(dst, name))
      progressbar.increment
    end
    progressbar.finish
  end
end

def run_tasks_in_namespace(ns)
  Rake.application.in_namespace(ns) do |x|
    x.tasks.each do |task|
      puts "----> #{task}"
      task.invoke
    end
  end
end

desc "Create all docs in docs/ from source code"
task :docs do
  run_tasks_in_namespace :docs
  Verify.file(File.join(WWW_DIR, "source", "docs", "reference", "README.html.md"))
  Verify.file(File.join(WWW_DIR, "source", "docs", "reference", "cli.html.md"))
  Verify.file(File.join(WWW_DIR, "source", "docs", "reference", "resources.html.md"))
end
