# encoding: utf-8
# author: Guilhem Lettron

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Http' do
  it 'verify simple http' do
    stub_request(:get, "www.example.com").to_return(status: 200, body: 'pong')

    resource = load_resource('http', 'http://www.example.com')
    _(resource.status).must_equal 200
    _(resource.body).must_equal 'pong'
  end

  it 'verify http with basic auth' do
    stub_request(:get, "www.example.com").with(basic_auth: ['user', 'pass']).to_return(status: 200, body: 'auth ok')

    resource = load_resource('http', 'http://www.example.com', auth: { user: 'user',pass: 'pass'})
    _(resource.status).must_equal 200
    _(resource.body).must_equal 'auth ok'
  end

  it 'verify http post with data' do
    stub_request(:post, "www.example.com").with(body: {data: {a: '1', b: 'five'}}).to_return(status: 200, body: 'post ok')

    resource = load_resource('http', 'http://www.example.com',
                             method: 'POST',
                             data: '{"data":{"a":"1","b":"five"}}',
                             headers: {'content-type' => 'application/json'})
    _(resource.status).must_equal 200
    _(resource.body).must_equal 'post ok'
  end

  it 'verify http headers' do
    stub_request(:post, "www.example.com").with(headers: {'content-type' => 'application/json'}).to_return(status: 200, body: 'headers ok', headers: {'mock' => 'ok'})

    resource = load_resource('http', 'http://www.example.com',
                             method: 'POST',
                             data: '{"data":{"a":"1","b":"five"}}',
                             headers: {'content-type' => 'application/json'})
    _(resource.status).must_equal 200
    _(resource.body).must_equal 'headers ok'
    _(resource.headers.mock).must_equal 'ok'
  end

  it 'verify http with params' do
    stub_request(:get, "www.example.com").with(query: {a: 'b'}).to_return(status: 200, body: 'params ok')

    resource = load_resource('http', 'http://www.example.com', params: {a: 'b'})
    _(resource.status).must_equal 200
    _(resource.body).must_equal 'params ok'
  end

  it 'verify http with timeouts' do
    stub_request(:get, "www.example.com").to_return(status: 200, body: 'params ok')

    resource = load_resource('http', 'http://www.example.com', open_timeout: 10, read_timeout: 10)
    _(resource.instance_variable_get(:@open_timeout)).must_equal 10
    _(resource.instance_variable_get(:@read_timeout)).must_equal 10
  end
end
