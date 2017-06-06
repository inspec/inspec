require 'helper'

describe Compliance::API do
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
end
