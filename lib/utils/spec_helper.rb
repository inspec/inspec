# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

require 'serverspec'

# Run spec on an ssh target
if ENV['SSH_SPEC']

  require 'pathname'
  require 'net/ssh'

  set :backend, :ssh
  if ENV['USE_SUDO'] == "false"
    set :disable_sudo, true
  end
  if ENV['SUDO_OPTIONS'].to_s != ""
    set :sudo_options, ENV['SUDO_OPTIONS']
  end

  set :request_pty, true

  RSpec.configure do |c|
    options = {}
    c.sudo_password = ENV['SUDO_PASSWORD'] || ENV['sudo_password']
    c.host = ENV['TARGET_HOST']
    options[:port] = ( ENV['LOGIN_PORT'] || 22 ).to_i
    options[:auth_methods] = ["none"]
    options[:user_known_hosts_file ] = "/dev/null"
    options[:global_known_hosts_file ] = "/dev/null"
    options[:number_of_password_prompts] = 0

    options[:user] = ENV['LOGIN_USERNAME'] || ENV['user'] || Etc.getlogin
    if options[:user].nil?
      raise 'specify a user for login via env LOGIN_USERNAME= or by adding user='
    end

    options[:password] = ENV['LOGIN_PASSWORD'] || ENV['password']
    if !options[:password].nil?
      options[:auth_methods].push("password")
    end

    if !ENV['LOGIN_KEY'].nil?
      options[:keys] = [ENV['LOGIN_KEY']]
      options[:keys_only] = true
      options[:auth_methods].push("publickey")
    end

    # Local alternative: use configuration from .ssh/config
    # for the given host.
    # ssh_conf = Net::SSH::Config.for(c.host)
    # options.merge(ssh_conf)
    c.ssh_options = options
  end

# Run spec on Windows via WinRM
elsif ENV['WINRM_SPEC']

  require 'winrm'

  set :backend, :winrm
  set :os, :family => 'windows'

  user = ENV['LOGIN_USERNAME']
  pass = ENV['LOGIN_PASSWORD']
  host = ENV['TARGET_HOST']
  port = ENV['LOGIN_PORT']

  # check if we should use ssl
  ssl = ENV['WINRM_SSL']
  if (ssl)
    scheme = "https"
    port = port || '5986'
  else
    scheme = "http"
    port = port || '5985'
  end

  # deactivate certificate check if requested, default is on
  accept_self_signed = false
  if (ENV['WINRM_SELF_SIGNED_CERT'])
    accept_self_signed = true
  end

  endpoint = "#{scheme}://#{host}:#{port}/wsman"

  winrm = ::WinRM::WinRMWebService.new(endpoint, :ssl, :user => user, :pass => pass, :basic_auth_only => true, :no_ssl_peer_verification => accept_self_signed)
  Specinfra.configuration.winrm = winrm

# Run spec on local machine
else
  require 'serverspec'
  set :backend, :exec
end
