#!/usr/bin/env ruby
# encoding: utf-8
# author: Christoph Hartmann

require 'thor'
require 'net/http'
require 'uri'

# TODO:
# - invalidate token
# - fix file upload and genereate tar if required
# - hook into exec with a new target helper

class ComplianceCLI < Thor
  namespace 'compliance'

  desc 'login SERVER', 'Log in to a Chef Compliance SERVER'
  options :username => :required, :password => :required
  def login(server)
    config = Compliance::Configuration.new
    config['server'] = server
    url = "#{server}/oauth/token"

    data = post(url, options['username'], options['password'])
    if !data.nil?
      tokendata = JSON.parse(data)
      if tokendata['access_token']
        config['token'] = tokendata['access_token']
        puts "Successfully authenticated"
      else
        puts 'Reponse does not include a token'
      end
    else
      puts "Authentication failed for Server: #{url}"
    end
    config.store
  end

  desc 'list', 'list all available profiles in Chef Compliance'
  def list
    profiles = get_profiles
    if !profiles.empty?
      # iterate over profiles
      puts "Available profiles: "
      profiles.each { |profile|
        puts " * #{profile[:org]}/#{profile[:name]}"
      }
    else
      puts "Could not reach server #{url}"
    end
  end

  desc 'exec PROFILE', 'executes a profile from Chef Compliance'
  def exec(profile)
    config = Compliance::Configuration.new
    profiles = get_profiles
    if !profiles.empty?
      # 1. verify that the profile exists (list)
      index = profiles.index { |p| "#{p[:org]}/#{p[:name]}" == profile }
      if index >= 0
        p = profiles[index]
        # 2. execute the profile with the proper url, inject `inspec exec` with the suitable params`
        url = "#{config['server']}/owners/#{p[:org]}/compliance/#{p[:name]}/tar"
        puts "b bin/inspec exec #{url} --user #{config['token']}"
      end
    else
      puts "The profile #{profile} is not available"
    end
  end

  desc 'upload PATH', 'uploads a local profile to Chef Compliance'
  def upload(path)

    # 1. run check on the path

    # 2. if it is a directory, tar it to tmp directory

    # 3. check that the profile is not uploaded already,
    # confirm upload to the user (overwrite with --force)

    # 4. upload the tar to Chef Compliance
    config = Compliance::Configuration.new
    tar_path = File.join(Dir.pwd, 'profile.tar.gz')

    owner = 'admin'
    profile = 'profile'
    url = "#{config['server']}/owners/#{owner}/compliance/#{profile}/tar"

    puts "Uploading to #{url}"
    if post_file(url, config['token'], '', tar_path)
      puts "Successfully uploaded profile"
    else
      puts "Error during profile upload"
    end
  end

  desc 'version', 'displays the version of the Chef Compliance server'
  def version
    config = Compliance::Configuration.new
    url = "#{config['server']}/version"

    data = get(url, nil, nil)
    if !data.nil?
      info = JSON.parse(data)
      puts "Chef Compliance version: #{info['version']}"
    else
      puts "Could not reach server #{url}"
    end
  end

  desc 'logout', 'user logout from Chef Compliance'
  def logout
    config = Compliance::Configuration.new
    url = "#{config['server']}/logout"
    data = post(url, config['token'], nil)
    if !data.nil?
      puts "Successfully logged out"
    else
      puts "Could not log out"
    end
    config.destroy
  end

  private

  def get_profiles
    config = Compliance::Configuration.new

    url = "#{config['server']}/user/compliance"
    data = get(url, config['token'], '')

    if !data.nil?
      profiles = JSON.parse(data)
      val = []
      # iterate over profiles
      profiles.each_key { |org|
        profiles[org].each_key { |name|
          val.push({ org: org, name: name})
        }
      }
      val
    else
      []
    end
  end

  def get(url, username, password)
    uri = URI.parse(url)
    req = Net::HTTP::Get.new(uri.path)
    req.basic_auth username, password

    send_request(uri, req)
  end

  def post(url, username, password)
    # form request
    uri = URI.parse(url)
    req = Net::HTTP::Post.new(uri.path)
    req.basic_auth username, password
    req.form_data={}

    send_request(uri, req)
  end

  # upload a file
  def post_file(url, username, password, file_path)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri.path)
    req.basic_auth username, password

    req.body_stream=File.open(file_path)
    req["Content-Type"] = "multipart/form-data"
    req.add_field('Content-Length', File.size(file_path))
    req.add_field('Content-Type', 'application/x-gtar')

    boundary = "INSPEC-PROFILE-UPLOAD"
    req.add_field('session', boundary)
    res=http.request(req)

    # puts "Response #{response.code} #{response.message}"
    # puts "#{response.body}"
    # puts "Headers: #{response.to_hash.inspect}"

    res.is_a?(Net::HTTPSuccess)
  end

  def send_request(uri, req)
    # send request
    res = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') {|http|
      http.request(req)
    }
    if res.is_a?(Net::HTTPSuccess)
      res.body
    else
      nil
    end
  end
end

module Compliance
  class Configuration

    def initialize
      @config_path = File.join(ENV['HOME'], '/.inspec')
      # ensure the directory is available
      unless File.directory?(@config_path)
        FileUtils.mkdir_p(@config_path)
      end
      # set config file pasth
      @config_file = File.join(@config_path, '/config.json')
      @config = {}

      # load the data
      get
    end

    # direct access to config
    def [](key)
      @config[key]
    end

    def []=(key, value)
      @config[key] = value
    end

    # return the json data
    def get
      if File.exists?(@config_file)
        file = File.read(@config_file)
        @config = JSON.parse(file)
      end
      @config
    end

    # stores a hash to json
    def store
      File.open(@config_file,"w") do |f|
        f.write(@config.to_json)
      end
    end

    def destroy
      File.delete(@config_file)
    end
  end
end
