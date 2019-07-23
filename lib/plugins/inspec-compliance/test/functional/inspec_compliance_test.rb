require_relative "../../../shared/core_plugin_test_helper.rb"

class ComplianceCli < Minitest::Test
  include CorePluginFunctionalHelper

  def test_help_output
    out = run_inspec_process("compliance help")

    assert_includes out.stdout, "inspec compliance exec PROFILE"

    assert_exit_code 0, out
  end

  def test_logout_command
    out = run_inspec_process("compliance logout")

    assert_includes out.stdout, ""

    assert_exit_code 0, out
  end

  def test_error_login_with_invalid_url
    out = run_inspec_process("compliance login")

    assert_includes out.stderr, 'ERROR: "inspec compliance login" was called with no arguments'

    assert_exit_code 1, out
  end

  def test_profile_list_without_auth
    out = run_inspec_process("compliance profiles")

    assert_includes out.stdout, "You need to login first with `inspec compliance login`"

    assert_exit_code 0, out # TODO: make this error
  end

  def test_error_upload_without_args
    out = run_inspec_process("compliance upload")

    assert_includes out.stderr, 'ERROR: "inspec compliance upload" was called with no arguments'

    assert_exit_code 1, out
  end

  def test_error_upload_with_fake_path
    out = run_inspec_process("compliance upload /path/to/dir")

    assert_includes out.stdout, "You need to login first with `inspec compliance login`"

    assert_exit_code 0, out # TODO: make this error
  end
end
