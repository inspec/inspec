# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

# Usage:
#
# describe os_env('PATH') do |dirs|
#   its(:split) { should_not include('') }
#   its(:split) { should_not include('.') }
# end

class OsEnv < Vulcano.resource(1)
  name 'os_env'

  attr_reader :content
  def initialize(env)
    @osenv = env
    @command_result = vulcano.command("su - root -c 'echo $#{env}'")
    @content = @command_result.stdout.chomp
  end

  def split
    # -1 is required to catch cases like dir1::dir2:
    # where we have a trailing :
    @content.split(':', -1)
  end

  def stderr
    @command_result.stderr
  end

  def exit_status
    @command_result.exit_status.to_i
  end

  def to_s
    "Environment variable #{@osenv}"
  end
end
