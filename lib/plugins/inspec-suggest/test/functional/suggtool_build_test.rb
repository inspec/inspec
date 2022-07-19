require_relative "../helper"
require "tmpdir" unless defined?(Dir.mktmpdir)

describe "inspec suggtool build" do
  include CorePluginFunctionalHelper

  let(:fixture_path) { File.join(repo_path, "lib", "plugins", "inspec-suggest", "test", "fixtures") }
  let(:config) { File.join(fixture_path, "sugg-conf", "build-config.yaml") }
  let(:keyname) { "test-fixture-suggtool-sign-#{SecureRandom.hex}" }

  it "executes inspec suggtool build successfully" do
    Dir.mktmpdir do |workdir|
      # Keygen will generate keys in user's inspec config directory
      keydir = File.join(Inspec.config_dir, "keys")
      # Generate signing key
      keygen_result = run_inspec_process("sign generate-keys --keyname #{keyname}")
      _(keygen_result.stderr).must_equal ""
      _(keygen_result.exit_status).must_equal 0
      _(File.exist?(File.join(keydir, "#{keyname}.pem.key"))).must_equal true

      # Create outdir
      outdir = File.join(workdir, "etc", "suggest")
      FileUtils.mkdir_p(File.join(workdir, "etc", "suggest"))

      # build command and run it
      cmd = "suggtool build test-fixture"
      cmd += " --keyname #{keyname}"
      cmd += " --suggest-config #{config}"
      cmd += " --out-dir #{outdir}"
      cmd += " --work-dir #{workdir}"
      run_suggtool_build = run_inspec_process(cmd)

      # Check if the build command ran successfully
      _(run_suggtool_build.stderr).must_equal ""
      _(run_suggtool_build.exit_status).must_equal 0

      # If fetch works: it must be .git directory
      _(run_suggtool_build.stdout).must_include "fetch: working on set test-fixture"
      _(run_suggtool_build.stdout).must_include "fetch: checked out main"
      _(File.exist?(File.join(workdir, "test-fixture", "inspec-test-profile-basic", ".git"))).must_equal true

      # If check works: check stdout for "check: Saw x error(s), y warning(s)"
      _(run_suggtool_build.stdout).must_include "check: Saw 0 error(s), 0 warning(s)"

      # If package works: inspec.yml and control/criteria.rb should be present
      _(run_suggtool_build.stdout).must_include "package: Extracted inspec.yml from etc/suggest/test-fixture.iaf"
      new_profile_dir = File.join(workdir, "profiles", "test-fixture")
      inspec_yml_path = File.join(new_profile_dir, "inspec.yml")
      control_file_path = File.join(new_profile_dir, "controls", "criteria.rb")
      _(File.exist?(inspec_yml_path)).must_equal true
      _(File.exist?(control_file_path)).must_equal true

      # If bump works: check stdout for "bump: Bumped LEVEL version of"
      _(run_suggtool_build.stdout).must_include "bump: Bumped patch version of"

      # If sign works: verify there must be iaf file
      _(run_suggtool_build.stdout).must_include "sign: signed 'test-fixture.iaf' OK"
      iaf_file = File.join(outdir, "test-fixture.iaf") # Note: no version in the filename
      _(File.exist?(iaf_file)).must_equal true

      # Cleanup keys
      FileUtils.rm(File.join(keydir, "#{keyname}.pem.key"))
      FileUtils.rm(File.join(keydir, "#{keyname}.pem.pub"))
    end
  end
end
