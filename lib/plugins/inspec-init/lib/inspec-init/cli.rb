# encoding: utf-8

require 'pathname'
require_relative 'renderer'

module InspecPlugins
  module Init
    class CLI < Inspec.plugin(2, :cli_command)
      subcommand_desc 'init SUBCOMMAND', 'Generate InSpec code'

      #-------------------------------------------------------------------#
      #                     inspec init profile
      #-------------------------------------------------------------------#
      def self.valid_profile_platforms
        # Look in the 'template/profiles' directory and detect which platforms are available.
        profile_templates_dir = File.join(File.dirname(__FILE__), 'templates', 'profiles')
        Dir.glob(File.join(profile_templates_dir, '*')).select { |p| File.directory?(p) }.map { |d| File.basename(d) }
      end

      no_commands do
        def valid_profile_platforms
          self.class.valid_profile_platforms
        end
      end

      desc 'profile [OPTIONS] NAME', 'Generate a new profile'
      option :platform, default: 'os', type: :string, aliases: [:p],
             desc: "Which platform to generate a platform for: choose from #{valid_profile_platforms.join(', ')}"
      option :overwrite, type: :boolean, default: false,
             desc: 'Overwrites existing directory'
      def profile(new_profile_name)
        unless valid_profile_platforms.include?(options[:platform])
          puts "Unable to generate profile: No template available for platform '#{options[:platform]}' (expected one of: #{valid_profile_platforms.join(', ')})"
          exit 1
        end
        template_path = File.join('profiles', options[:platform])
        renderer = InspecPlugins::Init::Renderer.new(self, options)
        renderer.render_with_values(template_path, name: new_profile_name)
      end
    end
  end
end
