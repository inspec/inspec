require "helper"
require "inspec/resource"
require "inspec/resources/gem"

describe "Inspec::Resources::Gem" do
  it "verify gem is not installed" do
    resource = load_resource("gem", "not-installed")
    _(resource.installed?).must_equal false
  end

  it "verify gem package detail parsing" do
    resource = load_resource("gem", "rubocop")
    pkg = {
      name: "rubocop",
      version: "0.33.0",
      type: "gem",
      installed: true,
      versions: ["0.33.0", "0.32.1", "0.28.0"],
    }
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
    _(resource.gem_binary).must_equal "gem"
    _(resource.resource_id).must_equal "rubocop-0.33.0"
  end

  it "specifying gem binary" do
    resource = load_resource("gem", "pry", "/opt/ruby-2.3.1/embedded/bin/gem")
    pkg = {
      name: "pry",
      version: "0.10.4",
      type: "gem",
      installed: true,
      versions: ["0.10.4"],
    }
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
    _(resource.gem_binary).must_equal "/opt/ruby-2.3.1/embedded/bin/gem"
    _(resource.resource_id).must_equal "pry-0.10.4"
  end

  it "verify gem in :chef" do
    resource = load_resource("gem", "chef-sugar", :chef)
    pkg = {
      name: "chef-sugar",
      version: "3.4.0",
      type: "gem",
      installed: true,
      versions: ["3.4.0"],
    }
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
    _(resource.gem_binary).must_equal "/opt/chef/embedded/bin/gem"
    _(resource.resource_id).must_equal "chef-sugar-3.4.0"
  end

  it "verifies gem in :chef when multiple versions are installed" do
    resource = load_resource("gem", "chef-sugar", :chef)
    _(resource.installed?).must_equal true
    _(resource.versions[0]).must_match(/3\.4/)
    _(resource.versions).wont_include(/2\.4/)
    _(resource.gem_binary).must_equal "/opt/chef/embedded/bin/gem"
    _(resource.resource_id).must_equal "chef-sugar-3.4.0"
  end

  it "verify gem in :chef on windows" do
    resource = MockLoader.new(:windows).load_resource("gem", "json", :chef)
    pkg = {
      name: "json",
      version: "1.8.3",
      type: "gem",
      installed: true,
      versions: ["1.8.3"],
    }
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
    _(resource.gem_binary).must_equal 'c:\opscode\chef\embedded\bin\gem.bat'
    _(resource.resource_id).must_equal "json-1.8.3"
  end

  it "verify gem in :chef_server" do
    resource = load_resource("gem", "knife-backup", :chef_server)
    pkg = {
      name: "knife-backup",
      version: "0.0.12",
      type: "gem",
      installed: true,
      versions: ["0.0.12"],
    }
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
    _(resource.gem_binary).must_equal "/opt/opscode/embedded/bin/gem"
    _(resource.resource_id).must_equal "knife-backup-0.0.12"
  end
end
