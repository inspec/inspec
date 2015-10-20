# encoding: utf-8
#
# author: Dominik Richter
# author: Christoph Hartmann

require 'train/plugins'
require 'mixlib/shellout'

module Train::Transports
  class Local < Train.plugin(1)
    name 'local'

    include_options Train::Extras::CommandWrapper

    autoload :File, 'train/transports/local_file'
    autoload :OS,   'train/transports/local_os'

    def connection(_ = nil)
      @connection ||= Connection.new(@options)
    end

    class Connection < BaseConnection
      def initialize(options)
        super(options)
        @files = {}
        @cmd_wrapper = nil
        @cmd_wrapper = CommandWrapper.load(self, options)
      end

      def run_command(cmd)
        cmd = @cmd_wrapper.run(cmd) unless @cmd_wrapper.nil?
        res = Mixlib::ShellOut.new(cmd)
        res.run_command
        CommandResult.new(res.stdout, res.stderr, res.exitstatus)
      rescue Errno::ENOENT => _
        CommandResult.new(nil, nil, 1)
      end

      def os
        @os ||= OS.new(self)
      end

      def file(path)
        @files[path] ||= File.new(self, path)
      end

      def login_command
        nil # none, open your shell
      end
    end
  end
end
