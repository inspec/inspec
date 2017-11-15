# encoding: utf-8

require 'helper'

describe Inspec::Transport do
  describe '#inspec transport' do
    let(:transport) { Inspec::Transport.new({ backend: 'mock' }) }

    describe 'mock transport initialized' do
      it 'return mock transport on initialize' do
        transport.must_be_kind_of Inspec::Transport
        transport.connection.must_be_kind_of Train::Transports::Mock::Connection
      end
    end

    describe 'create train connection' do
      it 'return new train transport' do
        transport.connection = nil
        transport.connection.must_be_nil

        transport.init_train({ backend: 'mock' })
        transport.connection.must_be_kind_of Train::Transports::Mock::Connection
      end

      it 'error with unknown transport' do
        transport.connection = nil
        transport.connection.must_be_nil

        err = proc do
          transport.init_train({ backend: 'unknown' })
        end
        err.must_raise(Train::UserError)
      end
    end

    describe 'clear transport cache' do
      it 'clear cache' do
        transport.instance_variable_set(:@cmd_cache, { cmd: 123 })
        transport.instance_variable_set(:@file_cache, { path: 123 })

        transport.instance_variable_get(:@cmd_cache).must_equal ({ cmd: 123 })
        transport.instance_variable_get(:@file_cache).must_equal ({ path: 123 })

        transport.clear_cache
        transport.instance_variable_get(:@cmd_cache).must_equal ({})
        transport.instance_variable_get(:@file_cache).must_equal ({})
      end
    end

    describe 'check missing method fallback' do
      it 'check mock_os method' do
        os = transport.mock_os({ name: 'mock' })
        os[:name].must_equal 'mock'
        os.must_be_kind_of Train::Transports::Mock::Connection::OS
      end
    end

    describe 'load file' do
      it 'load file without caching' do
        transport.connection.expects(:file).twice.returns('test_file')
        transport.file('/tmp/test').must_equal('test_file')
        transport.file('/tmp/test').must_equal('test_file')
      end

      it 'load file with caching' do
        transport.cache_resources = true
        transport.connection.expects(:file).once.returns('test_file')
        transport.file('/tmp/test').must_equal('test_file')
        transport.file('/tmp/test').must_equal('test_file')
        assert = { '/tmp/test' => 'test_file' }
        transport.instance_variable_get(:@file_cache).must_equal(assert)
      end
    end

    describe 'run command' do
      it 'run command without caching' do
        transport.connection.expects(:run_command).twice.returns('test_user')
        transport.run_command('whoami').must_equal('test_user')
        transport.run_command('whoami').must_equal('test_user')
      end

      it 'run command with caching' do
        transport.cache_resources = true
        transport.connection.expects(:run_command).once.returns('test_user')
        transport.run_command('whoami').must_equal('test_user')
        transport.run_command('whoami').must_equal('test_user')
        assert = { 'whoami' => 'test_user' }
        transport.instance_variable_get(:@cmd_cache).must_equal(assert)
      end
    end
  end
end
