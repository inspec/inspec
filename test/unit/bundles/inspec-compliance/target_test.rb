require 'helper'

describe Compliance::Fetcher do
  let(:config) { { 'server' => 'myserver' } }

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
end
