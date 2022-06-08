require "helper"
require "inspec/resource"
require "inspec/resources/chocolatey_package"

describe "Inspec::Resources::ChocoPkg" do
  it "can parse output from `choco` when package is installed" do
    pkg = { name: "git", installed: false, version: nil, type: "chocolatey" }
    resource = MockLoader.new(:windows).load_resource("chocolatey_package", "git")
    _(resource.resource_id).must_equal "git"
    _(resource.installed?).must_equal pkg[:installed]
    _(resource.version).must_be_nil
    _(resource.info).must_equal pkg
  end

  it "can parse output from `choco` when package not installed" do
    pkg = { name: "nssm", installed: true, version: "2.24.101", type: "chocolatey" }
    resource = MockLoader.new(:windows).load_resource("chocolatey_package", "nssm")
    _(resource.installed?).must_equal pkg[:installed]
    _(resource.version).must_equal pkg[:version]
    _(resource.info).must_equal pkg
  end

  it "gets the resource_id for the current resource" do
     pkg = { name: "nssm", installed: true, version: "2.24.101", type: "chocolatey" }
    resource = MockLoader.new(:windows).load_resource("chocolatey_package", "nssm")
    _(resource.resource_id).must_equal "nssm"
  end
end
