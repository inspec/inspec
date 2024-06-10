require "helper"
require "inspec/dependency_loader"

describe "dependency_loader" do
  let(:config_dir_path) { File.expand_path "test/fixtures/config_dirs" }
  let(:gem_list) { [{ name: "inspec-test-fixture", version: "0.1.0" }] }

  def reset_globals
    ENV["HOME"] = Dir.home
  end

  before(:each) do
    reset_globals
    ENV["HOME"] = File.join(config_dir_path, "test-fixture-1-float/gems/3.1.0")
  end

  after(:each) do
    reset_globals
  end

  let(:gem_path) { [ENV["HOME"]] }
  let(:dependency_loader) { Inspec::DependencyLoader.new(gem_path, gem_list) }

  describe "load" do
    it "loads the gem dependency if already installed on the given gem path." do
      result = dependency_loader.load
      _(result).must_equal gem_list
    end

    it "raises error if the gem dependency not exist on the given gem path." do
      dependency_loader.gem_list = [{ name: "test_gem", version: "0.0.1" }]
      err = _ { dependency_loader.load }.must_raise Inspec::GemDependencyLoadError
      _(err.message).must_equal "Unable to resolve dependency: user requested \'test_gem (= 0.0.1)\'"
    end
  end

  describe "gem_installed?" do
    it "returns the list of gems installed if gem already installed" do
      result = dependency_loader.gem_installed?("inspec-test-fixture")
      _(result).must_equal true
    end

    it "returns nil if specified gem is not already installed." do
      result = dependency_loader.gem_installed?("test_gem")
      _(result).must_equal false
    end
  end

  describe "gem_version_installed?" do
    it "returns the list of gems installed if gem with specified version is already installed" do
      result = dependency_loader.gem_version_installed?("inspec-test-fixture", "0.1.0")
      _(result).must_equal true
    end

    it "returns nil if gem with specified version is not already installed." do
      result = dependency_loader.gem_version_installed?("test_gem", "0.0.1")
      _(result).must_equal false
    end
  end
end
