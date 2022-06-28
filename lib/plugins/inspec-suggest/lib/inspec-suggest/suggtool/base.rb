module InspecPlugins::Suggest
  class SuggToolCommand < Inspec.plugin(2, :cli_command)
    subcommand_desc "suggtool [COMMAND]", "Utilities to support `inspec suggest`."

    class_option :suggest_config, type: :string,
      desc: "Path to suggest.yaml, default is SRC/etc/suggest.yaml"

    # subcommand_desc "suggtool [COMMAND]", "Utilities to support `inspec suggest`."
    no_commands do
      def setup(requested_sets)
        options[:suggest_config] ||= File.join(Inspec.src_root, "etc", "suggest.yaml")

        # read config
        @cfg = YAML.load_file(options[:suggest_config])
        set_names = @cfg["sets"].keys
        if requested_sets.empty?
          # Do all
          @requested_sets = set_names
        else
          @requested_sets.each do |set_name|
            unless set_names.include?(set_name)
              ui.error("Set name '#{set_name}' is not recognized. Known set names: #{set_names.join(", ")}")
              ui.exit(:usage_error)
            end
          end
          @requested_sets = requested_sets
        end

        # find working directory
        @working_dir = File.join(Inspec.src_root, @cfg["working_directory"])
        unless File.exist?(@working_dir)
          ui.error("Working directory '#{@working_dir}' does not exist")
          ui.exit(:usage_error)
        end
      end

      def with_requested_sets(&block)
        @cfg["sets"].each do |set_name, set_cfg|
          next unless @requested_sets.include? set_name
          yield(set_name, set_cfg)
        end
      end
    end

    # suggtool build # fetch, check, package, bump, sign
  end
end
