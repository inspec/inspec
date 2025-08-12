require "helper"
require "inspec/utils/licensing_config"

describe "ChefLicensing::Config" do
  it "returns the default chef product name as foo" do
    expect(ChefLicensing::Config.chef_product_name).must_equal("InSpec")
  end

  it "returns the default chef_entitlement_id" do
    expect(ChefLicensing::Config.chef_entitlement_id).must_equal("3ff52c37-e41f-4f6c-ad4d-365192205968")
  end

  it "returns the default chef_executable_name" do
    expect(ChefLicensing::Config.chef_executable_name).must_equal("inspec")
  end

  # TODO: Need to add the test for license_server_url.
end