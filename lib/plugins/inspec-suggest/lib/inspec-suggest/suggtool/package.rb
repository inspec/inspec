require_relative "base"
require "stringio" unless defined?(StringIO)

module InspecPlugins::Suggest
  class SuggToolCommand < Inspec.plugin(2, :cli_command)

    option :skip_metadata, type: :boolean, default: false,
      desc: "Skip extracting the metadata file from an existing IAF file"

    desc "package SETNAME", "Packages suggestion criteria from a set of source profiles."
    def package(*requested_sets)
      setup(requested_sets)

      with_requested_sets do |setname, set_cfg|
        # Create temp working directory
        out_profile_dir = File.join(@working_dir, "profiles", setname)
        FileUtils.mkdir_p(out_profile_dir)
        FileUtils.mkdir_p(File.join(out_profile_dir, "controls"))

        unpack_existing_metadata_file(setname, out_profile_dir) unless options[:skip_metadata]

        # Open set suggestion file - truncate
        criteria_out_file = File.join(out_profile_dir, "controls", "criteria.rb")
        ui.info("package: Writing to criteria file #{criteria_out_file.sub(Inspec.src_root + "/", "")}")
        File.open(criteria_out_file, "w") do |set_suggestion_file|
          with_matching_files(set_cfg) do |control_file_path|
            ui.info("package: found #{control_file_path.sub(Inspec.src_root + "/", "")}")
            # append them to the set suggestion file
            File.open(control_file_path) do |control_file|
              control_file.readlines.each do |line|
                set_suggestion_file.write(line)
              end
              set_suggestion_file.write("\n")
            end
          end # each path
        end # file open
      end # each set
    end # def package

    no_commands do
      def unpack_existing_metadata_file(set_name, out_profile_dir)
        # Find existing IAF file
        iaf_file = iaf_path(set_name)

        # Run inspec export to export metadata YAML file to tmp directory
        old_stdout = $stdout
        captured_stdout = $stdout = StringIO.new
        begin
          Inspec::InspecCLI.start(["export", "--format", "yaml", "--what", "metadata", iaf_file])
        rescue Exception => e
          # Could be anything - a missing verification key, who knows.
          $stdout = old_stdout
          ui.error "Failed to extract metadata from suggestion criteria library '#{iaf_file}'"
          ui.error e.message
          ui.error captured_stdout.string
          ui.exit :usage_error
        end
        $stdout = old_stdout

        File.write(File.join(out_profile_dir, "inspec.yml"), captured_stdout.string)
        ui.info "package: Extracted inspec.yml from #{iaf_file.sub(Inspec.src_root + "/", "")}"
      end
    end
  end
end
