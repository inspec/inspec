# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'shellwords'
require 'specinfra'
require 'specinfra/helper'
require 'specinfra/helper/set'

module Vulcano::Backends
  class SpecinfraHelper < Vulcano.backend(1)
    name 'specinfra'

    autoload :Docker, 'vulcano/backend/specinfra_docker'
    autoload :Exec,   'vulcano/backend/specinfra_exec'
    autoload :Ssh,    'vulcano/backend/specinfra_ssh'
    autoload :Winrm,  'vulcano/backend/specinfra_winrm'

    autoload :File,   'vulcano/backend/specinfra_file'
    autoload :OS,     'vulcano/backend/specinfra_os'

    attr_reader :os

    def initialize(conf)
      @conf = conf
      @files = {}

      configure_shared_options

      type = @conf['backend'].to_s
      type = 'exec' if type.empty?

      case type
      when 'docker'
        spec_backend = Specinfra::Backend::Docker
        backend_helper = Docker
      when 'exec'
        spec_backend = Specinfra::Backend::Exec
        backend_helper = Exec
      when 'ssh'
        spec_backend = Specinfra::Backend::Ssh
        backend_helper = Ssh
      when 'winrm', 'winrms'
        @conf['ssl'] = true if type == 'winrms'
        spec_backend = Specinfra::Backend::Winrm
        backend_helper = Winrm
      else
        fail "Cannot configure Specinfra backend #{type}: it isn't supported yet."
      end

      reset_backend(spec_backend)
      backend_helper.configure(@conf)

      @os = OS.new
    end

    def file(path)
      @files[path] ||= File.new(self, path)
    end

    def run_command(cmd)
      Specinfra::Runner.run_command(cmd)
    end

    def to_s
      'SpecInfra Backend Runner'
    end

    def configure_shared_options
      Specinfra::Backend::Cmd.send(:include, Specinfra::Helper::Set)

      # Force specinfra to disregard any locally detected backend and instead
      # retry backend detection.
      Specinfra::Properties.instance.properties({})

      si = Specinfra.configuration
      if @conf['disable_sudo']
        si.disable_sudo = true
      else
        si.sudo_password = @conf['sudo_password']
        si.sudo_options = @conf['sudo_options']
      end
    end

    def reset_backend(x)
      x.instance_variable_set(:@instance, nil)
    end
  end
end

# Patch Specinfra OS detection
# Without this section you run into:
#   SystemStackError: stack level too deep
module Specinfra
  module Helper
    module Os
      def os
        property[:os] = {} if !property[:os]
        if !property[:os].include?(:family)
          property[:os] = detect_os
        end
        property[:os]
      end

      private

      def detect_os
        backend = Specinfra.configuration.backend
        if backend == :cmd || backend == :winrm
          return { family: 'windows', release: nil, arch: nil }
        end

        Specinfra::Helper::DetectOs.subclasses.each do |c|
          res = c.detect
          if res
            res[:arch] ||= Specinfra.backend.run_command('uname -m').stdout.strip
            return res
          end
        end
        fail NotImplementedError, 'Specinfra failed os detection.'
      end
    end
  end
end
