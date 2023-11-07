require "yaml"
require_relative "../../../shared/core_plugin_test_helper"

class InitCli < Minitest::Test
  include CorePluginFunctionalHelper

  def test_generating_inspec_profile
    Dir.mktmpdir do |dir|
      profile = File.join(dir, "test-profile")
      out = run_inspec_process("init profile test-profile", prefix: "cd #{dir} &&")

      assert_includes out.stdout, "Creating new profile at"
      assert_includes out.stdout, profile
      assert_includes Dir.entries(profile).join, "inspec.yml"
      assert_includes Dir.entries(profile).join, "README.md"

      assert_exit_code 0, out
    end
  end

  def test_generating_inspec_profile_with_explicit_platform
    Dir.mktmpdir do |dir|
      profile = File.join(dir, "test-profile")
      out = run_inspec_process("init profile --platform os test-profile", prefix: "cd #{dir} &&")

      assert_includes out.stdout, "Creating new profile at"
      assert_includes out.stdout, profile
      assert_includes Dir.entries(profile).join, "inspec.yml"
      assert_includes Dir.entries(profile).join, "README.md"

      assert_exit_code 0, out
    end
  end

  def test_generating_inspec_profile_with_bad_platform
    Dir.mktmpdir do |dir|
      out = run_inspec_process("init profile --platform nonesuch test-profile", prefix: "cd #{dir} &&")

      assert_includes out.stdout, "Unable to generate profile"
      assert_includes out.stdout, "No template available for platform 'nonesuch'"

      assert_exit_code 1, out
    end
  end

  def test_profile_with_slash_name
    Dir.mktmpdir do |dir|
      profile = dir + "/test/deeper/profile"
      out = run_inspec_process("init profile test/deeper/profile", prefix: "cd #{dir} &&")
      assert_equal true, File.exist?(profile)
      profile = YAML.load_file("#{profile}/inspec.yml")
      assert_equal "profile", profile["name"]

      assert_exit_code 0, out
    end
  end

  def test_generating_inspec_profile_gcp
    Dir.mktmpdir do |dir|
      profile = File.join(dir, "test-gcp-profile")
      out = run_inspec_process("init profile --platform gcp test-gcp-profile", prefix: "cd #{dir} &&")

      assert_includes out.stdout, "Creating new profile at"
      assert_includes out.stdout, profile
      assert_includes Dir.entries(profile).join, "inspec.yml"
      assert_includes Dir.entries(profile).join, "README.md"

      assert_exit_code 0, out
    end
  end

  def test_generating_inspec_profile_aws
    Dir.mktmpdir do |dir|
      profile = File.join(dir, "test-aws-profile")
      out = run_inspec_process("init profile --platform aws test-aws-profile", prefix: "cd #{dir} &&")

      assert_includes out.stdout, "Creating new profile at"
      assert_includes out.stdout, profile
      assert_includes Dir.entries(profile).join, "inspec.yml"
      assert_includes Dir.entries(profile).join, "README.md"

      assert_exit_code 0, out
    end
  end

  def test_generating_inspec_profile_azure
    Dir.mktmpdir do |dir|
      profile = File.join(dir, "test-azure-profile")
      out = run_inspec_process("init profile --platform azure test-azure-profile", prefix: "cd #{dir} &&")

      assert_includes out.stdout, "Creating new profile at"
      assert_includes out.stdout, profile
      assert_includes Dir.entries(profile).join, "inspec.yml"
      assert_includes Dir.entries(profile).join, "README.md"

      assert_exit_code 0, out
    end
  end

  def test_generating_inspec_profile_os
    Dir.mktmpdir do |dir|
      profile = File.join(dir, "test-os-profile")
      out = run_inspec_process("init profile --platform os test-os-profile", prefix: "cd #{dir} &&")

      assert_includes out.stdout, "Creating new profile at"
      assert_includes out.stdout, profile
      assert_includes Dir.entries(profile).join, "inspec.yml"
      assert_includes Dir.entries(profile).join, "README.md"

      assert_exit_code 0, out
    end
  end

  def test_generating_inspec_profile_alicloud
    Dir.mktmpdir do |dir|
      profile = File.join(dir, "test-alicloud-profile")
      out = run_inspec_process("init profile --platform alicloud test-alicloud-profile", prefix: "cd #{dir} &&")
      assert_includes out.stdout, "Creating new profile at"
      assert_includes out.stdout, profile
      assert_includes Dir.entries(profile).join, "inspec.yml"
      assert_includes Dir.entries(profile).join, "README.md"
      assert_exit_code 0, out
    end
  end
end
