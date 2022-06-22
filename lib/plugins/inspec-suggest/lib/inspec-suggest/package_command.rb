require "inspec/resource"

module InspecPlugins::Suggest
  class PackageCommand < Inspec.plugin(2, :cli_command)
    subcommand_desc "suggest-package [COMMAND]", "Package criteria for use by `inspec suggest`."

    desc "package SETNAME", "Packages suggestion criteria from a set of source profiles."
    def package(setname)

      # read config
      cfg = YAML.load_file(File.join(Inspec.src_root, "etc", "suggest.yaml"))

      # find set output profile directory
      out_profile_dir = File.join(Inspec.src_root, "etc", "suggest", setname)
      unless File.exist?(out_profile_dir)
        ui.error("Output profile directory '#{out_profile_dir}' does not exist")
        ui.exit(:usage_error)
      end

      set_cfg = cfg["sets"].detect { |s| s["name"] == setname}

      unless(set_cfg)
        ui.error("No set named '#{setname}' in config")
        ui.exit(:usage_error)
      end

      # TODO: git clone if needed
      # find working directory
      working_dir = File.join(Inspec.src_root, cfg["working_directory"])
      unless File.exist?(working_dir)
        ui.error("Working directory '#{working_dir}' does not exist")
        ui.exit(:usage_error)
      end

      # Open set suggestion file - truncate
      criteria_out_file = File.join(out_profile_dir, "controls", "criteria.rb")
      ui.info("Writing to criteria file #{criteria_out_file}")
      File.open(criteria_out_file, "w") do |set_suggestion_file|

        # find set source directory
        # for each subdir glob
        # look for suggest folder
        # read any .rb files
        set_cfg["paths"].each do |path|
          Dir.glob(File.join(working_dir, path, "suggest", "*.rb")).each do |control_file_path|
            ui.info("found #{control_file_path}")
            # append them to the set suggestion file
            File.open(control_file_path) do |control_file|
              control_file.readlines.each do |line|
                set_suggestion_file.write(line)
              end
            end
          end
        end # each path
      end # file open
    end # def package
  end
end
