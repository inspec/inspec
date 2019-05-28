require 'helper'
require 'bundles/inspec-supermarket/target'
require 'bundles/inspec-supermarket/api'

describe "Inspec::Fetcher" do
  it 'loads the local fetcher for this file' do
    res = Inspec::Fetcher.resolve(__FILE__)
    res.must_be_kind_of Fetchers::Local
  end

  describe "without a source specified" do
    let(:mock_open) {
      m = Minitest::Mock.new
      m.expect :meta, {'content-type' => 'application/gzip'}
      m.expect :read, "fake content"
      m
    }

    before do
      Supermarket::API.expects(:exist?).returns(true)
      Supermarket::API.expects(:find).returns({'tool_source_url' => "http://mock-url" })
    end

    it "defaults to supermarket if only a name is given" do
      res = Inspec::Fetcher.resolve({:name => "mock/test-profile"})
      res.expects(:open).returns(mock_open)
      res.must_be_kind_of Fetchers::Url
      res.resolved_source[:url].must_equal("http://mock-url")
    end

    it "ignores keys that might have come along for the ride" do
      res = Inspec::Fetcher.resolve({:name => "mock/test-profile", cwd: "/tmp/inspec-test", cache: "ancache", backend: "test-backend"})
      res.must_be_kind_of Fetchers::Url
    end
  end

  it 'is able to handle Windows paths' do
    # simulate a local windows path
    file = __FILE__
    file.tr!('/', '\\')
    res = Inspec::Fetcher.resolve(file)
    res.must_be_kind_of Fetchers::Local
    res.target.must_equal __FILE__
  end
end
