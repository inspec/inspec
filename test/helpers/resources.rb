class Minitest::Test
  ##
  # This creates a real resource with default config/backend.
  #
  # Use this whenever possible. Let's phase out the MockLoader pain.

  def quick_resource(name, platform = :linux, *args, &block)
    backend = Inspec::Backend.create(Inspec::Config.new)
    backend.extend Fake::Backend

    os = MockLoader::OPERATING_SYSTEMS[platform]
    raise "Unknown platform: %p" % [platform] unless os

    # mock.mock_os(@platform)
    platform = Train::Platforms.name(os[:name])
    platform.find_family_hierarchy # TODO: remove? UGH! adds platform=
    platform.platform = os
    platform.add_platform_methods
    # TODO: this should have a setter
    # TODO: backend.backend is the WORST name
    backend.backend.instance_variable_set :@platform, platform
    # end mock.mock_os

    klass = Inspec::Resource.registry[name.to_s]

    instance = klass.new(backend, name, *args)
    instance.extend Fake::Resource
    instance.mock_command(&block) if block
    instance
  end
end

module Fake
  Command = Struct.new(:stdout, :stderr, :exit_status)

  module Backend
    def string(str)
      ::Fake::Command.new(str, "", 0)
    end

    def stdout_file(path)
      result(path, nil, 0)
    end

    def stderr_file(path)
      result(nil, path, 0)
    end

    def result(stdout_path, stderr_path, exit)
      stdout = stdout_path ? File.read(stdout_path) : ""
      stderr = stderr_path ? File.read(stderr_path) : ""

      ::Fake::Command.new(stdout, stderr, 0)
    end
  end

  module Resource
    def mock_command(&block)
      inspec.define_singleton_method :command, &block
    end
  end
end
