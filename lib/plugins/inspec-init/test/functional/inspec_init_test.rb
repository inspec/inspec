# encoding: utf-8

require_relative '../../../shared/core_plugin_test_helper.rb'

class InitCli < MiniTest::Test
  include CorePluginFunctionalHelper

  def test_generating_inspec_profile
    Dir.mktmpdir do |dir|
      profile = File.join(dir, 'test-profile')
      out = run_inspec_process("init profile test-profile", prefix: "cd #{dir} &&")
      assert_equal 0, out.exit_status
      assert_includes out.stdout, 'Create new profile at'
      assert_includes out.stdout, profile
      assert_includes Dir.entries(profile).join, 'inspec.yml'
      assert_includes Dir.entries(profile).join, 'README.md'
    end
  end

  def test_profile_with_slash_name
    Dir.mktmpdir do |dir|
      profile = dir + '/test/deeper/profile'
      out = run_inspec_process("init profile test/deeper/profile", prefix: "cd #{dir} &&")
      assert_equal 0, out.exit_status
      assert_equal true, File.exist?(profile)
      profile = YAML.load_file("#{profile}/inspec.yml")
      assert_equal 'profile', profile['name']
    end
  end
end
