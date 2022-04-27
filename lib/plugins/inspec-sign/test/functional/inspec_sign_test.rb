require "fileutils" unless defined?(FileUtils)
require "plugins/shared/core_plugin_test_helper"
require "securerandom" unless defined?(SecureRandom)

class SignCli < Minitest::Test
  include CorePluginFunctionalHelper

  def test_generating_archive_keys
    prepare_examples do |dir|
      skip_windows! # Breakage confirmed, only on CI: https://buildkite.com/chef-oss/inspec-inspec-master-verify/builds/2355#2c9d032e-4a24-4e7c-aef2-1c9e2317d9e2

      unique_key_name = SecureRandom.uuid
      out = run_inspec_process("sign generate-keys --keyname #{unique_key_name}", prefix: "cd #{dir};")

      stdout = out.stdout.force_encoding(Encoding::UTF_8)
      assert_includes stdout, "Generating private key"
      assert_includes stdout, "Generating public key"

      assert_exit_code 0, out
    end
  end

  def test_verify_and_install_signed_profile
    prepare_examples do |dir|
      skip_windows! # Breakage confirmed, only on CI: https://buildkite.com/chef-oss/inspec-inspec-master-verify/builds/2355#2c9d032e-4a24-4e7c-aef2-1c9e2317d9e2

      unique_key_name = SecureRandom.uuid
      install_dir = File.join(dir, SecureRandom.uuid)
      FileUtils.mkdir(install_dir)

      # create profile
      profile = File.join(dir, "artifact-profile")
      run_inspec_process("init profile artifact-profile", prefix: "cd #{dir};")

      out = run_inspec_process("sign generate-keys --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("sign profile --profile #{profile} --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      # The archive install commands do not currently support windows
      # and use specific linux extract tar commands. Since artifact is
      # still experimental we are skipping it for now.
      return if is_windows?

      out = run_inspec_process("sign verify --signed-profile artifact-profile-0.1.0.iaf", prefix: "cd #{dir};")
      assert_exit_code 0, out

      assert_includes out.stdout.force_encoding(Encoding::UTF_8), "Verifying artifact-profile-0.1.0.iaf"
      assert_exit_code 0, out
    end
  end
end
