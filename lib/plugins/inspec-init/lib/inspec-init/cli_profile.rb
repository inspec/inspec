require 'pathname'
require_relative 'renderer'

module InspecPlugins
  module Init
    class CLI < Inspec.plugin(2, :cli_command)
      #-------------------------------------------------------------------#
      #                     inspec init profile
      #-------------------------------------------------------------------#
      def self.valid_profile_platforms
        # Look in the 'template/profiles' directory and detect which platforms are available.
        profile_templates_dir = File.join(TEMPLATES_PATH, 'profiles')
        Dir.glob(File.join(profile_templates_dir, '*')).select { |p| File.directory?(p) }.map { |d| File.basename(d) }
      end

      no_commands do
        def valid_profile_platforms
          self.class.valid_profile_platforms
        end
      end

      desc 'profile [OPTIONS] NAME', 'Generate a new profile'
      option :platform, default: 'os', type: :string, aliases: [:p],
             desc: "Which platform to generate a profile for: choose from #{valid_profile_platforms.join(', ')}"
      option :overwrite, type: :boolean, default: false,
             desc: 'Overwrites existing directory'
      def profile(new_profile_name)
        unless valid_profile_platforms.include?(options[:platform])
          ui.error "Unable to generate profile: No template available for platform '#{options[:platform]}' (expected one of: #{valid_profile_platforms.join(', ')})"
          ui.exit(:usage_error)
        end
        template_path = File.join('profiles', options[:platform])

        render_opts = {
          templates_path: TEMPLATES_PATH,
          overwrite: options[:overwrite],
        }
        renderer = InspecPlugins::Init::Renderer.new(ui, render_opts)

        vars = {
          name: new_profile_name,
        }
        renderer.render_with_values(template_path, 'profile', vars)
      end
    end
  end
end
