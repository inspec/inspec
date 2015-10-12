# encoding: utf-8
require 'helper'
require 'train/transports/ssh'

describe 'mock transport' do
  let(:cls) { Train::Transports::SSH }

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

  describe 'failed configuration' do
    let(:conf) {{
      host: rand.to_s,
      password: rand.to_s,
      keys: rand.to_s,
    }}

    it 'works with a minimum valid config' do
      cls.new(conf).connection
    end

    it 'doesnt like host == nil' do
      conf.delete(:host)
      proc { cls.new(conf).connection }.must_raise Train::ClientError
    end

    it 'doesnt like user == nil' do
      conf[:user] = nil
      proc { cls.new(conf).connection }.must_raise Train::ClientError
    end

    it 'doesnt like key and password == nil' do
      conf.delete(:password)
      conf.delete(:keys)
      proc { cls.new(conf).connection }.must_raise Train::ClientError
    end
  end
end
