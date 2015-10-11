# encoding: utf-8
#
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'train/transports/local'

describe 'local transport' do
  let(:transport) { Train::Transports::Local.new }

  it 'can be instantiated' do
    transport.wont_be_nil
  end

  describe 'when running a local command' do
    let (:mock) { Minitest::Mock.new }
    def mock_run_cmd(cmd, &block)
      mock.expect :run_command, nil
      Mixlib::ShellOut.stub :new, mock do |*args|
        block.call()
      end
    end

    it 'gets stdout' do
      mock_run_cmd(rand) do
        x = rand
        mock.expect :stdout, x
        mock.expect :stderr, nil
        mock.expect :exitstatus, nil
        transport.run_command(rand).stdout.must_equal x
      end
    end

    it 'gets stderr' do
      mock_run_cmd(rand) do
        x = rand
        mock.expect :stdout, nil
        mock.expect :stderr, x
        mock.expect :exitstatus, nil
        transport.run_command(rand).stderr.must_equal x
      end
    end

    it 'gets exit_status' do
      mock_run_cmd(rand) do
        x = rand
        mock.expect :stdout, nil
        mock.expect :stderr, nil
        mock.expect :exitstatus, x
        transport.run_command(rand).exit_status.must_equal x
      end
    end
  end
end
