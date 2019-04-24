# encoding: utf-8

require_relative '../../../shared/core_plugin_test_helper.rb'

class ComplianceCli < Minitest::Test
  include CorePluginFunctionalHelper

  def test_help_output
    out = run_inspec_process('compliance help')
    assert_equal out.exit_status, 0
    assert_includes out.stdout, 'inspec compliance exec PROFILE'
  end

  def test_logout_command
    out = run_inspec_process('compliance logout')
    assert_equal out.exit_status, 0
    assert_includes out.stdout, ''
  end

  def test_error_login_with_invalid_url
    out = run_inspec_process('compliance login')
    assert_equal out.exit_status, 1
    assert_includes out.stderr, 'ERROR: "inspec compliance login" was called with no arguments'
  end

  def test_profile_list_without_auth
    out = run_inspec_process('compliance profiles')
    assert_equal out.exit_status, 0 # TODO: make this error
    assert_includes out.stdout, 'You need to login first with `inspec compliance login`'
  end

  def test_error_upload_without_args
    out = run_inspec_process('compliance upload')
    assert_equal out.exit_status, 1
    assert_includes out.stderr, 'ERROR: "inspec compliance upload" was called with no arguments'
  end

  def test_error_upload_with_fake_path
    out = run_inspec_process('compliance upload /path/to/dir')
    assert_equal out.exit_status, 0 # TODO: make this error
    assert_includes out.stdout, 'You need to login first with `inspec compliance login`'
  end
end
