require "functional/helper"
require "tmpdir"
require "yaml"

describe "The license acceptance mechanism" do
  include FunctionalHelper

  # TODO/NOTE: do not add parallelize_me! here. Blows up inspec_json_profile_test.rb

  describe "when the license has not been accepted" do
    describe "when the user passes the --chef-license accept flag" do
      it "should silently work normally" do
        without_license do
          Dir.mktmpdir do |tmp_home|
            run_result = run_inspec_process("shell -c platform.family --chef-license accept", env: { "HOME" => tmp_home })

            _(run_result.stdout).wont_include "Chef License Acceptance" # --chef-license should not mention accepting the license

            _(run_result.stderr).must_equal ""

            assert_exit_code 0, run_result
          end
        end
      end

      it "should write a YAML file" do
        without_license do
          Dir.mktmpdir do |tmp_home|
            license_persist_path = "#{tmp_home}/.chef/accepted_licenses/inspec"

            _(File.exist?(license_persist_path)).must_equal false # Sanity check
            run_inspec_process("shell -c platform.family --chef-license accept", env: { "HOME" => tmp_home })

            # depends on if test is run by root or not
            root_license_path = FunctionalHelper::ROOT_LICENSE_PATH
            license_persist_path, = Dir[license_persist_path, root_license_path]

            _(license_persist_path).wont_be_nil "can't find license file"
            _(File.exist?(license_persist_path)).must_equal true

            license_persist_contents = YAML.load(File.read(license_persist_path))
            _(license_persist_contents.keys).must_include "accepting_product"
            _(license_persist_contents["accepting_product"]).must_equal "inspec"
          end
        end
      end
    end

    # Since the license-acceptance library detects TTYs, and changes behavior
    # if not found, we can't test interactive acceptance anymore
    describe "when no mechanism is used to accept the license and we are non-interactive" do
      it "should exit ASAP with code 172" do
        without_license do
          Dir.mktmpdir do |tmp_home|
            run_result = run_inspec_process("shell -c platform.family", env: { "HOME" => tmp_home })

            # [2019-04-11T11:06:00-04:00] ERROR: InSpec cannot execute without accepting the license
            _(run_result.stdout).must_include "cannot execute"
            _(run_result.stdout).must_include "the license"
            _(run_result.stdout).must_include "ERROR" # From failure message

            assert_exit_code 172, run_result
          end
        end
      end
    end

    describe "when a command is used that should not be gated on licensure" do
      [
        "-h", "--help", "help", "", # Empty invocation is treated as `inspec help`
        "-v", "--version", "version"
      ].each do |ungated_invocation|
        it "should not challenge for a license when running `inspec #{ungated_invocation}`" do
          Dir.mktmpdir do |tmp_home|
            run_result = run_inspec_process(ungated_invocation, env: { "HOME" => tmp_home })

            _(run_result.stdout).wont_include "Chef License Acceptance"

            _(run_result.stderr).must_equal ""

            assert_exit_code 0, run_result
          end
        end
      end
    end
  end

  describe "when the license has already been accepted" do
    describe "when the license was accepted by touching a blank file" do
      it "should silently work normally" do
        Dir.mktmpdir do |tmp_home|
          license_persist_dir  = File.join(tmp_home, ".chef", "accepted_licenses")
          license_persist_path = File.join(tmp_home, ".chef", "accepted_licenses", "inspec")

          _(File.exist?(license_persist_path)).must_equal false # Sanity check
          FileUtils.mkdir_p(license_persist_dir)
          FileUtils.touch(license_persist_path)
          _(File.exist?(license_persist_path)).must_equal true # Sanity check

          run_result = run_inspec_process("shell -c platform.family", env: { "HOME" => tmp_home })

          _(run_result.stdout).wont_include "Chef License Acceptance"

          _(run_result.stderr).must_equal ""

          assert_exit_code 0, run_result
        end
      end
    end

    describe "when the license persistance file is a YAML file" do
      it "should silently work normally" do
        Dir.mktmpdir do |tmp_home|
          license_persist_dir  = File.join(tmp_home, ".chef", "accepted_licenses")
          license_persist_path = File.join(tmp_home, ".chef", "accepted_licenses", "inspec")

          _(File.exist?(license_persist_path)).must_equal false # Sanity check
          FileUtils.mkdir_p(license_persist_dir)
          File.write(license_persist_path, <<~EOY)
            ---
            name: inspec
            date_accepted: '1979-08-04T16:36:53-05:00'
            accepting_product: inspec
            accepting_product_version: 1.2.3
            user: someone
            file_format: 1
          EOY
          _(File.exist?(license_persist_path)).must_equal true # Sanity check

          run_result = run_inspec_process("shell -c platform.family", env: { "HOME" => tmp_home })

          _(run_result.stdout).wont_include "Chef License Acceptance"

          _(run_result.stderr).must_equal ""

          assert_exit_code 0, run_result
        end
      end
    end
  end
end
