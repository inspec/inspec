require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::JSON' do
  describe 'when loading a valid json' do
    let (:resource) { load_resource('json', 'policyfile.lock.json') }

    it 'gets params as a hashmap' do
      _(resource.params).must_be_kind_of Hash
    end

    it 'retrieves nil if a param is missing' do
      _(resource.params['missing']).must_be_nil
    end

    it 'retrieves params by name' do
      _(resource.send('name')).must_equal 'demo'
    end

    it 'retrieves an array by name' do
      _(resource.send('run_list')).must_equal %w{a b}
    end

    it 'doesnt resolve dot-notation names' do
      _(resource.send('x.y.z')).must_be_nil
    end

    it 'doesnt resolve symbol-notation names' do
      _(resource.send(:'x.y.z')).must_be_nil
    end

    it 'is enumerability matches its data' do
      enum = load_resource('json', content: '["a","b"]')
      not_enum = load_resource('json', content: '525600')

      _(enum.respond_to?(:each)).must_equal true
      _(not_enum.respond_to?(:each)).must_equal false
    end
  end

  describe 'when loading a nonexistent file' do
    let(:resource) { load_resource('json', 'nonexistent.json') }

    it 'produces an error' do
      _(resource.resource_exception_message).must_equal "Can't find file: nonexistent.json"
    end

    it 'still provides an empty hash for params' do
      _(resource.params).must_equal({})
    end
  end

  describe '#load_raw_from_file' do
    let(:path)     { '/path/to/file.txt' }
    let(:resource) { Inspec::Resources::JsonConfig.allocate }
    let(:inspec)   { mock }
    let(:file)     { mock }

    before do
      resource.stubs(:inspec).returns(inspec)
      inspec.expects(:file).with(path).returns(file)
    end

    it 'raises an exception when the file does not exist' do
      file.expects(:file?).returns(false)
      proc { resource.send(:load_raw_from_file, path) }.must_raise Inspec::Exceptions::ResourceSkipped
    end

    it 'raises an exception if the file content is nil' do
      file.expects(:file?).returns(true)
      file.expects(:content).returns(nil)
      proc { resource.send(:load_raw_from_file, path) }.must_raise Inspec::Exceptions::ResourceSkipped
    end

    it 'raises an exception if the file content is empty' do
      file.expects(:file?).returns(true)
      file.expects(:content).at_least_once.returns('')
      proc { resource.send(:load_raw_from_file, path) }.must_raise Inspec::Exceptions::ResourceSkipped
    end

    it 'returns the file content' do
      file.expects(:file?).returns(true)
      file.expects(:content).at_least_once.returns('json goes here')
      resource.send(:load_raw_from_file, path).must_equal 'json goes here'
    end
  end

  describe '#load_raw_from_file' do
    let(:cmd_str)  { 'curl localhost' }
    let(:resource) { Inspec::Resources::JsonConfig.allocate }
    let(:inspec)   { mock }
    let(:command)  { mock }

    before do
      resource.stubs(:inspec).returns(inspec)
      inspec.expects(:command).with(cmd_str).returns(command)
    end

    it 'raises an exception if command stdout is nil' do
      command.expects(:stdout).returns(nil)
      proc { resource.send(:load_raw_from_command, cmd_str) }.must_raise Inspec::Exceptions::ResourceSkipped
    end

    it 'raises an exception if command stdout is empty' do
      command.expects(:stdout).returns('')
      proc { resource.send(:load_raw_from_command, cmd_str) }.must_raise Inspec::Exceptions::ResourceSkipped
    end

    it 'returns the command output' do
      command.expects(:stdout).returns('json goes here')
      resource.send(:load_raw_from_command, cmd_str).must_equal 'json goes here'
    end
  end
end
