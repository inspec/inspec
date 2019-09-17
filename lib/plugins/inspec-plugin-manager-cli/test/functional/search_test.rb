require_relative "helper"

class PluginManagerCliSearch < Minitest::Test
  include CorePluginFunctionalHelper
  include PluginManagerHelpers

  parallelize_me!

  # TODO: Thor can't hide options, but we wish it could.
  # def test_search_include_fixture_hidden_option
  #   result = run_inspec_process_with_this_plugin('plugin help search')
  #   refute_includes result.stdout, '--include-test-fixture'
  # end

  def test_search_for_a_real_gem_with_full_name_no_options
    result = run_inspec_process("plugin search --include-test-fixture inspec-test-fixture")

    assert_includes result.stdout, "inspec-test-fixture", "Search result should contain the gem name"
    assert_includes result.stdout, "1 plugin(s) found", "Search result should find 1 plugin"
    line = result.stdout.split("\n").grep(/inspec-test-fixture/).first
    assert_match(/\s*inspec-test-fixture\s+\((\d+\.\d+\.\d+){1}\)/, line, "Plugin line should include name and exactly one version")

    assert_exit_code 0, result
  end

  def test_search_for_a_real_gem_with_stub_name_no_options
    result = run_inspec_process("plugin search --include-test-fixture inspec-test-")

    assert_includes result.stdout, "inspec-test-fixture", "Search result should contain the gem name"
    assert_includes result.stdout, "1 plugin(s) found", "Search result should find 1 plugin"

    line = result.stdout.split("\n").grep(/inspec-test-fixture/).first
    assert_match(/\s*inspec-test-fixture\s+\((\d+\.\d+\.\d+){1}\)/, line, "Plugin line should include name and exactly one version")

    assert_exit_code 0, result
  end

  def test_search_for_a_real_gem_with_full_name_and_exact_option
    result = run_inspec_process("plugin search --exact --include-test-fixture inspec-test-fixture")

    assert_includes result.stdout, "inspec-test-fixture", "Search result should contain the gem name"
    assert_includes result.stdout, "1 plugin(s) found", "Search result should find 1 plugin"

    assert_exit_code 0, result

    # TODO: split
    result = run_inspec_process("plugin search -e --include-test-fixture inspec-test-fixture")

    assert_exit_code 0, result
  end

  def test_search_for_a_real_gem_with_stub_name_and_exact_option
    result = run_inspec_process("plugin search --exact --include-test-fixture inspec-test-")

    assert_includes result.stdout, "0 plugin(s) found", "Search result should find 0 plugins"

    assert_exit_code 2, result

    # TODO: split
    result = run_inspec_process("plugin search -e --include-test-fixture inspec-test-")

    assert_exit_code 2, result
  end

  def test_search_for_a_real_gem_with_full_name_and_all_option
    result = run_inspec_process("plugin search --all --include-test-fixture inspec-test-fixture")
    assert_includes result.stdout, "inspec-test-fixture", "Search result should contain the gem name"
    assert_includes result.stdout, "1 plugin(s) found", "Search result should find 1 plugin"

    line = result.stdout.split("\n").grep(/inspec-test-fixture/).first
    assert_match(/\s*inspec-test-fixture\s+\((\d+\.\d+\.\d+(,\s)?){2,}\)/, line, "Plugin line should include name and at least two versions")

    assert_exit_code 0, result

    # TODO: split
    result = run_inspec_process("plugin search -a --include-test-fixture inspec-test-fixture")

    assert_exit_code 0, result
  end

  def test_search_for_a_gem_with_missing_prefix
    result = run_inspec_process("plugin search --include-test-fixture test-fixture")
    assert_exit_code 1, result
    assert_includes result.stdout, "All inspec plugins must begin with either 'inspec-' or 'train-'"
  end

  def test_search_for_a_gem_that_does_not_exist
    result = run_inspec_process("plugin search --include-test-fixture inspec-test-fixture-nonesuch")

    assert_includes result.stdout, "0 plugin(s) found", "Search result should find 0 plugins"

    assert_exit_code 2, result
  end

  def test_search_for_a_real_gem_with_full_name_no_options_and_train_name
    result = run_inspec_process("plugin search --include-test-fixture train-test-fixture")

    assert_includes result.stdout, "train-test-fixture", "Search result should contain the gem name"
    assert_includes result.stdout, "1 plugin(s) found", "Search result should find 1 plugin"
    line = result.stdout.split("\n").grep(/train-test-fixture/).first
    assert_match(/\s*train-test-fixture\s+\((\d+\.\d+\.\d+){1}\)/, line, "Plugin line should include name and exactly one version")

    assert_exit_code 0, result
  end

  def test_search_omit_excluded_inspec_plugins
    result = run_inspec_process("plugin search --include-test-fixture inspec-")

    assert_includes result.stdout, "inspec-test-fixture", "Search result should contain the test gem"
    %w{
      inspec-core
      inspec-multi-server
    }.each do |plugin_name|
      refute_includes result.stdout, plugin_name, "Search result should not contain excluded gems"
    end

    assert_exit_code 0, result
  end

  def test_search_for_a_real_gem_with_full_name_no_options_filter_fixtures
    result = run_inspec_process("plugin search inspec-test-fixture")
    refute_includes result.stdout, "inspec-test-fixture", "Search result should not contain the fixture gem name"
  end

  def test_search_for_a_real_gem_with_full_name_no_options_filter_fixtures_train
    result = run_inspec_process("plugin search train-test-fixture")
    refute_includes result.stdout, "train-test-fixture", "Search result should not contain the fixture gem name"
  end
end
