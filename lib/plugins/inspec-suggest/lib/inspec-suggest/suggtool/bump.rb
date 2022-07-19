require_relative "base"

module InspecPlugins::Suggest
  class SuggToolCommand < Inspec.plugin(2, :cli_command)

    option :level, type: :string, default: "patch",
      desc: "Level of the version number to bump. One of: patch, minor, major"

    desc "bump SETNAME", "Increase version number of SETNAME in inspec.yml."
    def bump(*requested_sets)
      setup(requested_sets)

      with_requested_sets do |set_name, set_cfg|
        with_set_metadata_files(set_cfg) do |metadata_file_path|
          bump_version(metadata_file_path)
        end # with_set_metadata_files ends here
      end # with_requested_sets ends here
    end # def bump ends here

    no_commands do
      def bump_version(file_path)
        valid_bump_levels = %w{patch minor major}

        unless valid_bump_levels.include? options[:level]
          ui.error("Invalid bump level '#{options[:level]}'. Valid levels are: #{valid_bump_levels.join(", ")}")
          ui.exit(:usage_error)
        end

        require "yaml" unless defined? YAML
        yaml_data = YAML.load_file(file_path)
        current_version = yaml_data["version"].split(".")

        case options[:level]
        when "patch"
          new_version = current_version[0] + "." + current_version[1] + "." + current_version[2].succ
        when "minor"
          new_version = current_version[0] + "." + current_version[1].succ + ".0"
        when "major"
          new_version = current_version[0].succ + ".0.0"
        end

        # Update the version in yaml_data
        yaml_data["version"] = new_version

        File.open(file_path, "w") do |file|
          file.write(yaml_data.to_yaml)
        end
        ui.info "bump: Bumped #{options[:level]} version of #{file_path} to #{new_version}"
      end
    end
  end
end
