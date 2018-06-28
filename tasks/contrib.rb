
# Rake tasks to assist in coordinating operations with separately
# maintained projects.

require 'fileutils'
require 'yaml'
require 'git'

CONTRIB_DIR=File.expand_path(File.join(__dir__, '..', 'contrib')).freeze

namespace :contrib do
  config = nil

  task :read_config do |t|
    config = YAML.load(File.read(File.join(CONTRIB_DIR, 'contrib.yaml')))
  end

  task :fetch_resource_packs => [:read_config] do |t|
    puts "Fetching contrib resource packs..."
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

  desc 'Moves docs from resource packs into the core for doc building'
  task :merge_docs => [:fetch_resource_packs] do |t|
  end
end