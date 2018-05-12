require 'helper'

describe Compliance::Fetcher do
  let(:config) { { 'server' => 'myserver' } }

  describe 'when the server is an automate2 server' do
    before { Compliance::API.expects(:is_automate2_server?).with(config).returns(true) }

    it 'returns the correct owner and profile name' do
      config['profile'] = ['admin', 'ssh-baseline', nil]
      fetcher = Compliance::Fetcher.new('myserver/profile', config)
      fetcher.send(:compliance_profile_name).must_equal 'admin/ssh-baseline'
    end
  end

  describe 'when the server is an automate server pre-0.8.0' do
    before { Compliance::API.expects(:is_automate_server_pre_080?).with(config).returns(true) }

    it 'returns the correct profile name when the url is correct' do
      fetcher = Compliance::Fetcher.new('myserver/myowner/myprofile/tar', config)
      fetcher.send(:compliance_profile_name).must_equal 'myowner/myprofile'
    end

    it 'raises an exception if the url is malformed' do
      fetcher = Compliance::Fetcher.new('a/bad/url', config)
      proc { fetcher.send(:compliance_profile_name) }.must_raise RuntimeError
    end
  end

  describe 'when the server is an automate server 0.8.0-or-later' do
    before do
      Compliance::API.expects(:is_automate_server_pre_080?).with(config).returns(false)
      Compliance::API.expects(:is_automate_server_080_and_later?).with(config).returns(true)
    end

    it 'returns the correct profile name when the url is correct' do
      fetcher = Compliance::Fetcher.new('myserver/profiles/myowner/myprofile/tar', config)
      fetcher.send(:compliance_profile_name).must_equal 'myowner/myprofile'
    end

    it 'raises an exception if the url is malformed' do
      fetcher = Compliance::Fetcher.new('a/bad/url', config)
      proc { fetcher.send(:compliance_profile_name) }.must_raise RuntimeError
    end
  end

  describe 'when the server is not an automate server (likely a compliance server)' do
    before do
      Compliance::API.expects(:is_automate_server_pre_080?).with(config).returns(false)
      Compliance::API.expects(:is_automate_server_080_and_later?).with(config).returns(false)
    end

    it 'returns the correct profile name when the url is correct' do
      fetcher = Compliance::Fetcher.new('myserver/owners/myowner/compliance/myprofile/tar', config)
      fetcher.send(:compliance_profile_name).must_equal 'myowner/myprofile'
    end

    it 'raises an exception if the url is malformed' do
      fetcher = Compliance::Fetcher.new('a/bad/url', config)
      proc { fetcher.send(:compliance_profile_name) }.must_raise RuntimeError
    end
  end

  describe 'when the server calls a automate profile' do
    before do
      Compliance::Configuration.expects(:new).returns({ 'token' => "123abc" })
    end

    it 'returns the correct profile name when parsing url' do
      Compliance::API.stubs(:exist?).returns(true)
      fetcher = Compliance::Fetcher.resolve('compliance://admin/ssh-baseline')
      assert = ["admin", "ssh-baseline", nil]
      fetcher.instance_variable_get(:"@config")['profile'].must_equal assert
    end

    it 'returns the correct profile name when parsing compliance hash' do
      Compliance::API.stubs(:exist?).returns(true)
      hash = {
        target: "https://a2.instance.com/api/v0/compliance/tar",
        compliance: "admin/ssh-baseline",
        sha256: "132j1kjdasfasdoaefaewo12312",
      }
      fetcher = Compliance::Fetcher.resolve(hash)
      assert = ["admin", "ssh-baseline", nil]
      fetcher.instance_variable_get(:"@config")['profile'].must_equal assert
    end
  end
end
