require_relative "exec_command"
require "inspec/dist"
require "inspec/base_cli"

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
      parallel_cmd = InspecPlugins::Parallelism::ExecCommand.new(options, default_profile)
      if options[:dry_run]
        parallel_cmd.dry_run
      else
        parallel_cmd.run
      end
    end

    desc "list", "Generate a list of targets as an option file for `parallel exec`"
    option :resource, aliases: :r, type: :string, required: true,
      desc: "Plural resource to list. See docs for current list of accepted values."
    option :target, aliases: :t, type: :string,
      desc: "Target to connect to for listing resources. If omitted, will be guessed from --resource."
    def list
      require_relative "list_command"
      InspecPlugins::Parallelism::ListCommand.new(options).run
    end
  end
end
