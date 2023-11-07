require "chef-licensing"
module InspecPlugins::License
  class CLI < Inspec.plugin(2, :cli_command)
    include Inspec::Dist

    subcommand_desc "license SUBCOMMAND [options]", "Manage #{PRODUCT_NAME} license"
    desc "list", "List licenses (not applicable to local licensing service)"
    def list
      ChefLicensing.list_license_keys_info
    rescue ChefLicensing::Error => e
      Inspec::Log.error e.message
      Inspec::UI.new.exit(Inspec::UI::EXIT_LICENSE_NOT_SET)
    end

    desc "add", "Add a new license (not applicable to local licensing service)"
    def add
      ChefLicensing.add_license
    rescue ChefLicensing::LicenseKeyFetcher::LicenseKeyAddNotAllowed => e
      Inspec::Log.error e.message
      Inspec::UI.new.exit(Inspec::UI::EXIT_LICENSE_NOT_SET)
    rescue ChefLicensing::Error => e
      Inspec::Log.error e.message
      Inspec::UI.new.exit(Inspec::UI::EXIT_LICENSE_NOT_SET)
    end
  end
end
