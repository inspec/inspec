require "helper"
require "inspec/resource"
require "inspec/resources/timezone"

describe "Inspec::Resources::TimeZone" do
  it "verify time configurations" do
    resource = MockLoader.new(:centos7).load_resource("timezone")
    _(resource.identifier).must_equal "Asia/Kolkata"
    _(resource.name).must_equal "IST"
    _(resource.time_offset).must_equal "+0530"
    _(resource.stderr).must_equal ""
  end

  it "verify time configurations" do
    resource = MockLoader.new(:windows).load_resource("timezone")
    _(resource.identifier).must_equal "(UTC+05:30) Chennai, Kolkata, Mumbai, New Delhi"
    _(resource.name).must_equal "India Standard Time"
    _(resource.time_offset).must_equal "05:30:00"
    _(resource.stderr).must_equal ""
  end
end
