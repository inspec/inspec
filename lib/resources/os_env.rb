# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

# Usage:
#
# describe os_env('PATH') do
#   its(:split) { should_not include('') }
#   its(:split) { should_not include('.') }
# end

require 'utils/simpleconfig'

class OsEnv < Inspec.resource(1)
  name 'os_env'

  attr_reader :content
  def initialize(env = nil)
    @osenv = env
    @content = nil
    @content = params[env] unless env.nil?
  end

  def split
    # -1 is required to catch cases like dir1::dir2:
    # where we have a trailing :
    @content.nil? ? [] : @content.split(':', -1)
  end

  def to_s
    if @osenv.nil?
      'Environment variables'
    else
      "Environment variable #{@osenv}"
    end
  end

  private

  def params
    return @params if defined? @params
    out = inspec.command('env')
    out = inspec.command('printenv') unless out.exit_status == 0
    unless out.exit_status == 0
      skip_resource "Can't read environment variables on #{os[:family]}. "\
        "Tried `env` and `printenv` which returned #{out.exit_status}"
    end

    @params = SimpleConfig.new(out.stdout).params
  end
end
