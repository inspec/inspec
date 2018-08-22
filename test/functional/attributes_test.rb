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

  describe 'global attributes' do
    it "runs using all global attribute types" do
      cmd = 'exec '
      cmd += File.join(profile_path, 'global_attributes')
      cmd += ' --no-create-lockfile'
      cmd += ' --attrs ' + File.join(profile_path, 'global_attributes', 'files', "attr.yml")
      out = inspec(cmd)
      out.stderr.must_equal ''
      out.stdout.must_include '19 successful'
      out.exit_status.must_equal 0
    end
  end
end
