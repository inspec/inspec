require_relative "../log"
require "chef-licensing"
ChefLicensing.configure do |config|
  config.chef_product_name = "InSpec"
  config.chef_entitlement_id = "3ff52c37-e41f-4f6c-ad4d-365192205968"
  config.chef_executable_name = "inspec"
  config.license_server_url = ENV["CHEF_LICENSE_SERVER"] || "https://services.chef.io/licensing"
  config.logger = Inspec::Log
end

def configure_licensing_config_for_kitchen(opts = {})
  ChefLicensing.configure do |config|
    # Reset entitlement ID to the ID of Chef Workstation
    config.chef_entitlement_id = "x6f3bc76-a94f-4b6c-bc97-4b7ed2b045c0"
    # Reset Chef License server via kitchen when passed in kitchen.yml
    opts["chef_license_server"] = opts["chef_license_server"].join(",") if opts["chef_license_server"].is_a? Array
    unless opts["chef_license_server"].nil? || opts["chef_license_server"].empty?
      ENV["CHEF_LICENSE_SERVER"] = opts["chef_license_server"]
    end
  end
  # Reset Chef License key via kitchen when passed in kitchen.yml
  ENV["CHEF_LICENSE_KEY"] = opts["chef_license_key"] if opts["chef_license_key"]
end