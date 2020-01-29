require "helper"
require "inspec/globals"
require "inspec/utils/install_context"

def assert_install_contexts(test_expected_to_be_true, also_rubygem)
  should_be_false = %w{chef-workstation chefdk docker
                     habitat omnibus rubygem source}
  should_be_false -= [test_expected_to_be_true]
  should_be_false = should_be_false.map { |m| "#{m}_install?".tr("-", "_").to_sym }
  should_be_false -= [:rubygem_install?] if also_rubygem
  should_be_false.each { |m| expect(Inspec.send(m)).must_equal false }

  should_be_true   = ["#{test_expected_to_be_true}_install?".tr("-", "_").to_sym]
  should_be_true  += [:rubygem_install?] if also_rubygem
  should_be_true.each { |m| expect(Inspec.send(m)).must_equal true }

  expect(Inspec.guess_install_context).must_equal test_expected_to_be_true
end

describe Inspec::InstallContextHelpers do
  describe "when it looks like a Docker installation" do
    before do
      Inspec.expects(:src_root).at_least_once.returns("/somewhere/gems/inspec-4.18.39")
      File.expects(:exist?).at_least_once.with("/etc/alpine-release").returns(true)
      File.expects(:exist?).at_least_once.with("/.dockerenv").returns(true)
    end

    it "should properly detect a Docker install" do
      assert_install_contexts("docker", true)
    end
  end

  describe "when it looks like a Habitat installation" do
    before do
      Inspec.expects(:src_root).at_least_once.returns("/hab/pkgs/chef/inspec/4.18.61/20200121194907/lib/gems/inspec-4.18.61")
    end

    it "should properly detect a habitat install" do
      assert_install_contexts("habitat", true)
    end
  end

  describe "when it looks like a gem installation" do
    before do
      Inspec.expects(:src_root).at_least_once.returns("/Users/alice/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/inspec-4.18.61")
    end

    it "should properly detect a rubygem install" do
      assert_install_contexts("rubygem", true)
    end
  end

  describe "when it looks like a source installation" do
    before do
      fake_root = "/Users/alice/src/inspec"
      Inspec.expects(:src_root).at_least_once.returns(fake_root)
      Dir.expects(:exist?).with("#{fake_root}/habitat").at_least_once.returns(true)
      Dir.expects(:exist?).with("#{fake_root}/test").at_least_once.returns(true)
    end

    it "should properly detect a source install" do
      assert_install_contexts("source", false)
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
          before do
            Inspec.expects(:src_root).at_least_once.returns("#{inst_dir}/#{inst_subdir}/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.18.39")
          end
          it "should properly detect a #{os_name} #{inst_mode} install" do
            assert_install_contexts(inst_mode, true)
          end
        end
      end
    end
  end
end
