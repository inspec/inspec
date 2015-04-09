# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

require 'serverspec'

# Run spec on an ssh target
if ENV['SSH_SPEC']

  require 'pathname'
  require 'net/ssh'

  set :backend, :ssh

  RSpec.configure do |c|
    options = {}
    c.sudo_password = ENV['SUDO_PASSWORD'] || ENV['sudo_password']
    c.host = ENV['TARGET_HOST']
    options[:password] = ENV['LOGIN_PASSWORD'] || ENV['password']
    options[:user] = ENV['LOGIN_USERNAME'] || ENV['user'] || Etc.getlogin

    if !ENV['LOGIN_KEY'].nil?
      options[:keys] = [ENV['LOGIN_KEY']]
      options[:keys_only] = true
    end

    # TODO: optional, will be removed
    if options[:user].nil?
      raise 'specify a user for login via env LOGIN_USERNAME= or by adding user='
    end

    ssh_conf = Net::SSH::Config.for(c.host)
    c.ssh_options = options.merge(ssh_conf)
  end

# Run spec on local machine
else
  require 'serverspec'
  set :backend, :exec
end
