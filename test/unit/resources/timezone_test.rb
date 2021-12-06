require "helper"
require "inspec/resource"
require "inspec/resources/timezone"

describe "Inspec::Resources::TimeZone" do
  it "verify time configurations" do
    resource = MockLoader.new(:centos7).load_resource("timezone")
    _(resource.identifier).must_equal "Asia/Kolkata"
    _(resource.abbreviation).must_equal "IST"
    _(resource.time_offset).must_equal "+0530"
    _(resource.stderr).must_equal ""
  end
end
