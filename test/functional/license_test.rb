require 'functional/helper'
require 'tmpdir'
require 'yaml'

describe 'The license acceptance mechanism' do
  let(:env) { { HOME => tmp_home } }
  let(:run_result) { run_inspec_process(invocation, env: env) }
  let(:license_persist_dir) { File.join(tmp_home, '.chef', 'accepted_licenses') }
  let(:license_persist_path) { File.join(license_persist_dir, 'inspec') }

  describe 'when the license has not been accepted' do
    describe 'when the user passes the --accept-license flag' do
      let(:invocation) { 'shell -c platform.family --accept-license' }
      it 'should silently work normally' do
        Dir.tmpdir do |tmp_home|
          # Check the invocation results
          run_result.stdout.wont_include 'Chef License Acceptance' # --accept-license should not mention accepting the license
          run_result.stderr.must_equal ''
          run_result.exit_status.must_equal 0
        end
      end

      it 'should write a YAML file' do
        Dir.tmpdir do |tmp_home|
          File.exist?(license_persist_path).must_equal false # Sanity check
          run_result
          File.exist?(license_persist_path).must_equal true
          license_persist_contents = YAML.load(File.read(license_persist_path))
          license_persist_contents.keys.must_include 'accepting_product'
          license_persist_contents['accepting_product'].must_equal 'inspec'
        end
      end
    end

    # TODO: find a 'yes yes | ' equivalent in powershell
    unless windows?
      describe 'when the user answers yes to the interactive challenge' do
        let(:run_result) { run_inspec_process('shell -c platform.family', env: env, prefix: 'yes yes | ') }
        it 'should silently work normally' do
          Dir.tmpdir do |tmp_home|
            # Check the invocation results
            run_result.stdout.must_include 'Chef License Acceptance'
            run_result.stderr.must_equal ''
            run_result.exit_status.must_equal 0
          end
        end

        it 'should write a YAML file' do
          Dir.tmpdir do |tmp_home|
            File.exist?(license_persist_path).must_equal false # Sanity check
            run_result
            File.exist?(license_persist_path).must_equal true
          end
        end

        it 'Should not prompt on subsequent runs' do
          Dir.tmpdir do |tmp_home|
            run_result
            second_run_result = run_inspec_process('shell -c platform.family', env: env)

            second_run_result.stdout.wont_include 'Chef License Acceptance'
            second_run_result.stderr.must_equal ''
            second_run_result.exit_status.must_equal 0
          end
        end
      end
    end

    # TODO: find a 'yes no | ' equivalent in powershell
    unless windows?
      describe 'when the user answers no to the interactive challenge' do
        let(:run_result) { run_inspec_process('shell -c platform.family', env: env, prefix: 'yes no | ') }
        it 'should prompt twice and fail with a special code' do
          Dir.tmpdir do |tmp_home|
            # Check the invocation results
            run_result.stdout.must_include 'Chef License Acceptance'
            run_result.stderr.must_include 'License that need accepting' # From first challenge
            run_result.stderr.must_include 'If you do not accept this license' # From second challenge
            # run_result.stderr.must_include 'ERROR' # From failure message
            # run_result.exit_status.must_equal 4 # TODO: coordinate error code
            run_result.exit_status.must_equal 1 # TODO: coordinate error code
          end
        end
      end
    end

    # describe 'when a command is used that should not be gated on licensure' do
    # end
  end

  describe 'when the license has already been accepted' do
    let(:invocation) { 'shell -c platform.family' }

    describe 'when the license was accepted by touching a blank file' do
      it 'should silently work normally' do
        Dir.tmpdir do |tmp_home|
          File.exist?(license_persist_path).must_equal false # Sanity check
          FileUtils.mkdir_p(license_persist_dir)
          FileUtils.touch(license_persist_path)
          File.exist?(license_persist_path).must_equal true # Sanity check

          # Check the invocation results
          run_result.stdout.wont_include 'Chef License Acceptance'
          run_result.stderr.must_equal ''
          run_result.exit_status.must_equal 0
        end
      end
    end

    describe 'when the license persistance file is a YAML file' do
      it 'should silently work normally' do
        Dir.tmpdir do |tmp_home|
          File.exist?(license_persist_path).must_equal false # Sanity check
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
          File.exist?(license_persist_path).must_equal true # Sanity check

          # Check the invocation results
          run_result.stdout.wont_include 'Chef License Acceptance'
          run_result.stderr.must_equal ''
          run_result.exit_status.must_equal 0
        end
      end
    end
  end
end