require_relative "base"

module InspecPlugins::Suggest
  class SuggToolCommand < Inspec.plugin(2, :cli_command)

    option :patch, type: :boolean, default: true,
      desc: "Increase third digit of the version number"
    option :minor, type: :boolean, default: false,
      desc: "Increase second digit of the version number"
    option :major, type: :boolean, default: false,
      desc: "Increase first digit of the version number"

    desc "bump SETNAME", "Increase version number of SETNAME in inspec.yml."
    def bump(*requested_sets)
      setup(requested_sets)

      with_requested_sets do |set_name, set_cfg|
        with_matching_yaml_files(set_cfg) do |control_file_path|
          # TODO: We may not need the full path here.
          file_info = {
            full_path: control_file_path,
            rel_path: control_file_path.sub(Inspec.src_root + "/", ""),
          }
          bump_version(file_info[:rel_path])
        end # with_matching_yaml_files ends here
      end # with_requested_sets ends here
    end # def bump ends here

    no_commands do
      def bump_version(file_path)
        require "yaml" unless defined? YAML
        yaml_data = YAML.load_file(file_path)

        current_version = yaml_data["version"].split(".")

        new_version = ""
        bump_label = ""
        if options[:major]
          # bump major version
          bump_label = "Major"
          new_version = increase_version(current_version[0]) + "." + current_version[1] + "." + current_version[2]
        elsif options[:minor]
          # bump minor version
          bump_label = "Minor"
          new_version = current_version[0] + "." + increase_version(current_version[1]) + "." + current_version[2]
        else
          # bump patch version
          bump_label = "Patch"
          new_version = current_version[0] + "." + current_version[1] + "." + increase_version(current_version[2])
        end

        # Update the version in yaml_data
        yaml_data["version"] = new_version

        File.open(file_path, "w") do |file|
          file.write(yaml_data.to_yaml)
        end
        ui.info "Bumped:#{bump_label} version of #{file_path} to #{new_version}"
      end

      def increase_version(version)
        Gem::Version.new(version).bump.to_s
      end
    end
  end
end
