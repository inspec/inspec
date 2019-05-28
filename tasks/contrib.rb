# Rake tasks to assist in coordinating operations with separately
# maintained projects.

require 'fileutils'
require 'yaml'
require 'git'

CONTRIB_DIR=File.expand_path(File.join(__dir__, '..', 'contrib')).freeze
RESOURCE_DOC_DIR=File.expand_path(File.join(__dir__, '..', 'docs', 'resources')).freeze

namespace :contrib do # rubocop: disable Metrics/BlockLength
  config = nil

  task :read_config do
    config = YAML.load(File.read(File.join(CONTRIB_DIR, 'contrib.yaml')))
  end

  task fetch_resource_packs: [:read_config] do
    puts 'Fetching contrib resource packs...'
    config['resource_packs'].each do |name, info|
      clone_path = File.join(CONTRIB_DIR, name)
      git = nil
      verb = nil
      if File.exist?(clone_path)
        git = Git.open(clone_path)
        git.fetch
        verb = 'fetched'
      else
        git = Git.clone(info['git_repo'], name, path: CONTRIB_DIR)
        verb = 'cloned'
      end

      sha = git.log[0].sha[0..6]
      branch = git.current_branch
      puts "  #{name}: #{verb}, now at #{sha}" + (branch ? " (#{branch})" : '')
    end
  end

  desc 'Copy docs from resource packs into the core for doc building'
  task copy_docs: [:fetch_resource_packs] do
    puts 'Copying resource pack docs...'
    config['resource_packs'].each do |name, info|
      doc_sub_dir = info['doc_sub_dir'] || 'docs/resources'
      doc_src_path = File.join(CONTRIB_DIR, name, doc_sub_dir)
      dest_path = RESOURCE_DOC_DIR
      puts "  #{name}:"
      Dir.chdir(doc_src_path) do
        Dir.glob('*.md*').each do |file|
          # TODO: check file for Availability section in markdown?
          FileUtils.cp(file, dest_path)
          puts "    #{file}"
        end
      end
    end
  end

  desc 'Cleanup docs from resource packs in core'
  task cleanup_docs: [:read_config] do
    puts 'Purging resource pack docs...'
    config['resource_packs'].each do |name, info|
      doc_sub_dir = info['doc_sub_dir'] || 'docs/resources'
      doc_src_path = File.join(CONTRIB_DIR, name, doc_sub_dir)
      dest_path = RESOURCE_DOC_DIR
      puts "  #{name}"
      Dir.chdir(doc_src_path) do
        Dir.glob('*.md*').each do |file|
          cruft = File.join(dest_path, file)
          FileUtils.rm_f(cruft)
        end
      end
    end
  end
end
# rubocop enable: Metrics/BlockLength
