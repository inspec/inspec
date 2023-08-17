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
  end
end
