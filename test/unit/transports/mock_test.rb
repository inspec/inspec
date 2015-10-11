# encoding: utf-8
require 'helper'
require 'train/transports/mock'

describe 'mock transport' do
  let(:transport) { Train::Transports::Mock.new }

  it 'can be instantiated' do
    transport.wont_be_nil
  end

  describe 'when running a mocked command' do
    let(:mock_cmd) { Train::Transports::Mock::Command }

    it 'gets results for stdout' do
      out = rand
      cmd = rand
      transport.commands[cmd] = mock_cmd.new(out, nil, nil)
      transport.run_command(cmd).stdout.must_equal(out)
    end

    it 'gets results for stderr' do
      err = rand
      cmd = rand
      transport.commands[cmd] = mock_cmd.new(nil, err, nil)
      transport.run_command(cmd).stderr.must_equal(err)
    end

    it 'gets results for exit_status' do
      code = rand
      cmd = rand
      transport.commands[cmd] = mock_cmd.new(nil, nil, code)
      transport.run_command(cmd).exit_status.must_equal(code)
    end
  end

  describe 'when accessing a mocked os' do
    it 'sets the OS to the mocked value' do
      transport.mock_os({ family: 'centos'})
      transport.os.linux?.must_equal true
      transport.os.redhat?.must_equal true
      transport.os[:family].must_equal 'centos'
    end
  end

  describe 'when accessing a mocked file' do
    it 'gets results for content' do

    end
  end
end
