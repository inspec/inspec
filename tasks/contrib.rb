
# Rake tasks to assist in coordinating operations with separately
# maintained projects.

require 'fileutils'

CONTRIB_DIR=File.expand_path(File.join(__dir__, '..', 'contrib')).freeze

namespace :contrib do
  config = nil

  task :read_config do |t|
  end

  task :fetch_resource_packs => [:read_config] do |t|
  end

  desc 'Moves docs from resource packs into the core for doc building'
  task :merge_docs => [:fetch_resource_packs] do |t|
  end
end