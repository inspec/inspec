# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter

# Usage:
#
# describe os_env('PATH') do
#   its('split') { should_not include('') }
#   its('split') { should_not include('.') }
# end

require 'utils/simpleconfig'

module Inspec::Resources
  class OsEnv < Inspec.resource(1)
    name 'os_env'
    desc 'Use the os_env InSpec audit resource to test the environment variables for the platform on which the system is running.'
    example "
      describe os_env('VARIABLE') do
        its('matcher') { should eq 1 }
      end
    "

    attr_reader :content
    def initialize(env = nil)
      @osenv = env
    end

    def split
      # we can't take advantage of `File::PATH_SEPARATOR` as code is
      # evaluated on the host machine
      path_separator = inspec.os.windows? ? ';' : ':'
      # -1 is required to catch cases like dir1::dir2:
      # where we have a trailing :
      content.nil? ? [] : content.split(path_separator, -1)
    end

    def content
      return @content if defined?(@content)
      @content = value_for(@osenv) unless @osenv.nil?
    end

    def to_s
      if @osenv.nil?
        'Environment variables'
      else
        "Environment variable #{@osenv}"
      end
    end

    private

    def value_for(env)
      command = if inspec.os.windows?
                  "${Env:#{env}}"
                else
                  'env'
                end

      out = inspec.command(command)

      unless out.exit_status == 0
        skip_resource "Can't read environment variables on #{inspec.os.name}. "\
          "Tried `#{command}` which returned #{out.exit_status}"
      end

      if inspec.os.windows?
        out.stdout.strip
      else
        params = SimpleConfig.new(out.stdout).params
        params[env]
      end
    end
  end
end
