# encoding: utf-8
# author: Adam Leff

require 'thor'

module Habitat
  class HabitatProfileCLI < Thor
    namespace 'habitat profile'

    desc 'create PATH', 'Create a Habitat artifact for the profile found at PATH'
    option :output_dir, type: :string, required: false,
      desc: 'Directory in which to save the generated Habitat artifact. Default: current directory'
    def create(path)
      Habitat::Profile.create(path, options)
    end

    desc 'upload PATH', 'Create a Habitat artifact for the profile found at PATH, and upload it to a Habitat Depot'
    def upload(path)
      Habitat::Profile.upload(path, options)
    end
  end

  class HabitatCLI < Inspec::BaseCLI
    namespace 'habitat'

    desc 'profile', 'Manage InSpec profiles as Habitat artifacts'
    subcommand 'profile', HabitatProfileCLI
  end

  Inspec::Plugins::CLI.add_subcommand(HabitatCLI, 'habitat', 'habitat SUBCOMMAND ...', 'Commands for InSpec + Habitat Integration', {})
end
