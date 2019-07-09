require "fileutils"
require "erb"

module InspecPlugins
  module Init
    class Renderer
      # Creates a renderer able to render the given template type
      # 1. iterate over all files
      # 2. read content in erb
      # 3. write to destination path

      attr_reader :file_rename_map, :overwrite_mode, :skip_files, :templates_path, :ui
      def initialize(cli_ui, options = {})
        @ui = cli_ui
        @overwrite_mode = options[:overwrite]
        @templates_path ||= options[:templates_path]
        @file_rename_map = options[:file_rename_map] || {}
        @skip_files = options[:skip_files] || []
      end

      # rubocop: disable Metrics/AbcSize
      def render_with_values(template_subdir_path, template_type, template_values = {})
        # look for template directory
        source_dir = File.join(templates_path, template_subdir_path)

        # prepare glob for all subdirectories and files
        template_glob = File.join(source_dir, "**", "{*,.*}")

        # Use the name attribute to define the path to the new thing.
        # May contain slashes.
        relative_destination_path = template_values[:name]

        # Now reset the :name variable to be the basename.
        # This is important in profiles, for example.
        template_values[:name] = File.basename(template_values[:name])

        # Generate the full full_destination_path path on disk
        full_destination_path = Pathname.new(Dir.pwd).join(relative_destination_path)

        # check that the directory does not exist
        if File.exist?(full_destination_path) && !overwrite_mode
          ui.plain_line "#{ui.emphasis(full_destination_path)} exists already, use --overwrite"
          ui.exit(:usage_error)
        end

        ui.headline("InSpec Code Generator")

        ui.plain_line "Creating new #{template_type} at #{ui.emphasis(full_destination_path)}"

        # ensure that full_destination_root_path directory is available
        FileUtils.mkdir_p(full_destination_path)

        # iterate over files and write to full_destination_path
        Dir.glob(template_glob) do |source_file|
          relative_destination_item_path = Pathname.new(source_file).relative_path_from(Pathname.new(source_dir)).to_s
          next if skip_files.include? relative_destination_item_path

          relative_destination_item_path = file_rename_map[relative_destination_item_path] || relative_destination_item_path
          full_destination_item_path = Pathname.new(full_destination_path).join(relative_destination_item_path)
          if File.directory?(source_file)
            ui.list_item "Creating directory #{ui.emphasis(relative_destination_item_path)}"
            FileUtils.mkdir_p(full_destination_item_path)
          elsif File.file?(source_file)
            ui.list_item "Creating file #{ui.emphasis(relative_destination_item_path)}"
            # read & render content
            content = render(File.read(source_file), template_values)
            # write file content
            File.write(full_destination_item_path, content)
          else
            ui.warning "Ignoring #{ui.emphasis(source_file)}, because its not an file or directoy"
          end
        end

        ui.plain_line
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
