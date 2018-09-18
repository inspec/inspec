# encoding: utf-8
require_relative 'profile'

module InspecPlugins
  module Habitat
    class ProfileCLI < Inspec.plugin(2, :cli_command)
      # Override banner method to correct missing subcommand.
      # @see https://github.com/erikhuda/thor/issues/261
      def self.banner(command, _namespace = nil, _subcommand = false)
        "#{basename} habitat profile #{command.usage}"
      end

      desc 'create PATH', 'Create a one-time Habitat artifact for the profile found at PATH'
      option :output_dir, type: :string, required: false,
        desc: 'Directory in which to save the generated Habitat artifact. Default: current directory'
      def create(path)
        InspecPlugins::Habitat::Profile.create(path, options)
      end

      desc 'setup PATH', 'Configure the profile at PATH for Habitat, including a plan and hooks'
      def setup(path)
        InspecPlugins::Habitat::Profile.setup(path)
      end

      desc 'upload PATH', 'Create a one-time Habitat artifact for the profile found at PATH, and upload it to a Habitat Depot'
      def upload(path)
        InspecPlugins::Habitat::Profile.upload(path, options)
      end
    end

    class CLI < Inspec.plugin(2, :cli_command)
      subcommand_desc 'habitat SUBCOMMAND', 'Manage Habitat with InSpec'
      namespace 'habitat'

      desc 'profile', 'Manage InSpec profiles as Habitat artifacts'
      subcommand 'profile', ProfileCLI
    end
  end
end
