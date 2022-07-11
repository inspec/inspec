require_relative "../helper"
require "tmpdir" unless defined?(Dir.mktmpdir)

describe "inspec suggtool bump" do
  include CorePluginFunctionalHelper

  let(:fixture_path) { File.join(repo_path, "lib", "plugins", "inspec-suggest", "test", "fixtures") }
  let(:config) { File.join(fixture_path, "sugg-conf", "suggest-bump.yaml") }

  describe "when bumping version on different levels" do
    it "should bump version for all three levels" do
      Dir.mktmpdir do |workdir|
        FileUtils.cp_r(File.join(fixture_path, "src"), workdir)
        run_suggtool_package = run_inspec_process("suggtool package test-fixture --work-dir #{workdir} --suggest-config #{config}")
        _(run_suggtool_package.stderr).must_equal ""
        _(run_suggtool_package.exit_status).must_equal 0

        # default bump i.e. patch
        run_suggtool_bump = run_inspec_process("suggtool bump --suggest-config #{config} --work-dir #{workdir}")
        _(run_suggtool_bump.stderr).must_equal ""
        _(run_suggtool_bump.exit_status).must_equal 0
        _(run_suggtool_bump.stdout).must_include "Bumped:patch version of"

        # patch bump
        run_suggtool_bump = run_inspec_process("suggtool bump --level patch --suggest-config #{config} --work-dir #{workdir}")
        _(run_suggtool_bump.stderr).must_equal ""
        _(run_suggtool_bump.exit_status).must_equal 0
        _(run_suggtool_bump.stdout).must_include "Bumped:patch version of"

        # minor bump
        run_suggtool_bump = run_inspec_process("suggtool bump --level minor --suggest-config #{config} --work-dir #{workdir}")
        _(run_suggtool_bump.stderr).must_equal ""
        _(run_suggtool_bump.exit_status).must_equal 0
        _(run_suggtool_bump.stdout).must_include "Bumped:minor version of"

        # major bump
        run_suggtool_bump = run_inspec_process("suggtool bump --level major --suggest-config #{config} --work-dir #{workdir}")
        _(run_suggtool_bump.stderr).must_equal ""
        _(run_suggtool_bump.exit_status).must_equal 0
        _(run_suggtool_bump.stdout).must_include "Bumped:major version of"
      end # Dir.mktmpdir
    end # it ends
  end # describe end (when bumping version on different levels)
end # describe end (inspec suggtool bump)
