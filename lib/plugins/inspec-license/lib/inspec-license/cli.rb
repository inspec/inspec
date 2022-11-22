module InspecPlugins::License
  class CLI < Inspec.plugin(2, :cli_command)
    include Inspec::Dist

    subcommand_desc "license SUBCOMMAND [options]", "Fetches #{PRODUCT_NAME} license"
    desc "list", "List licenses"
    def list
      # integrate end point for listing licenses
    end
  end
end
