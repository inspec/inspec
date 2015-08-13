# encoding: utf-8

module Vulcano::Backend::WinRM

  def self.configure(conf)
    si = Specinfra.configuration
    si.backend = :winrm
    si.os = { family: 'windows'}

    # common options
    host = conf['host'].to_s
    port = conf['port']
    user = conf['user'].to_s
    pass = conf['pass'].tp_s

    # SSL configuration
    if conf['winrm_ssl']
      scheme = 'https'
      port = port || 5986
    else
      scheme = 'http'
      port = port || 5985
    end

    # validation
    if host.empty?
      raise "You must configure a target host."
    end
    unless port > 0
      raise "Port must be > 0 (not #{port})"
    end
    if user.empty?
      raise "You must configure a WinRM user for login."
    end
    if pass.empty?
      raise "You must configure a WinRM password."
    end

    # create the connection
    endpoint = "#{scheme}://#{host}:#{port}/wsman"
    winrm = ::WinRM::WinRMWebService.new(
      endpoint,
      :ssl,
      user: user,
      pass: pass,
      basic_auth_only: true,
      no_ssl_peer_verification: conf['winrm_self_signed'],
    )
    si.winrm = winrm
  end

end

Vulcano::Backend.add_module('winrm', Vulcano::Backend::WinRM)
