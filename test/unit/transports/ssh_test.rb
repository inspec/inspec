# encoding: utf-8
require 'helper'
require 'train/transports/ssh'

describe 'ssh transport' do
  let(:cls) { Train::Transports::SSH }
  let(:conf) {{
    host: rand.to_s,
    password: rand.to_s,
    key_files: rand.to_s,
  }}

  describe 'default options' do
    let(:ssh) { cls.new({ host: 'dummy' }) }

    it 'can be instantiated (with valid config)' do
      ssh.wont_be_nil
    end

    it 'configures the host' do
      ssh.options[:host].must_equal 'dummy'
    end

    it 'has default port' do
      ssh.options[:port].must_equal 22
    end

    it 'has default user' do
      ssh.options[:user].must_equal 'root'
    end
  end

  describe 'opening a connection' do
    let(:ssh) { cls.new(conf) }
    let(:connection) { ssh.connection }

    it 'gets the connection' do
      connection.must_be_kind_of Train::Transports::SSH::Connection
    end

    it 'must respond to wait_until_ready' do
      connection.must_respond_to :wait_until_ready
    end

    it 'can be closed' do
      connection.close.must_be_nil
    end

    it 'has a login command == ssh' do
      connection.login_command.command.must_equal 'ssh'
    end

    it 'has login command arguments' do
      connection.login_command.arguments.must_equal([
        "-o", "UserKnownHostsFile=/dev/null",
        "-o", "StrictHostKeyChecking=no",
        "-o", "IdentitiesOnly=yes",
        "-o", "LogLevel=VERBOSE",
        "-o", "ForwardAgent=no",
        "-i", conf[:key_files],
        "-p", "22",
        "root@#{conf[:host]}",
      ])
    end
  end

  describe 'failed configuration' do
    it 'works with a minimum valid config' do
      cls.new(conf).connection
    end

    it 'doesnt like host == nil' do
      conf.delete(:host)
      proc { cls.new(conf).connection }.must_raise Train::ClientError
    end

    it 'reverts to root on user == nil' do
      conf[:user] = nil
      cls.new(conf).connection.method(:options).call[:user] == 'root'
    end

    it 'doesnt like key and password == nil' do
      conf.delete(:password)
      conf.delete(:key_files)
      proc { cls.new(conf).connection }.must_raise Train::ClientError
    end

    it 'wont connect if its not possible' do
      conf[:host] = 'localhost'
      conf[:port] = 1
      conn = cls.new(conf).connection
      proc { conn.run_command('uname') }.must_raise Train::Transports::SSHFailed
    end
  end
end
