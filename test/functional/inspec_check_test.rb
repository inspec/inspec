# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'
require 'jsonschema'
require 'tmpdir'

describe 'inspec check' do
  include FunctionalHelper

  describe 'inspec check with json formatter' do
    it 'can check a profile and produce valid JSON' do
      out = inspec('check ' + integration_test_path + ' --format json')
      out.exit_status.must_equal 0
      JSON.parse(out.stdout)
    end
  end

  describe 'inspec check with special characters in path' do
    it 'can check a profile with special characters in its path' do
      out = inspec('check ' + File.join(profile_path, '{{special-path}}'))
      out.exit_status.must_equal 0
    end
  end

  describe 'inspec check with skipping/failing a resource in FilterTable' do
    it 'can check a profile containing resource exceptions' do
      out = inspec('check ' + File.join(profile_path, 'profile-with-resource-exceptions'))
      out.exit_status.must_equal 0
    end
  end

  describe 'inspec check with a profile containing only_if' do
    it 'ignores the `only_if`' do
      out = inspec('check ' + File.join(profile_path, 'only-if-os-nope'))
      out.exit_status.must_equal 0
    end
  end

  describe 'inspec check with a aws profile' do
    it 'ignore train connection error' do
      out = inspec('check ' + File.join(examples_path, 'profile-aws'))
      out.exit_status.must_equal 0
    end
  end

  describe 'inspec check with a azure profile' do
    it 'ignore train connection error' do
      out = inspec('check ' + File.join(examples_path, 'profile-azure'))
      out.exit_status.must_equal 0
    end
  end

  describe 'inspec check with alternate cache dir' do
    it 'writes to the alternate cache dir' do
      Dir.mktmpdir do |tmpdir|
        cache_dir = File.join(tmpdir, "inspec_check_test_cache")

        File.exist?(cache_dir).must_equal false
        out = inspec('check ' + integration_test_path + ' --vendor-cache ' + cache_dir)
        out.exit_status.must_equal 0

        File.exist?(cache_dir).must_equal true
      end
    end
  end
end
