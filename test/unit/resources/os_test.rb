require "helper"
require "inspec/resource"
require "inspec/resources/os"
require "helpers/rspec_comparison_helper"

describe "Inspec::Resources::Os" do
  include RspecComparisonHelper

  it "verify os parsing on CentOS" do
    resource = MockLoader.new(:centos7).load_resource("os")
    _(resource.resource_id).must_equal "centos"
    _(resource.name).must_equal "centos"
    _(resource.family).must_equal "redhat"
    _(resource.release).must_equal "7.1.1503"
    _(resource.arch).must_equal "x86_64"
  end

  it "read env variable on Windows" do
    resource = MockLoader.new(:windows).load_resource("os")
    _(resource.resource_id).must_equal "windows"
    _(resource.name).must_equal "windows"
    _(resource.family).must_equal "windows"
    _(resource.release).must_equal "6.2.9200"
    _(resource.arch).must_equal "x86_64"
  end

  it "verify os parsing on Debian" do
    resource = MockLoader.new(:debian8).load_resource("os")
    _(resource.resource_id).must_equal "debian"
    _(resource.name).must_equal "debian"
    _(resource.family).must_equal "debian"
    _(resource.release).must_equal "8"
    _(resource.arch).must_equal "x86_64"
  end

  it "verify os parsing on Ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("os")
    _(resource.name).must_equal "ubuntu"
    _(resource.family).must_equal "debian"
    _(resource.release).must_equal "22.04"
    _(resource.arch).must_equal "x86_64"
  end

  it "verify os parsing on Mint" do
    resource = MockLoader.new(:mint18).load_resource("os")
    _(resource.name).must_equal "linuxmint"
    _(resource.family).must_equal "debian"
    _(resource.release).must_equal "18"
    _(resource.arch).must_equal "x86_64"
  end
  it "verify version components and dot notation" do
    resource = MockLoader.new(:macos10_10).load_resource("os")
    # Test component access
    _(resource.version(:major)).must_equal 10
    _(resource.version(:minor)).must_equal 15
    _(resource.version(:patch)).must_equal 7
    _(resource.version(:build)).must_equal "24D60"
    _(resource.version(:full)).must_equal "10.15.7+24D60"

    # Test dot notation
    _(resource.version.major).must_equal 10
    _(resource.version.full).must_equal "10.15.7+24D60"
  end

  it "handles versions without build numbers" do
    resource = MockLoader.new(:centos7).load_resource("os")
    _(resource.version(:major)).must_equal 7
    _(resource.version(:minor)).must_equal 1
    _(resource.version(:patch)).must_equal 1503
    _(resource.version(:build)).must_be_nil
  end

  it "accepts both string and symbol parameters" do
    resource = MockLoader.new(:macos10_10).load_resource("os")
    _(resource.version("major")).must_equal 10
    _(resource.version(:major)).must_equal 10
    _(resource.version("MAJOR")).must_equal 10
  end

  it "properly implements equality" do
    resource1 = MockLoader.new(:centos7).load_resource("os")
    resource2 = MockLoader.new(:centos7).load_resource("os")

    # Test eql? and hash consistency
    _(resource1.version).must_equal resource2.version
    _(resource1.version.hash).must_equal resource2.version.hash
    _([resource1.version, resource2.version].uniq.length).must_equal 1
  end

  it "supports all comparison operators" do
    resource = MockLoader.new(:centos7).load_resource("os")
    version = resource.version

    # Test all Comparable operators
    assert_operator version, :<, "7.2"
    assert_operator version, :<=, "7.1.1503"
    assert_operator version, :>, "7.1"
    assert_operator version, :>=, "7.1.1503"
    assert_operator version, :==, "7.1.1503"

    # Test between? method
    assert version.between?("7.1", "7.2")
    # skipcq: RB-RL1045
    refute version.between?("7.2", "7.3")
  end

  it "returns full version string correctly for macOS and Ubuntu" do
    macos = MockLoader.new(:macos10_10).load_resource("os")
    ubuntu = MockLoader.new(:ubuntu).load_resource("os")
    # For macOS, to_s returns only the base version while :full returns the complete version string.
    _(macos.version.to_s).must_equal "10.15.7"
    _(macos.version(:full)).must_equal "10.15.7+24D60"
    # For Ubuntu without build, both to_s and :full return the same value.
    _(ubuntu.version.to_s).must_equal "22.04"
    _(ubuntu.version(:full)).must_equal "22.04"
  end

  it "works with cmp matcher" do
    resource = MockLoader.new(:centos7).load_resource("os")
    version = resource.version

    _(resource.version).must_be_kind_of Inspec::Resources::OSResource::VersionWrapper

    assert_cmp(version.to_s, :==, "7.1.1503")
    assert_cmp(version.to_s, :<,  "7.2")

    refute_cmp(version.to_s, :==, "6.0")
    refute_cmp(version.to_s, :==, "8.0")
  end
end
