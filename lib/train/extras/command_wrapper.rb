# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'base64'

module Train::Extras
  class LinuxCommand
    Train::Options.attach(self)

    option :sudo, default: false
    option :sudo_options, default: nil
    option :sudo_password, default: nil

    def initialize(backend, options)
      @backend = backend
      validate_options(options)

      @sudo = options[:sudo]
      @sudo_options = options[:sudo_options]
      @sudo_password = options[:sudo_password]
      @prefix = build_prefix
    end

    def run(command)
      @prefix + command
    end

    def self.active?(options)
      options.is_a?(Hash) && options[:sudo]
    end

    private

    def build_prefix
      return '' unless @sudo
      res = 'sudo '

      res << @sudo_options.to_s + ' ' unless @sudo_options.nil?

      unless @sudo_password.nil?
        b64pw = Base64.strict_encode64(@sudo_password)
        res = "echo #{b64pw} | base64 -d | " + res
      end

      res
    end
  end

  class CommandWrapper
    include_options LinuxCommand

    def self.load(transport, options)
      return nil unless LinuxCommand.active?(options)
      return nil unless transport.os.unix?
      LinuxCommand.new(transport, options)
    end
  end
end
