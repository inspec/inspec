# encoding: utf-8

require 'functional/helper'

describe 'attributes' do
  include FunctionalHelper

  [
    'flat',
    'nested',
  ].each do |attr_file|
    it "runs OK on #{attr_file} attributes" do
      cmd = 'exec '
      cmd += File.join(profile_path, 'attributes')
      cmd += ' --no-create-lockfile'
      cmd += ' --attrs ' + File.join(profile_path, 'attributes', 'attributes', "#{attr_file}.yaml")
      cmd += ' --controls ' + attr_file
      out = inspec(cmd)
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
    end
  end

  describe 'run profile with yaml attributes' do
    it "runs using yml attributes" do
      cmd = 'exec '
      cmd += File.join(profile_path, 'global_attributes')
      cmd += ' --no-create-lockfile'
      cmd += ' --attrs ' + File.join(profile_path, 'global_attributes', 'files', "attr.yml")
      out = inspec(cmd)
      out.stderr.must_equal ''
      out.stdout.must_include '20 successful'
      out.exit_status.must_equal 0
    end

    it "errors with invalid attribute types" do
      cmd = 'exec '
      cmd += File.join(profile_path, 'invalid_attributes')
      cmd += ' --no-create-lockfile'
      out = inspec(cmd)
      out.stderr.must_equal "Type 'Color' is not a valid attribute type.\n"
      out.stdout.must_equal ''
      out.exit_status.must_equal 1
    end

    it "errors with required attribute not defined" do
      cmd = 'exec '
      cmd += File.join(profile_path, 'required_attributes')
      cmd += ' --no-create-lockfile'
      out = inspec(cmd)
      out.stderr.must_equal "Attribute 'username' is required and does not have a value.\n"
      out.stdout.must_equal ''
      out.exit_status.must_equal 1
    end
  end
end
