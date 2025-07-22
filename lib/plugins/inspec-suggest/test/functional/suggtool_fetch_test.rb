require_relative "../helper"
require "tmpdir" unless defined?(Dir.mktmpdir)
require "git"

describe "inspec suggtool check" do
  include CorePluginFunctionalHelper

  let(:fixture_path) { File.join(repo_path, "lib", "plugins", "inspec-suggest", "test", "fixtures") }
  let(:config) { File.join(fixture_path, "sugg-conf", "fetch.yaml") }

  describe "when fetching the test-fixture repo" do
    it "should work correctly" do
      Dir.mktmpdir do |workdir|
        result = run_inspec_process("suggtool fetch test-fixture --work-dir #{workdir} --suggest-config #{config}")

        _(result.stderr).must_equal ""
        _(result.exit_status).must_equal 0
        _(result.stdout.lines.grep(/WARNING/).count).must_equal 0

        # Should have an info line saying a new clone was made
        _(result.stdout).must_include("cloned")

        _(File.exist?(File.join(workdir, "test-fixture", "inspec-test-profile-basic", ".git"))).must_equal true
        _(File.exist?(File.join(workdir, "test-fixture", "inspec-test-profile-basic", "suggest", "inspec-test-profile-basic.rb"))).must_equal true
        _(File.exist?(File.join(workdir, "test-fixture", "inspec-test-profile-basic", "suggest", ".marker"))).must_equal false
      end
    end
  end

  describe "when fetching the test-fixture-branch repo" do
    it "should work correctly" do
      Dir.mktmpdir do |workdir|
        result = run_inspec_process("suggtool fetch test-fixture-branch --work-dir #{workdir} --suggest-config #{config}")

        _(result.stderr).must_equal ""
        _(result.exit_status).must_equal 0
        _(result.stdout.lines.grep(/WARNING/).count).must_equal 0

        # Should have an info line saying a new clone was made
        _(result.stdout).must_include("cloned")
        _(result.stdout).must_include("cw/test")

        _(File.exist?(File.join(workdir, "test-fixture-branch", "inspec-test-profile-basic", ".git"))).must_equal true
        _(File.exist?(File.join(workdir, "test-fixture-branch", "inspec-test-profile-basic", "suggest", "inspec-test-profile-basic.rb"))).must_equal true
        _(File.exist?(File.join(workdir, "test-fixture-branch", "inspec-test-profile-basic", "suggest", ".marker"))).must_equal true
      end
    end
  end

  # Manual testing to check when a stale repo can be pulled

end
