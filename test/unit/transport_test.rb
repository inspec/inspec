# encoding: utf-8

require 'helper'

describe Inspec::Transport do
  describe '#inspec transport' do
    let(:transport) { Inspec::Transport.new({ backend: 'mock' }) }

    describe 'mock transport initialized' do
      it 'return mock transport on initialize' do
        transport.must_be_kind_of Inspec::Transport
        transport.conn.must_be_kind_of Train::Transports::Mock::Connection
      end
    end

    describe 'create train connection' do
      it 'return new train transport' do
        trans = transport
        trans.conn = nil
        trans.conn.must_be_nil

        trans.init_train({ backend: 'mock' })
        trans.conn.must_be_kind_of Train::Transports::Mock::Connection
      end

      it 'error with unknown ransport' do
        trans = transport
        trans.conn = nil
        trans.conn.must_be_nil

        err = proc do
          trans.init_train({ backend: 'unknown' })
        end
        err.must_raise(Train::UserError)
      end
    end

    describe 'clear transport cache' do
      it 'clear cache' do
        trans = transport
        trans.instance_variable_set(:@cmd_cache, { cmd: 123 })
        trans.instance_variable_set(:@file_cache, { path: 123 })

        trans.instance_variable_get(:@cmd_cache).must_equal ({ cmd: 123 })
        trans.instance_variable_get(:@file_cache).must_equal ({ path: 123 })

        trans.clear_cache
        trans.instance_variable_get(:@cmd_cache).must_equal ({})
        trans.instance_variable_get(:@file_cache).must_equal ({})
      end
    end

    describe 'check missing method fallback' do
      it 'check mock_os method' do
        trans = transport
        os = trans.mock_os({ name: 'mock'})
        os.must_be_kind_of Train::Transports::Mock::Connection::OS
      end
    end

    describe 'load file' do
      it 'load file without caching' do
        trans = transport
        trans.conn.expects(:file).twice.returns('test_file')
        trans.file('/tmp/test').must_equal('test_file')
        trans.file('/tmp/test').must_equal('test_file')
      end

      it 'load file with caching' do
        trans = transport
        trans.instance_variable_set(:@cache_resources, true)
        trans.conn.expects(:file).once.returns('test_file')
        trans.file('/tmp/test').must_equal('test_file')
        trans.file('/tmp/test').must_equal('test_file')
        assert = { '/tmp/test' => 'test_file' }
        trans.instance_variable_get(:@file_cache).must_equal(assert)
      end
    end

    describe 'run command' do
      it 'run command without caching' do
        trans = transport
        trans.conn.expects(:run_command).twice.returns('test_user')
        trans.run_command('whoami').must_equal('test_user')
        trans.run_command('whoami').must_equal('test_user')
      end

      it 'run command with caching' do
        trans = transport
        trans.instance_variable_set(:@cache_resources, true)
        trans.conn.expects(:run_command).once.returns('test_user')
        trans.run_command('whoami').must_equal('test_user')
        trans.run_command('whoami').must_equal('test_user')
        assert = { 'whoami' => 'test_user' }
        trans.instance_variable_get(:@cmd_cache).must_equal(assert)
      end
    end
  end
end
