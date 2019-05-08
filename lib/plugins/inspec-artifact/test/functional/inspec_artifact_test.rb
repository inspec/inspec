# encoding: utf-8

require_relative '../../../shared/core_plugin_test_helper.rb'
require 'fileutils'
require 'securerandom'

class ArtifactCli < Minitest::Test
  include CorePluginFunctionalHelper

  def test_generating_archive_keys
    Dir.mktmpdir do |dir|
      unique_key_name = SecureRandom.uuid()
      out = run_inspec_process("artifact generate --keyname #{unique_key_name}", prefix: "cd #{dir} &&")
      assert_equal 0, out.exit_status

      stdout = out.stdout.force_encoding(Encoding::UTF_8)
      assert_includes stdout, 'Generating private key'
      assert_includes stdout, 'Generating public key'
    end
  end

  def test_verify_and_install_signed_profile
    Dir.mktmpdir do |dir|
      unique_key_name = SecureRandom.uuid()
      install_dir = File.join(dir, SecureRandom.uuid())
      profile = File.join(dir, 'profile')
      FileUtils.mkdir(install_dir)

      # create profile
      profile = File.join(dir, 'artifact-profile')
      run_inspec_process("init profile artifact-profile", prefix: "cd #{dir} &&")

      out = run_inspec_process("artifact generate --keyname #{unique_key_name}", prefix: "cd #{dir} &&")
      assert_equal 0, out.exit_status

      out = run_inspec_process("artifact sign-profile --profile #{profile} --keyname #{unique_key_name}", prefix: "cd #{dir} &&")
      assert_equal 0, out.exit_status

      out = run_inspec_process("artifact install-profile --infile artifact-profile-0.1.0.iaf --destdir #{install_dir}", prefix: "cd #{dir} &&")
      assert_equal 0, out.exit_status

      assert_includes out.stdout.force_encoding(Encoding::UTF_8), "Installing to #{install_dir}"
      assert_includes Dir.entries(install_dir).join, 'inspec.yml'
    end
  end
end
