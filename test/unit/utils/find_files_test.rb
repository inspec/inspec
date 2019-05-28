require 'helper'

describe FindFiles do
  let (:helper) do
    class FindFilesTest
      include FindFiles
      def inspec
        Inspec::Backend.create(Inspec::Config.mock)
      end
    end
    FindFilesTest.new
  end

  let(:inspec) { mock }
  let(:result) { mock }

  describe '#find_files' do
    it 'returns an empty array when no files are found' do
      helper.expects(:warn)
      helper.find_files('/no/such/mock', type: 'file', depth: 1).must_equal([])
    end
  end

  describe '#find_files_or_warn' do
    before do
      helper.expects(:inspec).returns(inspec)
      result.stubs(:exit_status).returns(0)
      result.stubs(:stdout).returns('mock')
    end

    it 'constructs the correct command' do
      inspec.expects(:command).with("sh -c 'find /a/b/'").returns(result)
      helper.find_files('/a/b/')
    end

    it 'builds the correct command when a single quote is used' do
      inspec.expects(:command).with('sh -c "find /a/\'b/"').returns(result)
      helper.find_files("/a/'b/")
    end

    it 'constructs the correct command when a double quote is in the path' do
      inspec.expects(:command).with("sh -c 'find /a/\"b/'").returns(result)
      helper.find_files('/a/"b/')
    end

    it 'builds the correct command when an escaped single quote is used' do
      inspec.expects(:command).with('sh -c "find /a/\\\'b/"').returns(result)
      helper.find_files('/a/\\\'b/')
    end

    it 'builds the correct command when an escaped double quote is used' do
      inspec.expects(:command).with("sh -c 'find /a/\\\"b/'").returns(result)
      helper.find_files('/a/\"b/')
    end
  end
end
