require_relative "../helper"
require "tmpdir" unless defined?(Dir.mktmpdir)

describe "inspec suggtool check" do
  include CorePluginFunctionalHelper

  let(:fixture_path) { File.join(repo_path, "lib", "plugins", "inspec-suggest", "test", "fixtures") }
  let(:config) { File.join(fixture_path, "sugg-conf", "package.yaml") }

  describe "when packaging the basic test fixture set" do
    it "should work correctly" do
      Dir.mktmpdir do |workdir|

        # Copy in test fixture source files - this avoids running suggtool fetch here
        FileUtils.cp_r(File.join(fixture_path, "src"), workdir)

        result = run_inspec_process("suggtool package test-fixture --work-dir #{workdir} --suggest-config #{config}")

        _(result.stderr).must_equal ""
        _(result.exit_status).must_equal 0

        new_profile_dir = File.join(workdir, "profiles", "test-fixture")
        inspec_yml_path = File.join(new_profile_dir, "inspec.yml")
        control_file_path = File.join(new_profile_dir, "controls", "criteria.rb")

        _(File.exist?(inspec_yml_path)).must_equal true
        _(File.exist?(control_file_path)).must_equal true

        control_contents = File.read(control_file_path)
        _(control_contents.lines.grep(/control/).count).must_equal 3
      end
    end
  end
end
