# encoding: utf-8
#
# author: Dominik Richter
# author: Christoph Hartmann

require 'train/plugins'
require 'mixlib/shellout'

module Train::Transports
  class Local < Train.plugin(1)
    name 'local'

    autoload :File, 'train/transports/local_file'
    autoload :OS,   'train/transports/local_os'

    def initialize
      @files = {}
    end

    def run_command(cmd)
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
  end
end
