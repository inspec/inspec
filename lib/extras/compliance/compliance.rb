# encoding: utf-8
# author: Christoph Hartmann

require 'thor'
require 'net/http'
require 'uri'

# TODO:
# - fix file upload and genereate tar if required
# - detect expired token
# - target shourd return false if token is expired
class ComplianceCLI < BaseCLI
  namespace 'compliance'

  desc 'login SERVER', 'Log in to a Chef Compliance SERVER'
  option :user, type: :string, required: true,
    desc: 'Chef Compliance Username'
  option :password, type: :string, required: true,
    desc: 'Chef Compliance Password'
  def login(server)
    success, msg = Compliance::API.login(server, options['user'], options['password'])
    if success
      puts "Successfully authenticated"
    else
      puts msg
    end
  end

  desc 'profiles', 'list all available profiles in Chef Compliance'
  def profiles
    profiles = Compliance::API.get_profiles
    if !profiles.empty?
      # iterate over profiles
      puts "Available profiles: "
      profiles.each { |profile|
        puts " * #{profile[:org]}/#{profile[:name]}"
      }
    else
      puts "Could not find any profiles"
    end
  end

  desc 'exec PROFILE', 'executes a Chef Compliance profile'
  option :id, type: :string,
    desc: 'Attach a profile ID to all test results'
  target_options
  option :format, type: :string
  def exec(*tests)
    # iterate over tests and add compliance scheme
    tests = tests.map { |t| 'compliance://' + t }

    # execute profile from inspec exec implementation
    diagnose
    run_tests(opts, tests)
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

    # read from login
    owner = 'admin'
    profile = 'profile'
    url = "#{config['server']}/owners/#{owner}/compliance/#{profile}/tar"

    puts "Uploading to #{url}"
    if Compliance::API.post_file(url, config['token'], '', tar_path)
      puts "Successfully uploaded profile"
    else
      puts "Error during profile upload"
    end
  end

  desc 'version', 'displays the version of the Chef Compliance server'
  def version
    info = Compliance::API.version
    if !info.nil? && info['version']
      puts "Chef Compliance version: #{info['version']}"
    else
      puts "Could not determine server version."
    end
  end

  desc 'logout', 'user logout from Chef Compliance'
  def logout
    if Compliance::API.logout
      puts "Successfully logged out"
    else
      puts "Could not log out"
    end
  end
end

# register the subcommand to InspecCLI
InspecCLI.register(ComplianceCLI, "compliance", "compliance SUBCOMMAND ...", "Chef Compliance commands", {})

module Compliance
  # API Implementation does not hold any state by itself,
  # everything will be stored in local Configuration store
  class API

    # logs into the server, retrieves a token and stores it
    # locally
    def self.login(server, username, password)
      config = Compliance::Configuration.new
      config['server'] = server
      url = "#{server}/oauth/token"

      success = false
      data = Compliance::API.post(url, username, password)
      if !data.nil?
        tokendata = JSON.parse(data)
        if tokendata['access_token']
          config['token'] = tokendata['access_token']
          config.store
          success = true
          msg =  'Successfully authenticated'
        else
          msg = 'Reponse does not include a token'
        end
      else
        msg = "Authentication failed for Server: #{url}"
      end
      [success, msg]
    end

    def self.logout
      config = Compliance::Configuration.new
      url = "#{config['server']}/logout"
      data = Compliance::API.post(url, config['token'], nil)
      config.destroy
    end

    # return the server api version
    def self.version
      config = Compliance::Configuration.new
      url = "#{config['server']}/version"

      data = Compliance::API.get(url, nil, nil)
      if !data.nil?
        info = JSON.parse(data)
      else
        {}
      end
    end

    # return all compliance profiles available for the user
    def self.get_profiles
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

    private

    def self.get(url, username, password)
      uri = URI.parse(url)
      req = Net::HTTP::Get.new(uri.path)
      req.basic_auth username, password

      send_request(uri, req)
    end

    def self.post(url, username, password)
      # form request
      uri = URI.parse(url)
      req = Net::HTTP::Post.new(uri.path)
      req.basic_auth username, password
      req.form_data={}

      send_request(uri, req)
    end

    # upload a file
    def self.post_file(url, username, password, file_path)
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

      res.is_a?(Net::HTTPSuccess)
    end

    def self.send_request(uri, req)
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

  # stores configuration on local filesystem
  class Configuration
    def initialize
      @config_path = File.join(ENV['HOME'], '/.inspec')
      # ensure the directory is available
      unless File.directory?(@config_path)
        FileUtils.mkdir_p(@config_path)
      end
      # set config file path
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

    # deletes data
    def destroy
      File.delete(@config_file)
    end
  end
end

# InSpec Target Helper for Chef Compliance
# reuses UrlHelper, but it knows the target server and the access token already
# similar to `inspec exec http://localhost:2134/owners/%base%/compliance/%ssh%/tar --user %token%`
module Inspec::Targets
  class ChefComplianceHelper < UrlHelper
    def handles?(target)
      # check for local scheme compliance://
      uri = URI(target)
      return unless URI(uri).scheme == 'compliance'

      # check if we have a compliance token
      config = Compliance::Configuration.new
      return if config['token'].nil?

      # get profile name
      profile = get_profile_name(uri)

      # verifies that the target e.g base/ssh exists
      profiles = Compliance::API.get_profiles
      if !profiles.empty?
        index = profiles.index { |p| "#{p[:org]}/#{p[:name]}" == profile }
        !index.nil? && index >= 0
      else
        false
      end
    rescue URI::Error => e
      false
    end

    # generates proper url
    def resolve(target, opts = {})
      profile = get_profile_name(URI(target))
      # generates server url
      target = build_target_url(profile)
      config = Compliance::Configuration.new
      opts['user'] = config['token']
      puts target
      super(target, opts)
    end

    # extracts profile name from url
    def get_profile_name(uri)
      profile = uri.host + uri.path
    end

    def build_target_url(target)
      owner, profile = target.split('/')
      config = Compliance::Configuration.new
      url = "#{config['server']}/owners/%owner_name%/compliance/%profile_name%/tar"
      .gsub('%owner_name%', owner)
      .gsub('%profile_name%', profile)
      url
    end

    def to_s
      'Chef Compliance Profile Loader'
    end
  end

  Inspec::Targets.add_module('chefcompliance', ChefComplianceHelper.new)
end
