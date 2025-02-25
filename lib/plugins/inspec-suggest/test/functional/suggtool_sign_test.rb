require_relative "../helper"
require "tmpdir" unless defined?(Dir.mktmpdir)
require "securerandom" unless defined?(SecureRandom)

describe "inspec suggtool sign" do
  include CorePluginFunctionalHelper

  let(:fixture_path) { File.join(repo_path, "lib", "plugins", "inspec-suggest", "test", "fixtures") }
  let(:config) { File.join(fixture_path, "sugg-conf", "package.yaml") }
  let(:keyname) { "test-fixture-suggtool-sign-#{SecureRandom.hex}" }

  describe "when signing the basic test fixture set" do
    it "should work correctly" do
      Dir.mktmpdir do |workdir|

        # Copy in test fixture source files - this avoids running suggtool fetch here
        FileUtils.cp_r(File.join(fixture_path, "src"), workdir)

        package_result = run_inspec_process("suggtool package test-fixture --work-dir #{workdir} --suggest-config #{config}")

        _(package_result.stderr).must_equal ""
        _(package_result.exit_status).must_equal 0

        # Keygen will generate keys in user's inspec config directory
        keydir = File.join(Inspec.config_dir, "keys")
        # Generate signing key
        keygen_result = run_inspec_process("sign generate-keys --keyname #{keyname}")
        _(keygen_result.stderr).must_equal ""
        _(keygen_result.exit_status).must_equal 0
        _(File.exist?(File.join(keydir, "#{keyname}.pem.key"))).must_equal true

        outdir = File.join(workdir, "etc", "suggest")
        FileUtils.mkdir_p(File.join(workdir, "etc", "suggest"))

        # Must run with --out-dir to write the IAF file to a temporary directory. Otherwise
        # the process would overwrite the test-fixture.iaf file in SRC/etc/suggest, which would
        # break all other tests (because it was signed with a disposable key).
        # Must be manually tested to ensure it works when writing to production location.
        sign_result = run_inspec_process("suggtool sign test-fixture --keyname #{keyname} --work-dir #{workdir} --out-dir #{outdir} --suggest-config #{config}")
        _(sign_result.stderr).must_equal ""
        _(sign_result.exit_status).must_equal 0

        iaf_file = File.join(outdir, "test-fixture.iaf") # Note: no version in the filename
        _(File.exist?(iaf_file)).must_equal true

        verify_result = run_inspec_process("sign verify #{iaf_file}")
        _(verify_result.stderr).must_equal ""
        _(verify_result.exit_status).must_equal 0

        # Cleanup keys
        FileUtils.rm(File.join(keydir, "#{keyname}.pem.key"))
        FileUtils.rm(File.join(keydir, "#{keyname}.pem.pub"))
      end
    end

    describe "when keyname is not provided" do
      it "should exit with an error" do
        Dir.mktmpdir do |workdir|

          outdir = File.join(workdir, "etc", "suggest")
          FileUtils.mkdir_p(File.join(workdir, "etc", "suggest"))

          sign_result = run_inspec_process("suggtool sign test-fixture --work-dir #{workdir} --out-dir #{outdir} --suggest-config #{config}")
          _(sign_result.stdout).must_include "Required option 'keyname'"
          _(sign_result.exit_status).must_equal 1
        end
      end
    end

    describe "when package has not been run" do
      it "should exit with an error mentioning package command" do
        Dir.mktmpdir do |workdir|

          # No need to really generate keys in this test - we won't make it to the signing stage, and it just adds test time.
          outdir = File.join(workdir, "etc", "suggest")
          FileUtils.mkdir_p(File.join(workdir, "etc", "suggest"))

          sign_result = run_inspec_process("suggtool sign test-fixture --keyname #{keyname} --work-dir #{workdir} --out-dir #{outdir} --suggest-config #{config}")
          _(sign_result.stdout).must_include "does not exist"
          _(sign_result.stdout).must_include "suggtool package`?"
          _(sign_result.exit_status).must_equal 1
        end
      end
    end
  end
end
