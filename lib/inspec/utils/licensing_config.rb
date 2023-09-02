require_relative "../log"
require "chef-licensing"

def configure_chef_licensing(opts = {})
  ChefLicensing.configure do |config|
    config.chef_product_name = "InSpec"
    config.chef_entitlement_id = "3ff52c37-e41f-4f6c-ad4d-365192205968"
    config.chef_executable_name = "inspec"
    config.license_server_url_in_config_file = true if opts["chef_license_server"]
    config.license_server_url = opts["chef_license_server"] || "https://licensing.chef.co/License"
    config.chef_license_key = opts["chef_license_key"] if opts["chef_license_key"]
    config.logger = Inspec::Log
  end
end
