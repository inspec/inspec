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

require "fileutils"

DOCS_DIR = "docs-chef-io/content/inspec".freeze

MENU_MD = <<~MENU.freeze
+++
title = "InSpec CLI"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "InSpec Executable"
    identifier = "inspec/reference/cli.md InSpec Executable"
    parent = "inspec/reference"
    weight = 10
+++

MENU

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

    def dl(msg)
      "<dl>\n#{msg}</dl>\n\n"
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
      "+++\n#{o}\n+++\n\n"
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

namespace :docs do # rubocop:disable Metrics/BlockLength
  desc "Create cli docs"
  task :cli do
    # formatter for the output file
    f = Markdown
    # list of subcommands we ignore; these are e.g. plugins
    skip_commands = %w{scap}

    res = ""
    res << MENU_MD
    res << f.p("<!-- markdownlint-disable MD024 -->\n\nUse the InSpec Command Line Interface (CLI) to run tests and audits against targets "\
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
      res << f.code("inspec #{cmd.usage}", "bash")

      opts = cmd.options.reject { |_, o| o.hide }
      unless opts.empty?
        res << f.h3("Options") + f.p("This subcommand has the following additional options:")

        list = ""
        opts.keys.sort.each do |option|
          opt = cmd.options[option]
          # TODO: remove when UX of help is reworked 1.0
          usage = opt.usage.split(", ")
            .map { |x| x.tr("[]", "") }
            .map { |x| x.start_with?("-") ? x : "-" + x }
            .map { |x| "<code>" + x + "</code>" }
          msg = "<dt>#{usage.join(", ")}</dt>\n"
          msg << "<dd>#{opt.description}</dd>\n\n" if opt.description && !opt.description.empty?
          list << msg
        end.join
        res << f.dl(list)
      end

      # FIXME: for some reason we have extra lines in our RST; needs investigation
      res << "\n\n" if f == RST
    end

    dst = File.join(pwd, DOCS_DIR , "cli#{f.suffix}")
    File.write(dst, res)
    puts "Documentation generated in #{dst.inspect}"
  end
end

# NOTE: Many of the docs tasks were removed in PR #6367 (https://github.com/inspec/inspec/pull/6367)
