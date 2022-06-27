require "inspec/resource"

module InspecPlugins::Suggest
  class SuggToolCommand < Inspec.plugin(2, :cli_command)
    subcommand_desc "suggtool [COMMAND]", "Utilities to support `inspec suggest`."

    option :suggest_config, type: :string,
      desc: "Path to suggest.yaml, default is SRC/etc/suggest.yaml"

    desc "package SETNAME", "Packages suggestion criteria from a set of source profiles."
    def package(*requested_sets)

      options[:suggest_config] ||= File.join(Inspec.src_root, "etc", "suggest.yaml")

      # read config
      cfg = YAML.load_file(options[:suggest_config])
      set_names = cfg["sets"].map { |s| s["name"] }
      if requested_sets.empty?
        # Do all
        requested_sets = set_names
      else
        requested_sets.each do |set_name|
          unless set_names.include?(set_name)
            ui.error("Set name '#{set_name}' is not recognized. Known set names: #{set_names.join(", ")}")
            ui.exit(:usage_error)
          end
        end
      end

      # find working directory
      working_dir = File.join(Inspec.src_root, cfg["working_directory"])
      unless File.exist?(working_dir)
        ui.error("Working directory '#{working_dir}' does not exist")
        ui.exit(:usage_error)
      end

      requested_sets.each do |setname|
        set_cfg = cfg["sets"].detect { |s| s["name"] == setname}

        # TODO - some kind of init command?
        # find set output profile directory
        out_profile_dir = File.join(Inspec.src_root, "etc", "suggest", setname)
        unless File.exist?(out_profile_dir)
          ui.error("Output profile directory '#{out_profile_dir}' does not exist")
          ui.exit(:usage_error)
        end

        # TODO: fetch command?

        # Open set suggestion file - truncate
        criteria_out_file = File.join(out_profile_dir, "controls", "criteria.rb")
        ui.info("Writing to criteria file #{criteria_out_file.sub(Inspec.src_root + "/", "")}")
        File.open(criteria_out_file, "w") do |set_suggestion_file|

          # find set source directory
          # for each subdir glob
          # look for suggest folder
          # read any .rb files
          set_cfg["paths"].each do |path|
            Dir.glob(File.join(working_dir, path, "suggest", "*.rb")).each do |control_file_path|
              ui.info("found #{control_file_path.sub(Inspec.src_root + "/", "")}")
              # append them to the set suggestion file
              File.open(control_file_path) do |control_file|
                # TODO - run a check command on the file?
                control_file.readlines.each do |line|
                  set_suggestion_file.write(line)
                end
                set_suggestion_file.write("\n")
              end
            end
          end # each path
        end # file open
        # TODO - sign the file?
      end # each set
    end # def package
  end
end
