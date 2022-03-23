require_relative "base"
require "inspec/dist"

module InspecPlugins::Parallel
  class CLI < Inspec.plugin(2, :cli_command)
    include Inspec::Dist

    subcommand_desc "parallel SUBCOMMAND", "Runs #{PRODUCT_NAME} operations parallely"

    desc "scan", "Scans profile parallely"
    option :option_file, aliases: :o, type: :string, required: true,
      desc: "File that contains list of option strings"
    def scan(default_profile)
      parallel_base = InspecPlugins::Parallel::Base.new(options)
      parallel_base.run_scan(default_profile)
      ui.warning("This is a generated plugin with a default implementation.")
    end

  end
end