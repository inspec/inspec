# Include our test harness
require_relative "../helper"

describe "inspec list-resources core" do
  include CorePluginFunctionalHelper

  def test_plugin_lists_inspec_suggest
    out = run_inspec_process("plugin list")
    assert_includes out.stdout, "inspec-suggest"
    assert_exit_code 0, out
  end
end
