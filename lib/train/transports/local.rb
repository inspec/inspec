# encoding: utf-8
#
require 'train/plugins'
require 'mixlib/shellout'

module Train::Transports
  class Local < Train.plugin(1)
    name 'local'

    def run_command(cmd)
      res = Mixlib::ShellOut.new(cmd)
      res.run_command
      CommandResult.new(res.stdout, res.stderr, res.exitstatus)
    rescue Errno::ENOENT => _
      CommandResult.new(nil, nil, 1)
    end
  end
end
