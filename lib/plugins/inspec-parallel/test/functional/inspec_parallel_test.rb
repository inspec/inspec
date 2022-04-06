require_relative "../../../shared/core_plugin_test_helper"

class ParallelCli < Minitest::Test
  include CorePluginFunctionalHelper

  let(:options_file_1) { File.join("lib", "plugins", "inspec-parallel", "test", "fixtures", "options-file-1.txt") }
  let(:options_file_2) { File.join("lib", "plugins", "inspec-parallel", "test", "fixtures", "options-file-2.txt") }

  def test_help_output
    out = run_inspec_process("parallel help")
    assert_includes out.stdout, "inspec parallel exec o"
    assert_exit_code 0, out
  end

  def test_parallel_dry_run
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_1} --dry-run")
    stdout = out.stdout
    assert_includes stdout, "complete-profile -t ssh://vagrant@127.0.0.1:2201 --reporter cli"
    assert_includes stdout, "control-tags -t ssh://vagrant@127.0.0.1:2201 --reporter cli"
    assert_equal stdout.split("\n").count, 2
    assert_exit_code 0, out
  end

  def test_parallel_run_without_forking
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_1}")
    stdout = out.stdout
    assert_includes stdout, "complete example profile"
    assert_includes stdout, "InSpec Profile for testing filtering on controls using tags"
    assert_includes stdout, "Test Summary: 1 successful, 0 failures, 0 skipped"
    assert_includes stdout, "Test Summary: 4 successful, 1 failure, 0 skipped"
    assert_exit_code 0, out
  end

  def test_parallel_dry_run_with_typo_in_option
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_2} --dry-run")
    stdout = out.stdout
    assert_includes stdout, "Invalid options: [\"targetss\"]"
    assert_exit_code 0, out
  end

  def test_parallel_run_with_typo_in_option
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_2}")
    refute_empty out.stderr
  end
end
