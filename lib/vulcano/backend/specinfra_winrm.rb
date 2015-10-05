# encoding: utf-8

require 'winrm'

class Vulcano::Backends::SpecinfraHelper
  module Winrm
    def self.winrm_url(conf)
      host = conf['host'].to_s
      port = conf['port']
      fail 'You must configure a target host.' if host.empty?

      # SSL configuration
      if conf['ssl']
        scheme = 'https'
        port ||= 5986
      else
        scheme = 'http'
        port ||= 5985
      end

      path = conf['path'] || '/wsman'
      path.prepend('/') unless path.start_with?('/')

      "#{scheme}://#{host}:#{port}#{path}"
    end

    def self.configure(conf)
      si = Specinfra.configuration
      si.backend = :winrm
      si.os = { family: 'windows' }

      # validation
      user = conf['user'].to_s
      pass = conf['password'].to_s

      if user.empty?
        warn "We use default 'Administrator' as WinRM user for login."
        user = 'Administrator'
      end
      fail 'You must configure a WinRM password.' if pass.empty?

      # create the connection
      endpoint = winrm_url(conf)
      winrm = ::WinRM::WinRMWebService.new(
        endpoint,
        :ssl,
        user: user,
        pass: pass,
        basic_auth_only: true,
        no_ssl_peer_verification: conf['self_signed'],
      )
      si.winrm = winrm
    end
  end
end
