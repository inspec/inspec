# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'net/http'
require 'uri'

module Compliance
  # implements a simple http abstraction on top of Net::HTTP
  class HTTP
    # generic get requires
    def self.get(url, headers = nil, insecure)
      uri = _parse_url(url)
      req = Net::HTTP::Get.new(uri.path)
      headers&.each do |key, value|
        req.add_field(key, value)
      end
      send_request(uri, req, insecure)
    end

    # generic post request
    def self.post(url, token, insecure, basic_auth = false)
      # form request
      uri = _parse_url(url)
      req = Net::HTTP::Post.new(uri.path)
      if basic_auth
        req.basic_auth token, ''
      else
        req['Authorization'] = "Bearer #{token}"
      end
      req.form_data={}

      send_request(uri, req, insecure)
    end

    def self.post_with_headers(url, headers, body, insecure)
      uri = _parse_url(url)
      req = Net::HTTP::Post.new(uri.path)
      req.body = body unless body.nil?
      headers&.each do |key, value|
        req.add_field(key, value)
      end
      send_request(uri, req, insecure)
    end

    # post a file
    def self.post_file(url, headers, file_path, insecure)
      uri = _parse_url(url)
      raise "Unable to parse URL: #{url}" if uri.nil? || uri.host.nil?
      http = Net::HTTP.new(uri.host, uri.port)

      # set connection flags
      http.use_ssl = (uri.scheme == 'https')
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE if insecure

      req = Net::HTTP::Post.new(uri.path)
      headers.each do |key, value|
        req.add_field(key, value)
      end

      req.body_stream=File.open(file_path, 'rb')
      req.add_field('Content-Length', File.size(file_path))
      req.add_field('Content-Type', 'application/x-gtar')

      boundary = 'INSPEC-PROFILE-UPLOAD'
      req.add_field('session', boundary)
      res=http.request(req)
      res
    end

    def self.post_multipart_file(url, headers, file_path, insecure)
      uri = _parse_url(url)
      raise "Unable to parse URL: #{url}" if uri.nil? || uri.host.nil?
      http = Net::HTTP.new(uri.host, uri.port)

      # set connection flags
      http.use_ssl = (uri.scheme == 'https')
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE if insecure

      req = Net::HTTP::Post.new(uri)
      headers.each do |key, value|
        req.add_field(key, value)
      end

      boundry = 'AaB03x'
      req.add_field('Content-Type', "multipart/form-data; boundary=#{boundry}")

      post_body = []
      post_body << "--#{boundry}\r\n"
      post_body << "Content-Disposition: form-data; name=\"file\"; filename=\"#{File.basename(file_path)}\"\r\n"
      post_body << "Content-Type: application/x-gtar\r\n\r\n"
      post_body << File.read(file_path)
      post_body << "\r\n\r\n--#{boundry}--\r\n"
      req.body = post_body.join

      res=http.request(req)
      res
    end

    # sends a http requests
    def self.send_request(uri, req, insecure)
      opts = {
        use_ssl: uri.scheme == 'https',
      }
      opts[:verify_mode] = OpenSSL::SSL::VERIFY_NONE if insecure

      raise "Unable to parse URI: #{uri}" if uri.nil? || uri.host.nil?
      res = Net::HTTP.start(uri.host, uri.port, opts) { |http|
        http.request(req)
      }
      res
    rescue OpenSSL::SSL::SSLError => e
      raise e unless e.message.include? 'certificate verify failed'

      puts "Error: Failed to connect to #{uri}."
      puts 'If the server uses a self-signed certificate, please re-run the login command with the --insecure option.'
      exit 1
    end

    def self._parse_url(url)
      url = "https://#{url}" if URI.parse(url).scheme.nil?
      URI.parse(url)
    end
  end
end
