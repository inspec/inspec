require "helper"
require "inspec/globals"
require "inspec/utils/install_context"

def assert_install_contexts(test_obj, test_expected_to_be_true, also_rubygem)
  should_be_false = %w{chef-workstation chefdk docker
                     habitat omnibus rubygem source}
  should_be_false -= [test_expected_to_be_true]
  should_be_false = should_be_false.map { |m| "#{m}_install?".tr("-", "_").to_sym }
  should_be_false -= [:rubygem_install?] if also_rubygem
  should_be_false.each { |m| _(test_obj).wont_be(m) }

  should_be_true   = ["#{test_expected_to_be_true}_install?".tr("-", "_").to_sym]
  should_be_true  += [:rubygem_install?] if also_rubygem
  should_be_true.each { |m| _(test_obj).must_be(m) }

  expect(test_obj.guess_install_context).must_equal test_expected_to_be_true
end

class InstallContextTester
  include Inspec::InstallContextHelpers
  attr_accessor :src_root, :dummy_paths
  def initialize(src_root: "", dummy_paths: [])
    @src_root = src_root
    @dummy_paths = dummy_paths
  end

  def path_exist?(path)
    if dummy_paths.empty?
      File.exist? path
    else
      dummy_paths.include? path
    end
  end
end

describe Inspec::InstallContextHelpers do

  parallelize_me!

  describe "when it looks like a Docker installation" do
    it "should properly detect a Docker install" do
      test_obj = InstallContextTester.new(
        src_root: "/somewhere/gems/inspec-4.18.39", dummy_paths: [ "/etc/alpine-release", "/.dockerenv" ]
      )
      assert_install_contexts(test_obj, "docker", true)
    end
  end

  describe "when it looks like a Habitat installation" do
    it "should properly detect a habitat install" do
      test_obj = InstallContextTester.new(src_root: "/hab/pkgs/chef/inspec/4.18.61/20200121194907/lib/gems/inspec-4.18.61")
      assert_install_contexts(test_obj, "habitat", true)
    end
  end

  describe "when it looks like a gem installation" do
    it "should properly detect a rubygem install" do
      test_obj = InstallContextTester.new(src_root: "/Users/alice/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/inspec-4.18.61")
      assert_install_contexts(test_obj, "rubygem", true)
    end
  end

  describe "when it looks like a source installation" do
    it "should properly detect a source install" do
      fake_root = "/Users/alice/src/inspec"
      test_obj = InstallContextTester.new(
        src_root: fake_root,
        dummy_paths: [ "#{fake_root}/habitat", "#{fake_root}/test" ]
      )
      assert_install_contexts(test_obj, "source", false)
    end
  end

  {
    "Windows" => "C:/opscode",
    "Unix-like" => "/opt",
  }.each do |os_name, inst_dir|
    describe "when on #{os_name} machines" do
      {
        "chef-workstation" => "chef-workstation",
        "chefdk" => "chef-dk",
        "omnibus" => "inspec",
      }.each do |inst_mode, inst_subdir|
        describe "when it looks like a #{inst_mode} installation" do
          it "should properly detect a #{os_name} #{inst_mode} install" do
            test_obj = InstallContextTester.new(src_root: "#{inst_dir}/#{inst_subdir}/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.18.39")
            assert_install_contexts(test_obj, inst_mode, true)
          end
        end
      end
    end
  end
end
