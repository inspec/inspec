require "helper"

describe "Backend" do # rubocop:disable Metrics/BlockLength
  let(:backend) { Inspec::Backend.create(Inspec::Config.mock) }

  describe "create" do # rubocop:disable Metrics/BlockLength
    it "accepts an Inspec::Config" do
      backend.is_a?(Inspec::Backend::Base).must_equal true
    end

    it "raises an error if no transport backend can be found" do
      Train.stub :create, nil do
        err = proc { backend }.must_raise RuntimeError
        err.message.must_equal "Can't find transport backend 'mock'."
      end
    end

    it "raises an error if no connection can be created" do
      mock_transport = Minitest::Mock.new
      mock_bad_connection = Minitest::Mock.new
      mock_transport.expect :nil?, false
      mock_transport.expect :connection, mock_bad_connection
      mock_bad_connection.expect :nil?, true

      Train.stub :create, mock_transport do
        err = proc { backend }.must_raise RuntimeError
        err.message.must_equal "Can't connect to transport backend 'mock'."
      end
    end

    it "enables/disables caching based on `config[:backend_cache]`" do
      cache_enabled_config = Inspec::Config.new(backend_cache: true)
      cache_enabled_backend = Inspec::Backend.create(cache_enabled_config)
      cache_enabled_backend.backend.cache_enabled?(:file).must_equal true
      cache_enabled_backend.backend.cache_enabled?(:command).must_equal true

      cache_disabled_config = Inspec::Config.new(backend_cache: false)
      cache_disabled_backend = Inspec::Backend.create(cache_disabled_config)
      cache_disabled_backend.backend.cache_enabled?(:file).must_equal false
      cache_disabled_backend.backend.cache_enabled?(:command).must_equal false
    end

    it "enables caching when using a mock backend" do
      backend.backend.cache_enabled?(:file).must_equal true
      backend.backend.cache_enabled?(:command).must_equal true
    end

    it "disables caching when `config[:debug_shell]` is true" do
      debug_shell_config = Inspec::Config.new(debug_shell: true)
      debug_shell_backend = Inspec::Backend.create(debug_shell_config)
      debug_shell_backend.backend.cache_enabled?(:file).must_equal false
      debug_shell_backend.backend.cache_enabled?(:command).must_equal false
    end

    it "captures Train::ClientError" do
      Train.stub(:create, proc { raise Train::ClientError }) do
        err = proc { backend }.must_raise RuntimeError
        err.message.must_equal "Client error, can't connect to 'mock' backend: "
      end
    end

    it "captures Train::TransportError" do
      Train.stub(:create, proc { raise Train::TransportError }) do
        err = proc { backend }.must_raise RuntimeError
        err.message.must_equal "Transport error, can't connect to 'mock' backend: "
      end
    end
  end

  describe "version" do
    it "returns the current InSpec version" do
      backend.version.must_equal Inspec::VERSION
    end
  end

  describe "local_transport?" do
    it "returns false when using a Mock transport" do
      backend.local_transport?.must_equal false
    end

    it "returns true when using a Local transport" do
      local_backend = Inspec::Backend.create(Inspec::Config.new)
      local_backend.local_transport?.must_equal true
    end
  end

  describe "to_s" do
    it "returns the correct string" do
      backend.to_s.must_equal "Inspec::Backend::Class"
    end
  end

  describe "inspect" do
    it "returns the correct string" do
      backend.inspect.must_equal "Inspec::Backend::Class @transport=Train::Transports::Mock::Connection"
    end
  end
end
