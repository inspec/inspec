# encoding: utf-8
# author: Guilhem Lettron

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Http' do
  describe 'InSpec::Resources::Http::Worker::Local' do
    let(:domain)      { 'www.example.com' }
    let(:http_method) { 'GET' }
    let(:opts)        { {} }
    let(:worker)      { Inspec::Resources::Http::Worker::Local.new(http_method, "http://#{domain}", opts) }

    describe 'simple HTTP request with no options' do
      it 'returns correct data' do
        stub_request(:get, domain).to_return(status: 200, body: 'pong')

        _(worker.status).must_equal 200
        _(worker.body).must_equal 'pong'
      end
    end

    describe 'request with basic auth' do
      let(:opts) { { auth: { user: 'user', pass: 'pass' } } }

      it 'returns correct data' do
        stub_request(:get, domain).with(basic_auth: ['user', 'pass']).to_return(status: 200, body: 'auth ok')

        _(worker.status).must_equal 200
        _(worker.body).must_equal 'auth ok'
      end
    end

    describe 'POST request with data' do
      let(:http_method) { 'POST'}
      let(:opts)        { { data: {a: '1', b: 'five'} } }

      it 'returns correct data' do
        stub_request(:post, domain).with(body: {a: '1', b: 'five'}).to_return(status: 200, body: 'post ok')

        _(worker.status).must_equal 200
        _(worker.body).must_equal 'post ok'
      end
    end

    describe 'with request headers' do
      let(:opts) { { headers: { 'accept' => 'application/json' } } }

      it 'returns correct data' do
        stub_request(:get, domain).with(headers: {'accept' => 'application/json'}).to_return(status: 200, body: 'headers ok', headers: {'mock' => 'ok'})

        _(worker.status).must_equal 200
        _(worker.body).must_equal 'headers ok'
        _(worker.response_headers['mock']).must_equal 'ok'
      end
    end

    describe 'with params' do
      let(:opts) { { params: { a: 'b' } } }

      it 'returns correct data' do
        stub_request(:get, domain).with(query: {a: 'b'}).to_return(status: 200, body: 'params ok')

        _(worker.status).must_equal 200
        _(worker.body).must_equal 'params ok'
      end
    end
  end

  describe 'Inspec::Resource::Http::Worker::Remote' do
    let(:backend)     { MockLoader.new.backend }
    let(:http_method) { 'GET' }
    let(:url)         { 'http://www.example.com' }
    let(:opts)        { {} }
    let(:worker)      { Inspec::Resources::Http::Worker::Remote.new(backend, http_method, url, opts)}

    describe 'simple HTTP request with no options' do
      it 'returns correct data' do
        _(worker.status).must_equal 200
        _(worker.body).must_equal 'no options'
      end
    end

    describe 'request with basic auth' do
      let(:opts) { { auth: { user: 'user', pass: 'pass' } } }

      it 'returns correct data' do
        _(worker.status).must_equal 200
        _(worker.body).must_equal 'auth ok'
      end
    end

    describe 'POST request with data' do
      let(:http_method) { 'POST'}
      let(:opts)        { { data: {a: '1', b: 'five'} } }

      it 'returns correct data' do
        _(worker.status).must_equal 200
        _(worker.body).must_equal 'post ok'
      end
    end

    describe 'with request headers' do
      let(:opts) { { headers: { 'accept' => 'application/json', 'foo' => 'bar' } } }

      it 'returns correct data' do
        _(worker.status).must_equal 200
        _(worker.body).must_equal 'headers ok'
        _(worker.response_headers['mock']).must_equal 'ok'
      end
    end
  end
end
