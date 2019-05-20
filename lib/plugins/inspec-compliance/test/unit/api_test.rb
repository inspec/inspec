require 'minitest/autorun'
require 'webmock/minitest'
require 'mocha/setup'
require_relative '../../lib/inspec-compliance/api.rb'

describe InspecPlugins::Compliance::API do
  let(:profiles_response) do
    [{ 'name'=>'apache-baseline',
      'title'=>'DevSec Apache Baseline',
      'maintainer'=>'DevSec Hardening Framework Team',
      'copyright'=>'DevSec Hardening Framework Team',
      'copyright_email'=>'hello@dev-sec.io',
      'license'=>'Apache 2 license',
      'summary'=>'Test-suite for best-practice apache hardening',
      'version'=>'2.0.2',
      'supports'=>[{ 'os-family'=>'unix' }],
      'depends'=>nil,
      'owner_id'=>'admin' },
     { 'name'=>'apache-baseline',
      'title'=>'DevSec Apache Baseline',
      'maintainer'=>'Hardening Framework Team',
      'copyright'=>'Hardening Framework Team',
      'copyright_email'=>'hello@dev-sec.io',
      'license'=>'Apache 2 license',
      'summary'=>'Test-suite for best-practice apache hardening',
      'version'=>'2.0.1',
      'supports'=>[{ 'os-family'=>'unix' }],
      'depends'=>nil,
      'latest_version'=>'2.0.2',
      'owner_id'=>'admin' },
     { 'name'=>'cis-aix-5.3-6.1-level1',
      'title'=>'CIS AIX 5.3 and AIX 6.1 Benchmark Level 1',
      'maintainer'=>'Chef Software, Inc.',
      'copyright'=>'Chef Software, Inc.',
      'copyright_email'=>'support@chef.io',
      'license'=>'Proprietary, All rights reserved',
      'summary'=>'CIS AIX 5.3 and AIX 6.1 Benchmark Level 1 translated from SCAP',
      'version'=>'1.1.0',
      'supports'=>nil,
      'depends'=>nil,
      'latest_version'=>'1.1.0-3',
      'owner_id'=>'admin' }]
  end

  describe '.version' do
    let(:headers) { 'test-headers' }
    let(:config) do
      {
        'server' => 'myserver',
        'insecure' => true,
      }
    end

    before do
      InspecPlugins::Compliance::API.expects(:get_headers).returns(headers)
    end

    describe 'when a 404 is received' do
      it 'should return an empty hash' do
        response = mock
        response.stubs(:code).returns('404')
        InspecPlugins::Compliance::HTTP.expects(:get).with('myserver/version', 'test-headers', true).returns(response)
        InspecPlugins::Compliance::API.version(config).must_equal({})
      end
    end

    describe 'when the returned body is nil' do
      it 'should return an empty hash' do
        response = mock
        response.stubs(:code).returns('200')
        response.stubs(:body).returns(nil)
        InspecPlugins::Compliance::HTTP.expects(:get).with('myserver/version', 'test-headers', true).returns(response)
        InspecPlugins::Compliance::API.version(config).must_equal({})
      end
    end

    describe 'when the returned body is an empty string' do
      it 'should return an empty hash' do
        response = mock
        response.stubs(:code).returns('200')
        response.stubs(:body).returns('')
        InspecPlugins::Compliance::HTTP.expects(:get).with('myserver/version', 'test-headers', true).returns(response)
        InspecPlugins::Compliance::API.version(config).must_equal({})
      end
    end

    describe 'when the returned body has no version key' do
      it 'should return an empty hash' do
        response = mock
        response.stubs(:code).returns('200')
        response.stubs(:body).returns('{"api":"compliance"}')
        InspecPlugins::Compliance::HTTP.expects(:get).with('myserver/version', 'test-headers', true).returns(response)
        InspecPlugins::Compliance::API.version(config).must_equal({})
      end
    end

    describe 'when the returned body has an empty version key' do
      it 'should return an empty hash' do
        response = mock
        response.stubs(:code).returns('200')
        response.stubs(:body).returns('{"api":"compliance","version":""}')
        InspecPlugins::Compliance::HTTP.expects(:get).with('myserver/version', 'test-headers', true).returns(response)
        InspecPlugins::Compliance::API.version(config).must_equal({})
      end
    end

    describe 'when the returned body has a proper version' do
      it 'should return an empty hash' do
        response = mock
        response.stubs(:code).returns('200')
        response.stubs(:body).returns('{"api":"compliance","version":"1.2.3"}')
        InspecPlugins::Compliance::HTTP.expects(:get).with('myserver/version', 'test-headers', true).returns(response)
        InspecPlugins::Compliance::API.version(config).must_equal({ 'version' => '1.2.3', 'api' => 'compliance' })
      end
    end
  end

  describe 'automate/compliance is? checks' do
    describe 'when the config has a compliance server_type' do
      it 'automate/compliance server is? methods return correctly' do
        config = InspecPlugins::Compliance::Configuration.new
        config.clean
        config['server_type'] = 'compliance'
        InspecPlugins::Compliance::API.is_compliance_server?(config).must_equal true
        InspecPlugins::Compliance::API.is_automate_server?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate_server_pre_080?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate_server_080_and_later?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate2_server?(config).must_equal false
      end
    end

    describe 'when the config has a automate2 server_type' do
      it 'automate/compliance server is? methods return correctly' do
        config = InspecPlugins::Compliance::Configuration.new
        config.clean
        config['server_type'] = 'automate2'
        InspecPlugins::Compliance::API.is_compliance_server?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate_server?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate_server_pre_080?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate_server_080_and_later?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate2_server?(config).must_equal true
      end
    end

    describe 'when the config has an automate server_type and no version key' do
      it 'automate/compliance server is? methods return correctly' do
        config = InspecPlugins::Compliance::Configuration.new
        config.clean
        config['server_type'] = 'automate'
        InspecPlugins::Compliance::API.is_compliance_server?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate_server?(config).must_equal true
        InspecPlugins::Compliance::API.is_automate_server_pre_080?(config).must_equal true
        InspecPlugins::Compliance::API.is_automate_server_080_and_later?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate2_server?(config).must_equal false
      end
    end

    describe 'when the config has an automate server_type and a version key that is not a hash' do
      it 'automate/compliance server is? methods return correctly' do
        config = InspecPlugins::Compliance::Configuration.new
        config.clean
        config['server_type'] = 'automate'
        config['version'] = '1.2.3'
        InspecPlugins::Compliance::API.is_compliance_server?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate_server?(config).must_equal true
        InspecPlugins::Compliance::API.is_automate_server_pre_080?(config).must_equal true
        InspecPlugins::Compliance::API.is_automate_server_080_and_later?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate2_server?(config).must_equal false
      end
    end

    describe 'when the config has an automate server_type and a version hash with no version' do
      it 'automate/compliance server is? methods return correctly' do
        config = InspecPlugins::Compliance::Configuration.new
        config.clean
        config['server_type'] = 'automate'
        config['version'] = {}
        InspecPlugins::Compliance::API.is_compliance_server?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate_server?(config).must_equal true
        InspecPlugins::Compliance::API.is_automate_server_pre_080?(config).must_equal true
        InspecPlugins::Compliance::API.is_automate_server_080_and_later?(config).must_equal false
      end
    end

    describe 'when the config has an automate server_type and a version hash with a version' do
      it 'automate/compliance server is? methods return correctly' do
        config = InspecPlugins::Compliance::Configuration.new
        config.clean
        config['server_type'] = 'automate'
        config['version'] = { 'version' => '0.8.1' }
        InspecPlugins::Compliance::API.is_compliance_server?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate_server?(config).must_equal true
        InspecPlugins::Compliance::API.is_automate_server_pre_080?(config).must_equal false
        InspecPlugins::Compliance::API.is_automate_server_080_and_later?(config).must_equal true
      end
    end
  end

  describe '.server_version_from_config' do
    it 'returns nil when the config has no version key' do
      config = {}
      InspecPlugins::Compliance::API.server_version_from_config(config).must_be_nil
    end

    it 'returns nil when the version value is not a hash' do
      config = { 'version' => '123' }
      InspecPlugins::Compliance::API.server_version_from_config(config).must_be_nil
    end

    it 'returns nil when the version value is a hash but has no version key inside' do
      config = { 'version' => {} }
      InspecPlugins::Compliance::API.server_version_from_config(config).must_be_nil
    end

    it 'returns the version if the version value is a hash containing a version' do
      config = { 'version' => { 'version' => '1.2.3' } }
      InspecPlugins::Compliance::API.server_version_from_config(config).must_equal '1.2.3'
    end
  end

  describe 'profile_split' do
    it 'handles a profile without version' do
      InspecPlugins::Compliance::API.profile_split('admin/apache-baseline').must_equal ['admin', 'apache-baseline', nil]
    end

    it 'handles a profile with a version' do
      InspecPlugins::Compliance::API.profile_split('admin/apache-baseline#2.0.1').must_equal ['admin', 'apache-baseline', '2.0.1']
    end
  end

  describe 'target_url' do
    it 'handles a automate profile with and without version' do
      config = InspecPlugins::Compliance::Configuration.new
      config.clean
      config['server_type'] = 'automate'
      config['server'] = 'https://myautomate'
      config['version'] = '1.6.99'
      InspecPlugins::Compliance::API.target_url(config, 'admin/apache-baseline').must_equal       'https://myautomate/profiles/admin/apache-baseline/tar'
      InspecPlugins::Compliance::API.target_url(config, 'admin/apache-baseline#2.0.2').must_equal 'https://myautomate/profiles/admin/apache-baseline/version/2.0.2/tar'
    end

    it 'handles a chef-compliance profile with and without version' do
      config = InspecPlugins::Compliance::Configuration.new
      config.clean
      config['server_type'] = 'compliance'
      config['server'] = 'https://mychefcompliance'
      config['version'] = '1.1.2'
      InspecPlugins::Compliance::API.target_url(config, 'admin/apache-baseline').must_equal       'https://mychefcompliance/owners/admin/compliance/apache-baseline/tar'
      InspecPlugins::Compliance::API.target_url(config, 'admin/apache-baseline#2.0.2').must_equal 'https://mychefcompliance/owners/admin/compliance/apache-baseline/tar'
    end
  end

  describe 'exist?' do
    it 'works with profiles returned by Automate' do
      # ruby 2.3.3 has issues running stub_requests properly
      # skipping for that specific version
      return if RUBY_VERSION == '2.3.3'

      config = InspecPlugins::Compliance::Configuration.new
      config.clean
      config['owner'] = 'admin'
      config['server_type'] = 'automate'
      config['server'] = 'https://myautomate'
      config['version'] = '1.6.99'
      config['automate'] = { 'ent'=>'automate', 'token_type'=>'dctoken' }
      config['version'] = { 'api'=> 'compliance', 'version'=>'0.8.24' }
      
      stub_request(:get, 'https://myautomate/profiles/admin')
        .with(headers: { 'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Chef-Delivery-Enterprise'=>'automate', 'User-Agent'=>'Ruby', 'X-Data-Collector-Token'=>'' })
        .to_return(status: 200, body: profiles_response.to_json, headers: {})

      InspecPlugins::Compliance::API.exist?(config, 'admin/apache-baseline').must_equal true
      InspecPlugins::Compliance::API.exist?(config, 'admin/apache-baseline#2.0.1').must_equal true
      InspecPlugins::Compliance::API.exist?(config, 'admin/apache-baseline#2.0.999').must_equal false
      InspecPlugins::Compliance::API.exist?(config, 'admin/missing-in-action').must_equal false
    end
  end

  describe '.determine_server_type' do
    let(:url) { 'https://someserver.onthe.net/' }

    let(:compliance_endpoint) { '/api/version' }
    let(:automate_endpoint) { '/compliance/version' }
    let(:automate2_endpoint) { '/dex/auth' }
    let(:headers) { nil }
    let(:insecure) { true }

    let(:good_response) { mock }
    let(:bad_response) { mock }

    it 'returns `:automate2` when a 400 is received from `https://URL/dex/auth`' do
      good_response.stubs(:code).returns('400')

      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + automate2_endpoint, headers, insecure)
                      .returns(good_response)

      InspecPlugins::Compliance::API.determine_server_type(url, insecure).must_equal(:automate2)
    end

    it 'returns `:automate` when a 401 is received from `https://URL/compliance/version`' do
      good_response.stubs(:code).returns('401')
      bad_response.stubs(:code).returns('404')

      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + automate2_endpoint, headers, insecure)
                      .returns(bad_response)
      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + automate_endpoint, headers, insecure)
                      .returns(good_response)

      InspecPlugins::Compliance::API.determine_server_type(url, insecure).must_equal(:automate)
    end

    # Chef Automate currently returns 401 for `/compliance/version` but some
    # versions of OpsWorks Chef Automate return 200 and a Chef Manage page when
    # unauthenticated requests are received.
    it 'returns `:automate` when a 200 is received from `https://URL/compliance/version`' do
      bad_response.stubs(:code).returns('404')
      good_response.stubs(:code).returns('200')
      good_response.stubs(:body).returns('Are You Looking For the Chef Server?')

      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + automate2_endpoint, headers, insecure)
                      .returns(bad_response)
      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + automate_endpoint, headers, insecure)
                      .returns(good_response)

      InspecPlugins::Compliance::API.determine_server_type(url, insecure).must_equal(:automate)
    end

    it 'returns `nil` if a 200 is received from `https://URL/compliance/version` but not redirected to Chef Manage' do
      bad_response.stubs(:code).returns('200')
      bad_response.stubs(:body).returns('No Chef Manage here')

      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + automate_endpoint, headers, insecure)
                      .returns(bad_response)
      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + automate2_endpoint, headers, insecure)
                      .returns(bad_response)

      mock_compliance_response = mock
      mock_compliance_response.stubs(:code).returns('404')
      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + compliance_endpoint, headers, insecure)
                      .returns(mock_compliance_response)

      InspecPlugins::Compliance::API.determine_server_type(url, insecure).must_be_nil
    end

    it 'returns `:compliance` when a 200 is received from `https://URL/api/version`' do
      good_response.stubs(:code).returns('200')
      bad_response.stubs(:code).returns('404')

      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + automate_endpoint, headers, insecure)
                      .returns(bad_response)
      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + automate2_endpoint, headers, insecure)
                      .returns(bad_response)
      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + compliance_endpoint, headers, insecure)
                      .returns(good_response)

      InspecPlugins::Compliance::API.determine_server_type(url, insecure).must_equal(:compliance)
    end

    it 'returns `nil` if it cannot determine the server type' do
      bad_response.stubs(:code).returns('404')

      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + automate2_endpoint, headers, insecure)
                      .returns(bad_response)
      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + automate_endpoint, headers, insecure)
                      .returns(bad_response)
      InspecPlugins::Compliance::HTTP.expects(:get)
                      .with(url + compliance_endpoint, headers, insecure)
                      .returns(bad_response)

      InspecPlugins::Compliance::API.determine_server_type(url, insecure).must_be_nil
    end
  end
end
