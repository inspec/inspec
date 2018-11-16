require 'fileutils'
require 'erb'

module InspecPlugins
  module Init
    class Renderer
      # Creates a renderer able to render the given template type
      # 1. iterate over all files
      # 2. read content in erb
      # 3. write to full_destination_root_path

      attr_reader :overwrite_mode, :templates_path, :ui
      def initialize(cli_ui, cli_options = {})
        @ui = cli_ui
        @overwrite_mode = cli_options[:overwrite]
        @templates_path ||= cli_options[:templates_path]
      end

      # rubocop: disable Metrics/AbcSize
      def render_with_values(template_subdir_path, template_values = {})
        # look for template directory
        base_dir = File.join(templates_path, template_subdir_path)
        # prepare glob for all subdirectories and files
        template_glob = File.join(base_dir, '**', '{*,.*}')
        # Use the name attribute to define the path to the profile.
        profile_path = template_values[:name]
        # Use slashes (\, /) to split up the name into an Array then use the last entry
        # to reset the name of the profile.
        template_values[:name] = template_values[:name].split(%r{\\|\/}).last
        # Generate the full full_destination_root_path path on disk
        full_destination_root_path = Pathname.new(Dir.pwd).join(profile_path)

        # This is a bit gross
        generator_type = template_subdir_path.split(%r{[\/]}).first.sub(/s$/, '')
        ui.plain_text "Create new #{generator_type} at #{ui.mark_text(full_destination_root_path)}"

        # check that the directory does not exist
        if File.exist?(full_destination_root_path) && !overwrite_mode
          ui.plain_text "#{ui.mark_text(full_destination_root_path)} exists already, use --overwrite"
          ui.exit(1)
        end

        # ensure that full_destination_root_path directory is available
        FileUtils.mkdir_p(full_destination_root_path)

        # iterate over files and write to full_destination_root_path
        Dir.glob(template_glob) do |file|
          relative_destination_item_path = Pathname.new(file).relative_path_from(Pathname.new(base_dir))
          full_destination_item_path = Pathname.new(full_destination_root_path).join(relative_destination_item_path)
          if File.directory?(file)
            ui.li "Create directory #{ui.mark_text(relative_destination_item_path)}"
            FileUtils.mkdir_p(full_destination_item_path)
          elsif File.file?(file)
            ui.li "Create file #{ui.mark_text(relative_destination_item_path)}"
            # read & render content
            content = render(File.read(file), template_values)
            # write file content
            File.write(full_destination_item_path, content)
          else
            ui.plain_text "Ignore #{file}, because its not an file or directoy"
          end
        end
      end
      # rubocop: enable Metrics/AbcSize

      # This is a render helper to bind hash values to a ERB template
      # ERB provides result_with_hash in ruby 2.5.0+, which does exactly this
      def render(template_content, hash)
        # create a new binding class
        cls = Class.new do
          hash.each do |key, value|
            define_method key.to_sym do
              value
            end
          end
          # expose binding
          define_method :bind do
            binding
          end
        end
        ERB.new(template_content).result(cls.new.bind)
      end
    end
  end
end
