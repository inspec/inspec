# encoding: utf-8
require 'helper'
require 'train/plugins/common'
require 'train/plugins/stat'

describe 'stat' do
  let(:cls) { Train::Plugins::Common::FileCommon::Stat }

  describe 'find_type' do
    let (:random_mode) { (rand * 1000).to_i }

    it 'detects :unknown types' do
      cls.find_type(random_mode).must_equal :unknown
    end

    it 'detects sockets' do
      cls.find_type(00140755).must_equal :socket
    end

    it 'detects sockets' do
      cls.find_type(00120755).must_equal :symlink
    end

    it 'detects sockets' do
      cls.find_type(00100755).must_equal :file
    end

    it 'detects sockets' do
      cls.find_type(00060755).must_equal :block_device
    end

    it 'detects sockets' do
      cls.find_type(00040755).must_equal :directory
    end

    it 'detects sockets' do
      cls.find_type(00020755).must_equal :character_device
    end

    it 'detects sockets' do
      cls.find_type(00010755).must_equal :pipe
    end
  end

  describe 'linux stat' do
    let(:backend) { Minitest::Mock.new }

    it 'ignores wrong stat results' do
      res = Minitest::Mock.new
      res.expect :stdout, ''
      backend.expect :run_command, res, [String]
      cls.linux_stat('/path', backend).must_equal({})
    end

    it 'reads correct stat results' do
      res = Minitest::Mock.new
      res.expect :stdout, "360\n43ff\nroot\n0\nroot\n0\n1444520846\n1444522445\n?"
      backend.expect :run_command, res, [String]
      cls.linux_stat('/path', backend).must_equal({
        type: :directory,
        mode: 00777,
        owner: 'root',
        group: 'root',
        mtime: 1444522445,
        size: 360,
        selinux_label: nil,
      })
    end
  end

  describe 'bsd stat' do
    let(:backend) { Minitest::Mock.new }

    it 'ignores failed stat results' do
      res = Minitest::Mock.new
      res.expect :stdout, '.....'
      res.expect :exit_status, 1
      backend.expect :run_command, res, [String]
      cls.bsd_stat('/path', backend).must_equal({})
    end

    it 'ignores wrong stat results' do
      res = Minitest::Mock.new
      res.expect :stdout, ''
      res.expect :exit_status, 0
      backend.expect :run_command, res, [String]
      cls.bsd_stat('/path', backend).must_equal({})
    end

    it 'reads correct stat results' do
      res = Minitest::Mock.new
      res.expect :stdout, "360\n41777\nroot\n0\nroot\n0\n1444520846\n1444522445"
      res.expect :exit_status, 0
      backend.expect :run_command, res, [String]
      cls.bsd_stat('/path', backend).must_equal({
        type: :directory,
        mode: 00777,
        owner: 'root',
        group: 'root',
        mtime: 1444522445,
        size: 360,
        selinux_label: nil,
      })
    end
  end
end
