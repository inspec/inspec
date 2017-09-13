require 'helper'

describe Compliance::API do
  let(:profiles_response) do
    [{"name"=>"apache-baseline",
      "title"=>"DevSec Apache Baseline",
      "maintainer"=>"DevSec Hardening Framework Team",
      "copyright"=>"DevSec Hardening Framework Team",
      "copyright_email"=>"hello@dev-sec.io",
      "license"=>"Apache 2 license",
      "summary"=>"Test-suite for best-practice apache hardening",
      "version"=>"2.0.2",
      "supports"=>[{"os-family"=>"unix"}],
      "depends"=>nil,
      "owner_id"=>"admin"},
     {"name"=>"apache-baseline",
      "title"=>"DevSec Apache Baseline",
      "maintainer"=>"Hardening Framework Team",
      "copyright"=>"Hardening Framework Team",
      "copyright_email"=>"hello@dev-sec.io",
      "license"=>"Apache 2 license",
      "summary"=>"Test-suite for best-practice apache hardening",
      "version"=>"2.0.1",
      "supports"=>[{"os-family"=>"unix"}],
      "depends"=>nil,
      "latest_version"=>"2.0.2",
      "owner_id"=>"admin"},
     {"name"=>"cis-aix-5.3-6.1-level1",
      "title"=>"CIS AIX 5.3 and AIX 6.1 Benchmark Level 1",
      "maintainer"=>"Chef Software, Inc.",
      "copyright"=>"Chef Software, Inc.",
      "copyright_email"=>"support@chef.io",
      "license"=>"Proprietary, All rights reserved",
      "summary"=>"CIS AIX 5.3 and AIX 6.1 Benchmark Level 1 translated from SCAP",
      "version"=>"1.1.0",
      "supports"=>nil,
      "depends"=>nil,
      "latest_version"=>"1.1.0-3",
      "owner_id"=>"admin"}]
  end

  describe '.version' do
    let(:headers) { 'test-headers' }
    let(:config) do
      {
        'server' => 'myserver',
        'insecure' => true
      }
    end

    before do
      Compliance::API.expects(:get_headers).returns(headers)
    end

    describe 'when a 404 is received' do
      it 'should return an empty hash' do
        response = mock
        response.stubs(:code).returns('404')
        Compliance::HTTP.expects(:get).with('myserver/version', 'test-headers', true).returns(response)
        Compliance::API.version(config).must_equal({})
      end
    end

    describe 'when the returned body is nil' do
      it 'should return an empty hash' do
        response = mock
        response.stubs(:code).returns('200')
        response.stubs(:body).returns(nil)
        Compliance::HTTP.expects(:get).with('myserver/version', 'test-headers', true).returns(response)
        Compliance::API.version(config).must_equal({})
      end
    end

    describe 'when the returned body is an empty string' do
      it 'should return an empty hash' do
        response = mock
        response.stubs(:code).returns('200')
        response.stubs(:body).returns('')
        Compliance::HTTP.expects(:get).with('myserver/version', 'test-headers', true).returns(response)
        Compliance::API.version(config).must_equal({})
      end
    end

    describe 'when the returned body has no version key' do
      it 'should return an empty hash' do
        response = mock
        response.stubs(:code).returns('200')
        response.stubs(:body).returns('{"api":"compliance"}')
        Compliance::HTTP.expects(:get).with('myserver/version', 'test-headers', true).returns(response)
        Compliance::API.version(config).must_equal({})
      end
    end

    describe 'when the returned body has an empty version key' do
      it 'should return an empty hash' do
        response = mock
        response.stubs(:code).returns('200')
        response.stubs(:body).returns('{"api":"compliance","version":""}')
        Compliance::HTTP.expects(:get).with('myserver/version', 'test-headers', true).returns(response)
        Compliance::API.version(config).must_equal({})
      end
    end

    describe 'when the returned body has a proper version' do
      it 'should return an empty hash' do
        response = mock
        response.stubs(:code).returns('200')
        response.stubs(:body).returns('{"api":"compliance","version":"1.2.3"}')
        Compliance::HTTP.expects(:get).with('myserver/version', 'test-headers', true).returns(response)
        Compliance::API.version(config).must_equal({'version' => '1.2.3', 'api' => 'compliance'})
      end
    end
  end

  describe 'automate/compliance is? checks' do
    describe 'when the config has a compliance server_type' do
      it 'automate/compliance server is? methods return correctly' do
        config = Compliance::Configuration.new
        config.clean
        config['server_type'] = 'compliance'
        Compliance::API.is_compliance_server?(config).must_equal true
        Compliance::API.is_automate_server?(config).must_equal false
        Compliance::API.is_automate_server_pre_080?(config).must_equal false
        Compliance::API.is_automate_server_080_and_later?(config).must_equal false
      end
    end

    describe 'when the config has an automate server_type and no version key' do
      it 'automate/compliance server is? methods return correctly' do
        config = Compliance::Configuration.new
        config.clean
        config['server_type'] = 'automate'
        Compliance::API.is_compliance_server?(config).must_equal false
        Compliance::API.is_automate_server?(config).must_equal true
        Compliance::API.is_automate_server_pre_080?(config).must_equal true
        Compliance::API.is_automate_server_080_and_later?(config).must_equal false
      end
    end

    describe 'when the config has an automate server_type and a version key that is not a hash' do
      it 'automate/compliance server is? methods return correctly' do
        config = Compliance::Configuration.new
        config.clean
        config['server_type'] = 'automate'
        config['version'] = '1.2.3'
        Compliance::API.is_compliance_server?(config).must_equal false
        Compliance::API.is_automate_server?(config).must_equal true
        Compliance::API.is_automate_server_pre_080?(config).must_equal true
        Compliance::API.is_automate_server_080_and_later?(config).must_equal false
      end
    end

    describe 'when the config has an automate server_type and a version hash with no version' do
      it 'automate/compliance server is? methods return correctly' do
        config = Compliance::Configuration.new
        config.clean
        config['server_type'] = 'automate'
        config['version'] = {}
        Compliance::API.is_compliance_server?(config).must_equal false
        Compliance::API.is_automate_server?(config).must_equal true
        Compliance::API.is_automate_server_pre_080?(config).must_equal true
        Compliance::API.is_automate_server_080_and_later?(config).must_equal false
      end
    end

    describe 'when the config has an automate server_type and a version hash with a version' do
      it 'automate/compliance server is? methods return correctly' do
        config = Compliance::Configuration.new
        config.clean
        config['server_type'] = 'automate'
        config['version'] = { 'version' => '0.8.1' }
        Compliance::API.is_compliance_server?(config).must_equal false
        Compliance::API.is_automate_server?(config).must_equal true
        Compliance::API.is_automate_server_pre_080?(config).must_equal false
        Compliance::API.is_automate_server_080_and_later?(config).must_equal true
      end
    end
  end

  describe '.server_version_from_config' do
    it 'returns nil when the config has no version key' do
      config = {}
      Compliance::API.server_version_from_config(config).must_be_nil
    end

    it 'returns nil when the version value is not a hash' do
      config = { 'version' => '123' }
      Compliance::API.server_version_from_config(config).must_be_nil
    end

    it 'returns nil when the version value is a hash but has no version key inside' do
      config = { 'version' => {} }
      Compliance::API.server_version_from_config(config).must_be_nil
    end

    it 'returns the version if the version value is a hash containing a version' do
      config = { 'version' => { 'version' => '1.2.3' } }
      Compliance::API.server_version_from_config(config).must_equal '1.2.3'
    end
  end

  describe 'profile_split' do
    it 'handles a profile without version' do
      Compliance::API.profile_split('admin/apache-baseline').must_equal ['admin', 'apache-baseline', nil]
    end

    it 'handles a profile with a version' do
      Compliance::API.profile_split('admin/apache-baseline#2.0.1').must_equal ['admin', 'apache-baseline', '2.0.1']
    end
  end

  describe 'target_url' do
    it 'handles a automate profile with and without version' do
      config = Compliance::Configuration.new
      config.clean
      config['server_type'] = 'automate'
      config['server'] = 'https://myautomate'
      config['version'] = '1.6.99'
      Compliance::API.target_url(config, 'admin/apache-baseline').must_equal       'https://myautomate/profiles/admin/apache-baseline/tar'
      Compliance::API.target_url(config, 'admin/apache-baseline#2.0.2').must_equal 'https://myautomate/profiles/admin/apache-baseline/version/2.0.2/tar'
    end

    it 'handles a chef-compliance profile with and without version' do
      config = Compliance::Configuration.new
      config.clean
      config['server_type'] = 'compliance'
      config['server'] = 'https://mychefcompliance'
      config['version'] = '1.1.2'
      Compliance::API.target_url(config, 'admin/apache-baseline').must_equal       'https://mychefcompliance/owners/admin/compliance/apache-baseline/tar'
      Compliance::API.target_url(config, 'admin/apache-baseline#2.0.2').must_equal 'https://mychefcompliance/owners/admin/compliance/apache-baseline/tar'
    end
  end

  describe 'exist?' do
    it 'works with profiles returned by Automate' do
      config = Compliance::Configuration.new
      config.clean
      config['server_type'] = 'automate'
      config['server'] = 'https://myautomate'
      config['version'] = '1.6.99'
      profile = mock
      profile.stubs(:profiles).returns(profiles_response)
      Compliance::API.exist?(config, 'admin/apache-baseline').must_equal true
      Compliance::API.exist?(config, 'admin/apache-baseline#2.0.1').must_equal true
      Compliance::API.exist?(config, 'admin/apache-baseline#2.0.999').must_equal false
      Compliance::API.exist?(config, 'admin/missing-in-action').must_equal false
    end

  end
end
