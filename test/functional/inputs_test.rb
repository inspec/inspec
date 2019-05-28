require 'functional/helper'

describe 'inputs' do
  include FunctionalHelper
  let(:inputs_profiles_path) { File.join(profile_path, 'inputs') }

  # This tests being able to load complex structures from
  # cli option-specified files.
  [
    'flat',
    'nested',
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

  describe 'when accessing inputs in a variety of scopes using the DSL' do
    it "is able to read the inputs using the input keyword" do
      cmd = "exec #{inputs_profiles_path}/scoping"
      result = run_inspec_process(cmd, json: true)
      result.must_have_all_controls_passing
    end
    it "is able to read the inputs using the legacy attribute keyword" do
      cmd = "exec #{inputs_profiles_path}/legacy-attributes-dsl"
      result = run_inspec_process(cmd, json: true)
      result.must_have_all_controls_passing
    end
  end

  describe 'run profile with metadata inputs' do
    it "does not error when inputs are empty" do
      cmd = 'exec '
      cmd += File.join(inputs_profiles_path, 'metadata-empty')
      result = run_inspec_process(cmd, json: true)
      result.stderr.must_include 'WARN: Inputs must be defined as an Array. Skipping current definition.'
      result.exit_status.must_equal 0
    end

    it "errors with invalid input types" do
      cmd = 'exec '
      cmd += File.join(inputs_profiles_path, 'metadata-invalid')
      result = run_inspec_process(cmd, json: true)
      result.stderr.must_equal "Type 'Color' is not a valid input type.\n"
      result.exit_status.must_equal 1
    end

    it "errors with required input not defined" do
      cmd = 'exec '
      cmd += File.join(inputs_profiles_path, 'metadata-required')
      result = run_inspec_process(cmd, json: true)
      result.stderr.must_include "Input 'a_required_input' is required and does not have a value.\n"
      result.exit_status.must_equal 1
    end

    describe 'when profile inheritance is used' do
      it 'should correctly assign input values using namespacing' do
        cmd = 'exec ' + File.join(inputs_profiles_path, 'inheritance', 'wrapper')
        result = run_inspec_process(cmd, json: true)
        result.must_have_all_controls_passing
      end
    end
  end

  describe 'when using a profile with undeclared (valueless) inputs' do
    it 'should warn about them and not abort the run' do
      cmd = "exec #{inputs_profiles_path}/undeclared"
      result = run_inspec_process(cmd, json: true)
      result.stderr.must_include "WARN: Input 'undeclared_01'"
      result.stderr.must_include 'does not have a value'
      result.must_have_all_controls_passing
    end
  end
end
