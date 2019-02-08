# encoding: utf-8

require 'functional/helper'

describe 'attributes' do
  include FunctionalHelper

  #==============================================================#
  #                     Using --attrs                            #
  #==============================================================#
  let(:attribute_profiles_path) { File.join(profile_path, 'attributes') }
  [
    'flat',
    'nested',
  ].each do |attr_file|
    it "runs OK on #{attr_file} attributes" do
      cmd = 'exec '
      cmd += File.join(attribute_profiles_path, 'basic')
      cmd += ' --no-create-lockfile'
      cmd += ' --attrs ' + File.join(attribute_profiles_path, 'basic', 'files', "#{attr_file}.yaml")
      cmd += ' --controls ' + attr_file
      out = inspec(cmd)
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
    end
  end

  #==============================================================#
  #              Metadata attributes (inspec.yml)                #
  #==============================================================#
  describe 'run profile with yaml attributes' do
    it "runs using yml attributes" do
      cmd = 'exec '
      cmd += File.join(attribute_profiles_path, 'global')
      cmd += ' --no-create-lockfile'
      cmd += ' --attrs ' + File.join(attribute_profiles_path, 'global', 'files', "attr.yml")
      out = inspec(cmd)
      out.stderr.must_equal ''
      out.stdout.must_include '21 successful'
      out.exit_status.must_equal 0
    end

    it "does not error when attributes are empty" do
      cmd = 'exec '
      cmd += File.join(attribute_profiles_path, 'metadata-empty')
      cmd += ' --no-create-lockfile'
      out = inspec(cmd)
      out.stdout.must_include 'WARN: Attributes must be defined as an Array. Skipping current definition.'
      out.exit_status.must_equal 0
    end

    it "errors with invalid attribute types" do
      cmd = 'exec '
      cmd += File.join(attribute_profiles_path, 'metadata-invalid')
      cmd += ' --no-create-lockfile'
      out = inspec(cmd)
      out.stderr.must_equal "Type 'Color' is not a valid attribute type.\n"
      out.stdout.must_equal ''
      out.exit_status.must_equal 1
    end

    it "errors with required attribute not defined" do
      cmd = 'exec '
      cmd += File.join(attribute_profiles_path, 'required')
      cmd += ' --no-create-lockfile'
      out = inspec(cmd)
      out.stderr.must_equal "Attribute 'username' is required and does not have a value.\n"
      out.stdout.must_equal ''
      out.exit_status.must_equal 1
    end
  end

  #==============================================================#
  #                     Precedence Checks                        #
  #==============================================================#
  # Fixture info: each attribute may be defined in several places.
  # 'precedence' is a profile that depends on 'precedence-wrappee'
  # The controls in 'precedence' check the expected values.
  # All values are strings, and describe where the attribute was set.

  # I = inline, A = --attrs flag, M = metadata file
  # C = create/mention, S = set value, D = set using legacy 'default' option

  #            |            | precedence- |
  #            | precedence |  wrappee    |
  #  attr name |  I | M | A |   I  |   M  | Expected value
  #  ----------+----+---+---+------+------+------------------
  #    test_01 |  S |   |   |      |      | 'value from precedence inline'
  #    test_02 |  C | S |   |      |      | 'value from precedence metadata'
  #    test_03 |  S | S |   |      |      | 'value from precedence metadata'
  #    test_04 |  C |   | S |      |      | 'value from precedence attrfile'
  #    test_05 |  S |   | S |      |      | 'value from precedence attrfile'
  #    test_06 |  C | S | S |      |      | 'value from precedence attrfile'
  #    test_07 |  S | S | S |      |      | 'value from precedence attrfile'
  #    test_08 |    |   | S |      |      | 'value from precedence attrfile'
  #    test_09 |    | S | S |      |      | 'value from precedence attrfile'
  #    test_10 |  D |   |   |      |      | 'value from precedence inline'
  #    test_11 |  D | D |   |      |      | 'value from precedence metadata'
  #    test_12 |  S | D |   |      |      | 'value from precedence metadata'
  #    test_13 |  D | S |   |      |      | 'value from precedence metadata'
  #    test_14 |    |   |   |   S  |      | 'value from precedence-wrappee inline'
  #    test_15 |    |   |   |   C  |   S  | 'value from precedence-wrappee metadata'
  #    test_16 |    |   |   |   S  |   S  | 'value from precedence-wrappee metadata'
  #    test_17 |    |   | S |      |   S  | 'value from precedence attrfile'
  #    test_18 |    | S |   |      |   S  | 'value from precedence metadata'
  #    test_19 |  C |   |   |      |   S  | 'value from precedence-wrappee metadata'
  #    test_20 |  S |   |   |      |   S  | 'value from precedence-wrappee metadata'
  #    test_21 |  S |   |   |   S  |      | 'value from precedence inline'
  #    test_22 |    | S |   |   S  |      | 'value from precedence metadata'
  #    test_23 |    |   | S |   S  |      | 'value from precedence attrfile'

  describe 'run profile to check attr precedence rules' do
    it "gets the correct results" do
      invocation = 'exec '
      invocation += File.join(attribute_profiles_path, 'precedence')
      invocation += ' --attrs ' + File.join(attribute_profiles_path, 'precedence', 'files', "attr.yaml")
      run_result = run_inspec_process(invocation, json: true)
      run_result.stderr.must_equal ''

      results = run_result.payload.json['profiles'][0]['controls'].each_with_object({}) {|c, h| h[c['id']] = c['results'][0]; h }

      results.each do |test_name, result|
        if result['status'] == 'failed'
          # "\nexpected: \"value from precedence metadata\"\n     got: \"value from precedence-wrappee metadata\"\n\n(compared using `cmp` matcher)\n"
          expected = result['message'].match(%r{expected: \"([a-z ]+)\"})[1]
          got = result['message'].match(%r{got: \"([a-z ]+)\"})[1]
          reason = "expected '#{expected}', got '#{got}'"
        else
          reason = ''
        end
        "#{test_name}:#{result['status']}(#{reason})".must_equal "#{test_name}:passed()"
      end
    end
  end
end
