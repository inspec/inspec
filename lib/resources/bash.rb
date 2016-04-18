# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'utils/command_wrapper'
require 'resources/command'

module Inspec::Resources
  class Bash < Cmd
    name 'bash'
    desc 'Run a command or script in BASH.'
    example "
      describe bash('ls -al /') do
        its('stdout') { should match /bin/ }
        its('stderr') { should eq '' }
        its('exit_status') { should eq 0 }
      end

      # Specify the path of the executable:
      bash('...', path: '/bin/bash')

      # Specify arguments (defaults to -c)
      bash('...', args: '-x -c')
    "

    def initialize(command, options = {})
      @raw_command = command
      options[:shell] = 'bash' if options.is_a?(Hash)
      super(CommandWrapper.wrap(command, options))
    end

    def to_s
      "Bash command #{@raw_command}"
    end
  end
end
