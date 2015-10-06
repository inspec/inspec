# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'digest'

module Vulcano::Plugins
  class Backend
    autoload :FileCommon, 'vulcano/plugins/backend_file_common'
    autoload :LinuxFile,  'vulcano/plugins/backend_linux_file'
    autoload :OSCommon,   'vulcano/plugins/backend_os_common'
    CommandResult = Struct.new(:stdout, :stderr, :exit_status)

    def self.name(name)
      Vulcano::Plugins::Backend.__register(name, self)
    end

    # raise errors for all missing methods
    %w{ file run_command os }.each do |m|
      define_method(m.to_sym) do |*_|
        fail NotImplementedError, "Backend must implement the #{m}() method."
      end
    end

    def self.__register(id, obj)
      Vulcano::Backend.registry[id] = obj
    end
  end
end
