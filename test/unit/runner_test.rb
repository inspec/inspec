# encoding: utf-8
# copyright: 2017, Chef Software Inc.

require 'helper'

describe Inspec::Runner do
  describe '#load_attributes' do
    let(:runner) { Inspec::Runner.new({ command_runner: :generic }) }

    before do
      Inspec::Runner.any_instance.stubs(:validate_attributes_file_readability!)
    end

    describe 'confirm reporter defaults to cli' do
      it 'defaults to cli when format and reporter not set' do
        opts = { command_runner: :generic, backend_cache: true }
        runner = Inspec::Runner.new(opts)
        config = runner.instance_variable_get(:"@conf")
        expected = { 'cli' => { 'stdout' => true } }
        config['reporter'].must_equal expected
      end

      it 'does not default when format is set' do
        opts = { command_runner: :generic, backend_cache: true, 'reporter' => ['json'] }
        runner = Inspec::Runner.new(opts)
        config = runner.instance_variable_get(:"@conf")
        expected = { 'json' => { 'stdout' => true } }
        config['reporter'].must_equal expected
      end

      it 'delets format if set to a rspec format' do
        opts = { command_runner: :generic, backend_cache: true, 'reporter' => ['progress'] }
        runner = Inspec::Runner.new(opts)
        config = runner.instance_variable_get(:"@conf")
        config['reporter'].must_equal Hash.new
      end
    end

    describe 'testing runner.run exit codes' do
      it 'returns proper exit code when no profile is added' do
        runner.run.must_equal 0
      end
    end

    describe 'when backend caching is enabled' do
      it 'returns a backend with caching' do
        opts = { command_runner: :generic, backend_cache: true }
        runner = Inspec::Runner.new(opts)
        backend = runner.instance_variable_get(:@backend)
        backend.backend.cache_enabled?(:command).must_equal true
      end
    end

    describe 'when backend caching is disabled' do
      it 'returns a backend without caching' do
        opts = { command_runner: :generic, backend_cache: false }
        runner = Inspec::Runner.new(opts)
        backend = runner.instance_variable_get(:@backend)
        backend.backend.cache_enabled?(:command).must_equal false
      end

      it 'returns a backend without caching as default' do
        backend = runner.instance_variable_get(:@backend)
        backend.backend.cache_enabled?(:command).must_equal false
      end
    end

    describe 'when no attrs are specified' do
      it 'returns an empty hash' do
        options = {}
        runner.load_attributes(options).must_equal({})
      end
    end

    describe 'when an attr is provided and does not resolve' do
      it 'raises an exception' do
        options = { attrs: ['nope.jpg'] }
        Inspec::SecretsBackend.expects(:resolve).with('nope.jpg').returns(nil)
        proc { runner.load_attributes(options) }.must_raise Inspec::Exceptions::SecretsBackendNotFound
      end
    end

    describe 'when an attr is provided and has no attributes' do
      it 'returns an empty hash' do
        secrets = mock
        secrets.stubs(:attributes).returns(nil)
        options = { attrs: ['empty.yaml'] }
        Inspec::SecretsBackend.expects(:resolve).with('empty.yaml').returns(secrets)
        runner.load_attributes(options).must_equal({})
      end
    end

    describe 'when an attr is provided and has attributes' do
      it 'returns a hash containing the attributes' do
        options = { attrs: ['file1.yaml'] }
        attributes = { foo: 'bar' }
        secrets = mock
        secrets.stubs(:attributes).returns(attributes)
        Inspec::SecretsBackend.expects(:resolve).with('file1.yaml').returns(secrets)
        runner.load_attributes(options).must_equal(attributes)
      end
    end

    describe 'when multiple attrs are provided and one fails' do
      it 'raises an exception' do
        options = { attrs: ['file1.yaml', 'file2.yaml'] }
        secrets = mock
        secrets.stubs(:attributes).returns(nil)
        Inspec::SecretsBackend.expects(:resolve).with('file1.yaml').returns(secrets)
        Inspec::SecretsBackend.expects(:resolve).with('file2.yaml').returns(nil)
        proc { runner.load_attributes(options) }.must_raise Inspec::Exceptions::SecretsBackendNotFound
      end
    end

    describe 'when multiple attrs are provided and one has no attributes' do
      it 'returns a hash containing the attributes from the valid files' do
        options = { attrs: ['file1.yaml', 'file2.yaml'] }
        attributes = { foo: 'bar' }
        secrets1 = mock
        secrets1.stubs(:attributes).returns(nil)
        secrets2 = mock
        secrets2.stubs(:attributes).returns(attributes)
        Inspec::SecretsBackend.expects(:resolve).with('file1.yaml').returns(secrets1)
        Inspec::SecretsBackend.expects(:resolve).with('file2.yaml').returns(secrets2)
        runner.load_attributes(options).must_equal(attributes)
      end
    end

    describe 'when multiple attrs are provided and all have attributes' do
      it 'returns a hash containing all the attributes' do
        options = { attrs: ['file1.yaml', 'file2.yaml'] }
        secrets1 = mock
        secrets1.stubs(:attributes).returns({ key1: 'value1' })
        secrets2 = mock
        secrets2.stubs(:attributes).returns({ key2: 'value2' })
        Inspec::SecretsBackend.expects(:resolve).with('file1.yaml').returns(secrets1)
        Inspec::SecretsBackend.expects(:resolve).with('file2.yaml').returns(secrets2)
        runner.load_attributes(options).must_equal({ key1: 'value1', key2: 'value2' })
      end
    end
  end
end
