module InspecPlugins::Suggest
  class CliCommand < Inspec.plugin(2, :cli_command)
    # This isn't provided by Thor, but is needed by InSpec so that it can
    # register the top-level subcommand.  That is to say, subcommand_desc
    # makes `inspec my-command ...` work.  Args to sub_command_desc are
    # a usage message, and a short decription.
    # These will appear when someone has installed the plugin, and then they
    # run `inspec help`.
    # Note: if you want your command (or subcommand) to have dashes in it,
    # use underscores where you want a dash, and Thor will convert them.
    # Thor will fail to find a command that is directly named with dashes.
    subcommand_desc "suggest [COMMAND]", "Recommend which profiles should be run on the target system"

    # The usual rhythm for a Thor CLI file is description, options, command method.
    # Thor just has you call DSL methods in sequence prior to each command.

    # Let's make a command, 'do_something'. This will then be available
    # as `inspec my-command do-something`
    # (Change this method name to be something sensible for your plugin.)

    # First, provide a usage / description. This will appear
    # in `inspec help my-command`.
    # As this is a usage message, you should write the command as it should appear
    # to the user (if you want it to have dashes, use dashes)
    desc "profiles [OPTIONS]", "Recommends which profiles should be run on the target system"

    option :target, aliases: :t, type: :string,
      desc: "Simple targeting option using URIs, e.g. ssh://user:pass@host:port"
    option :reporter, type: :array,
      banner: "suggest-progress suggest-text",
      desc: "Enable one or more output reporters: suggest-progress, suggest-debug, suggest-text"

    # OK, now the actual method itself. If you provide params, you're telling Thor that
    # you accept CLI arguments after all options have been consumed.
    def profiles(*requested_sets)
      # TODO: allow cfg path to be overridden
      cfg = YAML.load_file(File.join(Inspec.src_root, "etc", "suggest.yaml"))

      # Get list of sets
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

      # TODO: consider signed profiles
      profiles = requested_sets.map { |s| File.join(Inspec.src_root, "etc", "suggest", s) }

      exec_args = []
      exec_args << ["-t", options[:target]] if options[:target]
      exec_args << ["--reporter", options[:reporter] ? options[:reporter] : ["suggest-progress", "suggest-text"]]

      arguments = ["exec", profiles, exec_args].flatten
      Inspec::InspecCLI.start(arguments, enforce_license: true)

    end

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
  end # class
end # module
