
require 'inspec/utils/command_wrapper'
require 'inspec/resources/command'

module Inspec::Resources
  class Ksh < Cmd
    name 'ksh'
    supports platform: 'unix'
    desc 'Run a command or script in KornShell.'
    example <<~EXAMPLE
      describe ksh('ls -al /') do
        its('stdout') { should match /bin/ }
        its('stderr') { should eq '' }
        its('exit_status') { should eq 0 }
      end

      # Specify the path of the executable:
      ksh('...', path: '/usr/bin/ksh93')

      # Specify arguments (defaults to -c)
      ksh('...', args: '-x -c')
    EXAMPLE

    def initialize(command, options = {})
      @raw_command = command
      options[:shell] = 'ksh' if options.is_a?(Hash)
      super(CommandWrapper.wrap(command, options))
    end

    def to_s
      "KornShell command #{@raw_command}"
    end
  end
end
