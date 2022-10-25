require "helper"
require "inspec/resource"
require "inspec/resources/windows_hotfix"

describe "Inspec::Resources::WindowsHotfix" do

  # ubuntu 14.04
  it "fail windows_hotfix fails on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("windows_hotfix", "KB4019215")
    _(resource.installed?).must_equal false
  end

  # windows
  it "generates the resource_id for the current resource" do
    resource = MockLoader.new(:windows).load_resource("windows_hotfix", "KB4019215")
    _(resource.resource_id).must_equal "KB4019215"
  end

  it "verify windows_hotfix installed on windows" do
    resource = MockLoader.new(:windows).load_resource("windows_hotfix", "KB4019215")
    _(resource.installed?).must_equal true
  end

  # windows missing hotfix
  it "verify windows_hotfix not installed on windows" do
    resource = MockLoader.new(:windows).load_resource("windows_hotfix", "KB9999999")
    _(resource.installed?).must_equal false
  end
end
