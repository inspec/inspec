require 'functional/helper'
require 'tmpdir'
require 'yaml'

# File.join(ENV['HOME'], '.chef', 'accepted_licenses')

describe 'The license acceptance mechanism' do
  let(:env) { { HOME => tmp_home } }
  let(:run_result) { run_inspec_process(invocation, env: env) }
  let(:license_persist_path) { File.join(tmp_home, '.chef', 'accepted_licenses', 'inspec') }

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

    describe 'when the user answers yes to the interactive challenge' do
    end

    describe 'when the user answers no to the interactive challenge' do
    end

    describe 'when a command is used that should not be gated on licensure' do
    end

  end

  describe 'when the license has already been accepted' do
    describe 'when the license was accepted by touching a blank file' do
    end

    describe 'when the license persistance file is a YAML file' do
    end
  end
end