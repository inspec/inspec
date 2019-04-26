# encoding: utf-8
# copyright: 2017, Chef Software Inc.

require 'helper'
require 'inspec/secrets'

describe Inspec::Runner do
  let(:runner) { Inspec::Runner.new({ command_runner: :generic }) }

  # =============================================================== #
  #                         Reporter Options
  # =============================================================== #

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

  # =============================================================== #
  #                      Exit Codes
  # =============================================================== #

  describe 'testing runner.run exit codes' do
    it 'returns proper exit code when no profile is added' do
      proc { runner.run.must_equal 0 }
    end
  end

  # =============================================================== #
  #                       Backend Caching
  # =============================================================== #

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
end
