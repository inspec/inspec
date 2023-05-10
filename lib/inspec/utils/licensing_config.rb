require "chef-licensing"
ChefLicensing.configure do |config|
  config.chef_product_name = "Inspec"
  config.chef_entitlement_id = "3ff52c37-e41f-4f6c-ad4d-365192205968"
  config.chef_executable_name = "inspec"
end
