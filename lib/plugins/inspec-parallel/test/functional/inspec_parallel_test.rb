require_relative "../../../shared/core_plugin_test_helper"
require_relative "../../../../../test/functional/helper"

class ParallelCli < Minitest::Test
  include CorePluginFunctionalHelper

  let(:options_file_1) { File.join("lib", "plugins", "inspec-parallel", "test", "fixtures", "options-file-1.txt") }
  let(:options_file_2) { File.join("lib", "plugins", "inspec-parallel", "test", "fixtures", "options-file-2.txt") }
  let(:options_file_3) { File.join("lib", "plugins", "inspec-parallel", "test", "fixtures", "options-file-3.txt") }
  let(:options_file_4) { File.join("lib", "plugins", "inspec-parallel", "test", "fixtures", "options-file-4.txt") }
  let(:options_file_5) { File.join("lib", "plugins", "inspec-parallel", "test", "fixtures", "options-file-5.txt") }
  let(:options_shell_file_1) { File.join("lib", "plugins", "inspec-parallel", "test", "fixtures", "options-file-shell-1.sh") }

  def test_help_output
    out = run_inspec_process("parallel help")
    assert_includes out.stdout, "inspec parallel exec o"
    assert_exit_code 0, out
  end

  def test_parallel_dry_run
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_1} --dry-run --sudo")
    stdout = out.stdout
    assert_includes stdout, "complete-profile -t ssh://vagrant@127.0.0.1:2201 --reporter child-status cli:myfile.out --no-create-lockfile --no-sudo"
    assert_includes stdout, "control-tags -t ssh://vagrant@127.0.0.1:2201 --reporter child-status cli:myfile.out --sudo true"
    assert_equal stdout.split("\n").count, 6
    assert_exit_code 0, out
  end

  def test_parallel_run_without_forking
    skip_windows!
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_3}")
    assert_empty out.stderr
    assert_exit_code 0, out
  end

  def test_parallel_dry_run_with_typo_in_option
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_2} --dry-run")
    stdout = out.stdout
    assert_includes stdout, "No such option: [\"--targetss\""
    assert_exit_code 1, out
  end

  def test_parallel_run_with_typo_in_option
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_2}")
    stdout = out.stdout
    assert_includes stdout, "No such option: [\"--targetss\""
    assert_exit_code 1, out
  end

  def test_parallel_with_default_opts
    skip_windows!
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_3} --reporter json")
    assert_empty out.stderr
    assert_exit_code 0, out
  end

  def test_parallel_run_with_shell_file_as_options_file
    skip_windows!
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_shell_file_1} --reporter json")
    assert_empty out.stderr
    assert_exit_code 0, out
  end

  def test_parallel_dry_run_with_shell_file_as_options_file
    skip_windows!
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_shell_file_1} --dry-run")
    stdout = out.stdout
    assert_includes stdout, "complete-profile --reporter child-status json:myfile.json --create-lockfile false"
    assert_includes stdout, "control-tags --reporter child-status cli:myfile.out --create-lockfile false"
    assert_empty out.stderr
    assert_exit_code 0, out
  end

  def test_parallel_dry_run_with_default_opts
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_1} -t docker://8b5ec1a0344b --dry-run")
    stdout = out.stdout
    assert_includes stdout, "basic_profile -t docker://8b5ec1a0344b --reporter child-status json:myfile.json"
    assert_includes stdout, "complete-profile -t docker://1870886821c3 --reporter child-status cli:myfile.out"
    assert_includes stdout, "complete-profile --reporter child-status cli:myfile.out --target docker://8b5ec1a0344b"
    assert_equal stdout.split("\n").count, 6
    assert_exit_code 0, out
  end

  def test_parallel_dry_run_with_verbose_option
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_1} --dry-run --verbose")
    stdout = out.stdout
    assert_includes stdout, "complete-profile -t ssh://vagrant@127.0.0.1:2201 --reporter child-status cli:myfile.out --no-create-lockfile --no-sudo --winrm-transport negotiate --insecure false --winrm-shell-type powershell --auto-install-gems false --distinct-exit true --diff true --sort-results-by file --filter-empty-profiles false --reporter-include-source false"
    assert_includes stdout, "control-tags -t ssh://vagrant@127.0.0.1:2201 --reporter child-status cli:myfile.out --winrm-transport negotiate --insecure false --winrm-shell-type powershell --auto-install-gems false --distinct-exit true --diff true --sort-results-by file --filter-empty-profiles false --reporter-include-source false"
    assert_equal stdout.split("\n").count, 6
    assert_exit_code 0, out
  end

  def test_reporter_validation_no_file_output
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_4} --dry-run")
    stdout = out.stdout
    assert_includes stdout, "Line 3: The json reporter requires being directed to a file, like json:filename.out"
    assert_exit_code 1, out
  end

  def test_reporter_validation_no_reporter
    out = run_inspec_process("parallel exec #{complete_profile} -o #{options_file_5} --dry-run")
    stdout = out.stdout
    assert_includes stdout, "Line 5: A --reporter option must be specified for each invocation in the options file"
    assert_exit_code 1, out
  end

end
