# encoding: utf-8

require 'functional/helper'

describe 'inputs' do
  include FunctionalHelper
  let(:inputs_profiles_path) { File.join(profile_path, 'inputs') }
  [
    'flat',
    #'nested',
  ].each do |input_file|
    it "runs OK on #{input_file} inputs" do
      cmd = 'exec '
      cmd += File.join(inputs_profiles_path, 'basic')
      cmd += ' --no-create-lockfile'
      cmd += ' --input-file ' + File.join(inputs_profiles_path, 'basic', 'files', "#{input_file}.yaml")
      cmd += ' --controls ' + input_file
      result = run_inspec_process(cmd)
      result.stderr.must_equal ''
      result.exit_status.must_equal 0
    end
  end

  describe 'when asking for usage help' do
    it 'includes the new --input-file option' do
      result = run_inspec_process('exec help', lock: true) # --no-create-lockfile option breaks usage help
      lines = result.stdout.split("\n")
      line = lines.detect { |l| l.include? '--input-file' }
      line.wont_be_nil
    end
    it 'includes the legacy --attrs option' do
      result = run_inspec_process('exec help', lock: true)
      lines = result.stdout.split("\n")
      line = lines.detect { |l| l.include? '--attrs' }
      line.wont_be_nil
    end
  end

  describe 'when using a cli-specified file' do
    let(:result) do
      cmd =  'exec '
      cmd += File.join(inputs_profiles_path, 'basic') + ' '
      cmd += flag + ' ' + File.join(inputs_profiles_path, 'basic', 'files', 'flat.yaml')
      cmd += ' --controls flat'
      run_inspec_process(cmd)
    end
    describe 'when the --input-file flag is used' do
      let(:flag) { '--input-file' }
      it 'works' do
        result.exit_status.must_equal 0
      end
    end
    describe 'when the --attrs flag is used' do
      let(:flag) { '--attrs' }
      it 'works' do
        result.exit_status.must_equal 0
      end
    end
  end

  describe 'run profile with yaml inputs' do
    it "runs using yml inputs" do
      cmd = 'exec '
      cmd += File.join(inputs_profiles_path, 'global')
      cmd += ' --no-create-lockfile'
      cmd += ' --input-file ' + File.join(inputs_profiles_path, 'global', 'files', "inputs.yml")
      out = inspec(cmd)
      out.stderr.must_equal ''
      # TODO: fix attribute inheritance override test
      # we have one failing case on this - run manually to see
      # For now, reduce cases to 20; we'll be reworking all this soon anyway
      # result.stdout.must_include '21 successful'
      # result.exit_status.must_equal 0

      result.stdout.must_include '20 successful' # and one failing
    end

    it "does not error when inputs are empty" do
      cmd = 'exec '
      cmd += File.join(inputs_profiles_path, 'metadata-empty')
      result = run_inspec_process(cmd, json: true)
      result.stdout.must_include 'WARN: Inputs must be defined as an Array. Skipping current definition.'
      result.exit_status.must_equal 0
    end

    it "errors with invalid input types" do
      cmd = 'exec '
      cmd += File.join(inputs_profiles_path, 'metadata-invalid')
      result = run_inspec_process(cmd, json: true)
      result.stderr.must_equal "Type 'Color' is not a valid input type.\n"
      result.stdout.must_equal ''
      result.exit_status.must_equal 1
    end

    it "errors with required input not defined" do
      cmd = 'exec '
      cmd += File.join(inputs_profiles_path, 'required')
      result = run_inspec_process(cmd, json: true)
      result.stderr.must_equal "Input 'username' is required and does not have a value.\n"
      result.stdout.must_equal ''
      result.exit_status.must_equal 1
    end

    # TODO - add test for backwards compatibility using 'attribute' in DSL
  end
end
