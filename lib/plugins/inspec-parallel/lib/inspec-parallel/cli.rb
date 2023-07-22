require_relative "command"
require "inspec/dist"
require "inspec/base_cli"
require "inspec/feature"

module InspecPlugins::Parallelism
  class CLI < Inspec.plugin(2, :cli_command)
    include Inspec::Dist

    subcommand_desc "parallel SUBCOMMAND [options]", "Runs #{PRODUCT_NAME} operations parallely"

    desc "exec", "Executes profile parallely"
    option :option_file, aliases: :o, type: :string, required: true,
      desc: "File that contains list of option strings"
    option :dry_run, type: :boolean,
      desc: "Print commands that will run"
    option :verbose, type: :boolean,
      desc: "Prints all thor options on dry run"
    option :jobs, aliases: :j, type: :numeric,
      desc: "Number of jobs to run parallely"
    option :ui, type: :string, default: "status",
      desc: "Which UI to use: status, text, silent"
    option :bg, type: :boolean,
      desc: "Runs parallel processes in background"
    option :log_path, type: :string,
      desc: "Path to the runner and error logs"
    exec_options
    def exec(default_profile = nil)
      Inspec.with_feature("inspec-cli-parallel-exec") {
        parallel_cmd = InspecPlugins::Parallelism::Command.new(options, default_profile)
        if options[:dry_run]
          parallel_cmd.dry_run
        else
          parallel_cmd.run
        end
      }
    end

    desc "split", "Generate an options file for inspec parallel exec by splitting a profile"
    def split(profile_target)
      begin
        # Setup logger
        o = config
        diagnose(o)
        o["log_location"] = $stderr
        configure_logger(o)

        # Process profile using a mock backend - logic lifted from `inspec export`
        o[:backend] = Inspec::Backend.create(Inspec::Config.mock)
        o[:check_mode] = true
        o[:vendor_cache] = Inspec::Cache.new(o[:vendor_cache])
        profile = Inspec::Profile.for_target(profile_target, o)

        # Split profile
        require_relative "profile_splitter"
        ps = InspecPlugins::Parallelism::ProfileSplitter.new(o)
        ps.split(profile)

      rescue StandardError => e
        pretty_handle_exception(e)
      end
    end
  end
end
