# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

class OsEnv < Vulcano.resource(1)
  name 'os_env'

  attr_reader :content
  def initialize(field)
    @command_result = vulcano.run_command("su - root -c 'echo $#{name}'")
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
    "Environment variable #{field}"
  end
end
