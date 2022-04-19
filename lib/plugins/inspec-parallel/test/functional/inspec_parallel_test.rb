require_relative "../../../shared/core_plugin_test_helper"

class ParallelCli < Minitest::Test
  include CorePluginFunctionalHelper

  let(:options_file_1) { File.join("lib", "plugins", "inspec-parallel", "test", "fixtures", "options-file-1.txt") }
  let(:options_file_2) { File.join("lib", "plugins", "inspec-parallel", "test", "fixtures", "options-file-2.txt") }
  let(:options_file_3) { File.join("lib", "plugins", "inspec-parallel", "test", "fixtures", "options-file-3.txt") }

  def test_help_output
    out = run_inspec_process("parallel help")
    assert_includes out.stdout, "inspec parallel exec o"
    assert_exit_code 0, out
  end

  def test_parallel_dry_run
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_1} --dry-run --sudo")
    stdout = out.stdout
    assert_includes stdout, "complete-profile -t ssh://vagrant@127.0.0.1:2201 --reporter cli --no-create-lockfile --no-sudo"
    assert_includes stdout, "control-tags -t ssh://vagrant@127.0.0.1:2201 --reporter cli --sudo true"
    assert_equal stdout.split("\n").count, 7
    assert_exit_code 0, out
  end

  def test_parallel_run_without_forking
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_3}")
    assert_empty out.stderr
    assert_exit_code 0, out
  end

  def test_parallel_dry_run_with_typo_in_option
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_2} --dry-run")
    stdout = out.stdout
    assert_includes stdout, "No such option: [\"targetss\"]"
    assert_exit_code 0, out
  end

  def test_parallel_run_with_typo_in_option
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_2}")
    refute_empty out.stderr
  end

  def test_parallel_with_default_opts
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_3} --reporter json")
    assert_empty out.stderr
    assert_exit_code 0, out
  end

  def test_parallel_dry_run_with_default_opts
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_1} -t docker://8b5ec1a0344b --reporter json --dry-run")
    stdout = out.stdout
    assert_includes stdout, "basic_profile -t docker://8b5ec1a0344b --reporter json"
    assert_includes stdout, "complete-profile -t docker://1870886821c3 --reporter cli"
    assert_includes stdout, "complete-profile --reporter cli --target docker://8b5ec1a0344b"
    assert_includes stdout, "complete-profile -t docker://1870886821c3 --reporter json"
    assert_equal stdout.split("\n").count, 7
    assert_exit_code 0, out
  end
end
