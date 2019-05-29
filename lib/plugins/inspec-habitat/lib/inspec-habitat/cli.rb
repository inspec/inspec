require_relative 'profile'
require 'inspec/dist'

module InspecPlugins
  module Habitat
    class ProfileCLI < Inspec.plugin(2, :cli_command)
      # Override banner method to correct missing subcommand.
      # @see https://github.com/erikhuda/thor/issues/261
      def self.banner(command, _namespace = nil, _subcommand = false)
        "#{basename} habitat profile #{command.usage}"
      end

      desc 'create PATH', 'Create a Habitat artifact for the profile found at PATH'
      option :output_dir, type: :string, required: false,
        desc: 'Output directory for the Habitat artifact. Default: current directory'
      def create(path = '.')
        InspecPlugins::Habitat::Profile.new(path, options).create
      end

      desc 'setup PATH', 'Configure the profile at PATH for Habitat, including a plan and hooks'
      def setup(path = '.')
        InspecPlugins::Habitat::Profile.new(path, options).setup
      end

      desc 'upload PATH', 'Create then upload a Habitat artifact for the profile found at PATH to the Habitat Builder Depot'
      def upload(path = '.')
        InspecPlugins::Habitat::Profile.new(path, options).upload
      end
    end

    class CLI < Inspec.plugin(2, :cli_command)
      include Inspec::Dist

      subcommand_desc 'habitat SUBCOMMAND', "Manage Habitat with #{PRODUCT_NAME}"
      namespace 'habitat'

      desc 'profile', "Manage #{PRODUCT_NAME} profiles as Habitat artifacts"
      subcommand 'profile', ProfileCLI
    end
  end
end
