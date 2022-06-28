require_relative "base"
module InspecPlugins::Suggest
  class SuggToolCommand < Inspec.plugin(2, :cli_command)

    desc "package SETNAME", "Packages suggestion criteria from a set of source profiles."
    def package(*requested_sets)
      setup(requested_sets)

      with_requested_sets do |setname, set_cfg|
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
            Dir.glob(File.join(@working_dir, path, "suggest", "*.rb")).each do |control_file_path|
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
