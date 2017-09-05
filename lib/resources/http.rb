# encoding: utf-8
# copyright: 2017, Criteo
# copyright: 2017, Chef Software Inc
# author: Guilhem Lettron, Christoph Hartmann
# license: Apache v2

require 'faraday'
require 'hashie'

module Inspec::Resources
  class Http < Inspec.resource(1)
    name 'http'
    desc 'Use the http InSpec audit resource to test http call.'
    example "
      describe http('http://localhost:8080/ping', auth: {user: 'user', pass: 'test'}, params: {format: 'html'}) do
        its('status') { should cmp 200 }
        its('body') { should cmp 'pong' }
        its('headers.Content-Type') { should cmp 'text/html' }
      end

      describe http('http://example.com/ping').headers do
        its('Content-Length') { should cmp 258 }
        its('Content-Type') { should cmp 'text/html; charset=UTF-8' }
      end
    "

    def initialize(url, opts = {})
      @url = url
      @method = opts.fetch(:method, 'GET')
      @params = opts.fetch(:params, nil)
      @auth = opts.fetch(:auth, {})
      @headers = opts.fetch(:headers, {})
      @data = opts.fetch(:data, nil)
      @open_timeout = opts.fetch(:open_timeout, 60)
      @read_timeout = opts.fetch(:read_timeout, 60)
      @ssl_verify = opts.fetch(:ssl_verify, true)
    end

    def status
      response.status
    end

    def body
      response.body
    end

    def headers
      Hashie::Mash.new(response.headers.to_h)
    end

    def to_s
      "http #{@method} on #{@url}"
    end

    private

    def response
      return @response if @response
      conn = Faraday.new url: @url, headers: @headers, params: @params, ssl: { verify: @ssl_verify }

      # set basic authentication
      conn.basic_auth @auth[:user], @auth[:pass] unless @auth.empty?

      # set default timeout
      conn.options.timeout      = @read_timeout  # open/read timeout in seconds
      conn.options.open_timeout = @open_timeout  # connection open timeout in seconds

      @response = conn.send(@method.downcase) do |req|
        req.body = @data
      end
    end
  end
end
