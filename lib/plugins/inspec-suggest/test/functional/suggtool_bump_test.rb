require_relative "../helper"
require "tmpdir" unless defined?(Dir.mktmpdir)

describe "inspec suggtool bump" do
  include CorePluginFunctionalHelper

  let(:fixture_path) { File.join(repo_path, "lib", "plugins", "inspec-suggest", "test", "fixtures") }
  let(:config) { File.join(fixture_path, "sugg-conf", "suggest-bump.yaml") }

  describe "when packaging the basic test fixture set" do
    it "should work correctly" do
      result = run_inspec_process("suggtool bump --suggest-config #{config}")
      _(result.stderr).must_equal ""
      _(result.exit_status).must_equal 0
      _(result.stdout).must_include "Bumped version of"
    end
  end
end
