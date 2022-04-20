require_relative "command"
require "inspec/dist"
require "inspec/base_cli"

module InspecPlugins::Parallel
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
    exec_options
    def exec(default_profile = nil)
      parallel_cmd = InspecPlugins::Parallel::Command.new(options, default_profile)
      if options[:dry_run]
        parallel_cmd.dry_run
      else
        parallel_cmd.run
      end
      # rescue StandardError => e
      # TBD
    end
  end
end
