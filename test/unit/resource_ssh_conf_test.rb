# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::SshConf' do

  describe 'ssh_config' do

    let(:resource) { loadResource('ssh_config') }

    it 'check ssh config parsing' do
      _(resource.Host).must_equal '*'
      _(resource.Tunnel).must_equal nil
      _(resource.SendEnv).must_equal 'LANG LC_*'
      _(resource.HashKnownHosts).must_equal 'yes'
      _(resource.GSSAPIAuthentication).must_equal 'yes'
      _(resource.GSSAPIDelegateCredentials).must_equal 'no'
    end

  end

  describe 'sshd_config' do

    let(:resource) { loadResource('sshd_config') }

    it 'check protocol version' do
      _(resource.Protocol).must_equal '2'
      _(resource.Port).must_equal '22'
      _(resource.ListenAddress).must_equal nil
      _(resource.HostKey).must_equal [
        '/etc/ssh/ssh_host_rsa_key',
        '/etc/ssh/ssh_host_dsa_key',
        '/etc/ssh/ssh_host_ecdsa_key'
      ]
      _(resource.KerberosAuthentication).must_equal nil
      _(resource.X11DisplayOffset).must_equal '10'
      _(resource.UsePAM).must_equal 'yes'
    end
  end
end
