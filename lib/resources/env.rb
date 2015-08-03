# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

include Serverspec::Type

class EnvironmentVariable < Serverspec::Type::Base

  def method_missing(method)
    @command_result ||= @runner.run_command("su - root -c 'echo $#{name}'")
  end

  def content
    command_result.stdout.chomp
  end

  def split
    # -1 is required to catch cases like dir1::dir2:
    # where we have a trailing :
    command_result.stdout.chomp.split(':', -1)
  end

  def stderr
    command_result.stderr
  end

  def exit_status
    command_result.exit_status.to_i
  end

  def to_s
    %Q[Environment Variable]
  end

end

module Serverspec::Type
  def os_env(name)
    EnvironmentVariable.new(name)
  end
end