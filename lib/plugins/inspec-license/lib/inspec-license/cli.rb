require "chef-licensing"
module InspecPlugins::License
  class CLI < Inspec.plugin(2, :cli_command)
    include Inspec::Dist

    subcommand_desc "license SUBCOMMAND [options]", "Manage #{PRODUCT_NAME} license"
    desc "list", "List licenses"
    def list
      ChefLicensing.list_license_keys_info
    end

    desc "add", "Add a new license"
    def add
      ChefLicensing.add_license
    rescue ChefLicensing::LicenseKeyFetcher::LicenseKeyAddNotAllowed => e
      Inspec::Log.error e.message
      Inspec::UI::EXIT_LICENSE_NOT_SET
    end
  end
end
