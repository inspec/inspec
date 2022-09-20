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
      assert_includes stdout, "Generating signing key in"
      assert_includes stdout, "Generating validation key"

      assert_exit_code 0, out
      delete_keys(unique_key_name)
    end
  end

  def test_verify_and_install_signed_profile
    prepare_examples do |dir|
      skip_windows! # Breakage confirmed, only on CI: https://buildkite.com/chef-oss/inspec-inspec-master-verify/builds/2355#2c9d032e-4a24-4e7c-aef2-1c9e2317d9e2

      unique_key_name = SecureRandom.uuid

      # create profile
      profile = File.join(dir, "artifact-profile")
      run_inspec_process("init profile artifact-profile", prefix: "cd #{dir};")

      out = run_inspec_process("sign generate-keys --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("sign profile #{profile} --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("sign verify artifact-profile-0.1.0.iaf", prefix: "cd #{dir};")
      assert_exit_code 0, out

      assert_includes out.stdout.force_encoding(Encoding::UTF_8), "Verifying artifact-profile-0.1.0.iaf"
      assert_exit_code 0, out
      delete_keys(unique_key_name)
    end
  end

  def test_sign_profile_for_profile_name_with_period
    prepare_examples do |dir|
      skip_windows! # Breakage confirmed, only on CI: https://buildkite.com/chef-oss/inspec-inspec-master-verify/builds/2355#2c9d032e-4a24-4e7c-aef2-1c9e2317d9e2

      unique_key_name = SecureRandom.uuid

      # create profile
      profile = File.join(dir, "artifact-profile-5.3")
      run_inspec_process("init profile artifact-profile-5.3", prefix: "cd #{dir};")

      out = run_inspec_process("sign generate-keys --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("sign profile #{profile} --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("sign verify artifact-profile-5_3-0.1.0.iaf", prefix: "cd #{dir};")
      assert_exit_code 0, out

      assert_includes out.stdout.force_encoding(Encoding::UTF_8), "Verifying artifact-profile-5_3-0.1.0.iaf"
      assert_exit_code 0, out
      delete_keys(unique_key_name)
    end
  end

  def delete_keys(unique_key_name)
    File.delete("#{Inspec.config_dir}/keys/#{unique_key_name}.pem.key") if File.exist?("#{Inspec.config_dir}/keys/#{unique_key_name}.pem.key")
    File.delete("#{Inspec.config_dir}/keys/#{unique_key_name}.pem.pub") if File.exist?("#{Inspec.config_dir}/keys/#{unique_key_name}.pem.pub")
  end
end
