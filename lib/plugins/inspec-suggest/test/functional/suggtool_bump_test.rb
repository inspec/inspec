require_relative "../helper"
require "tmpdir" unless defined?(Dir.mktmpdir)

describe "inspec suggtool bump" do
  include CorePluginFunctionalHelper

  let(:fixture_path) { File.join(repo_path, "lib", "plugins", "inspec-suggest", "test", "fixtures") }
  let(:config) { File.join(fixture_path, "sugg-conf", "suggest-bump.yaml") }

  describe "when packaging the basic test fixture set" do
    it "bump:patch version default" do
      result = run_inspec_process("suggtool bump --suggest-config #{config}")
      _(result.stderr).must_equal ""
      _(result.exit_status).must_equal 0
      _(result.stdout).must_include "Bumped:Patch version of"
    end

    it "bump:minor version" do
      result = run_inspec_process("suggtool bump --suggest-config #{config} --minor")
      _(result.stderr).must_equal ""
      _(result.exit_status).must_equal 0
      _(result.stdout).must_include "Bumped:Minor version of"
    end

    it "bump:major version" do
      result = run_inspec_process("suggtool bump --suggest-config #{config} --major")
      _(result.stderr).must_equal ""
      _(result.exit_status).must_equal 0
      _(result.stdout).must_include "Bumped:Major version of"
    end
  end
end
