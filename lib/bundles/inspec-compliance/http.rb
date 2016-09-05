# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'net/http'
require 'uri'

module Compliance
  # implements a simple http abstraction on top of Net::HTTP
  class HTTP
    # generic get requires
    def self.get(url, token, insecure, basic_auth = false)
      uri = URI.parse(url)
      req = Net::HTTP::Get.new(uri.path)

      return send_request(uri, req, insecure) if token.nil?

      if basic_auth
        req.basic_auth(token, '')
      else
        req['Authorization'] = "Bearer #{token}"
      end
      send_request(uri, req, insecure)
    end

    # generic post request
    def self.post(url, token, insecure, basic_auth = false)
      # form request
      uri = URI.parse(url)
      req = Net::HTTP::Post.new(uri.path)
      if basic_auth
        req.basic_auth token, ''
      else
        req['Authorization'] = "Bearer #{token}"
      end
      req.form_data={}

      send_request(uri, req, insecure)
    end

    # post a file
    def self.post_file(url, token, file_path, insecure, basic_auth = false)
      uri = URI.parse(url)
      fail "Unable to parse URL: #{url}" if uri.nil? || uri.host.nil?
      http = Net::HTTP.new(uri.host, uri.port)

      # set connection flags
      http.use_ssl = (uri.scheme == 'https')
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE if insecure

      req = Net::HTTP::Post.new(uri.path)
      if basic_auth
        req.basic_auth token, ''
      else
        req['Authorization'] = "Bearer #{token}"
      end

      req.body_stream=File.open(file_path, 'rb')
      req.add_field('Content-Length', File.size(file_path))
      req.add_field('Content-Type', 'application/x-gtar')

      boundary = 'INSPEC-PROFILE-UPLOAD'
      req.add_field('session', boundary)
      res=http.request(req)
      res
    end

    # sends a http requests
    def self.send_request(uri, req, insecure)
      opts = {
        use_ssl: uri.scheme == 'https',
      }
      opts[:verify_mode] = OpenSSL::SSL::VERIFY_NONE if insecure

      fail "Unable to parse URI: #{uri}" if uri.nil? || uri.host.nil?
      res = Net::HTTP.start(uri.host, uri.port, opts) {|http|
        http.request(req)
      }
      res
    end
  end
end
