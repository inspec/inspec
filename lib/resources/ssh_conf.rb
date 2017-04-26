# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

require 'utils/simpleconfig'

module Inspec::Resources
  class SshConf < Inspec.resource(1)
    name 'ssh_config'
    desc 'Use the `ssh_config` InSpec audit resource to test OpenSSH client configuration data located at `/etc/ssh/ssh_config` on Linux and Unix platforms.'
    example "
      describe ssh_config do
        its('cipher') { should contain '3des' }
        its('port') { should eq '22' }
        its('hostname') { should include('example.com') }
      end
    "

    def initialize(conf_path = nil, type = nil)
      @conf_path = conf_path || '/etc/ssh/ssh_config'
      typename = (@conf_path.include?('sshd') ? 'Server' : 'Client')
      @type = type || "SSH #{typename} configuration #{conf_path}"
    end

    def content
      read_content
    end

    def params(*opts)
      opts.inject(read_params) do |res, nxt|
        res.respond_to?(:key) ? res[nxt] : nil
      end
    end

    def convert_hash(hash)
      new_hash = {}
      hash.each do |k, v|
        new_hash[k.downcase] = v
      end
      new_hash
    end

    def method_missing(name)
      param = read_params[name.to_s.downcase]
      return nil if param.nil?
      # extract first value if we have only one value in array
      return param[0] if param.length == 1
      param
    end

    def to_s
      'SSH Configuration'
    end

    private

    def read_content
      return @content if defined?(@content)
      file = inspec.file(@conf_path)
      if !file.file?
        return skip_resource "Can't find file \"#{@conf_path}\""
      end

      @content = file.content
      if @content.empty? && !file.empty?
        return skip_resource "Can't read file \"#{@conf_path}\""
      end

      @content
    end

    def read_params
      return @params if defined?(@params)
      return @params = {} if read_content.nil?
      conf = SimpleConfig.new(
        read_content,
        assignment_regex: /^\s*(\S+?)\s+(.*?)\s*$/,
        multiple_values: true,
      )
      @params = convert_hash(conf.params)
    end
  end

  class SshdConf < SshConf
    name 'sshd_config'
    desc 'Use the sshd_config InSpec audit resource to test configuration data for the Open SSH daemon located at /etc/ssh/sshd_config on Linux and UNIX platforms. sshd---the Open SSH daemon---listens on dedicated ports, starts a daemon for each incoming connection, and then handles encryption, authentication, key exchanges, command execution, and data exchanges.'
    example "
      describe sshd_config do
        its('Protocol') { should eq '2' }
      end
    "

    def initialize(path = nil)
      super(path || '/etc/ssh/sshd_config')
    end

    def to_s
      'SSHD Configuration'
    end
  end
end
