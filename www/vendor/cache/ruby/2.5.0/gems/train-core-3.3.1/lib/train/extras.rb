# encoding: utf-8
#
# Author:: Dominik Richter (<dominik.richter@gmail.com>)

module Train::Extras
  require_relative "extras/command_wrapper"
  require_relative "extras/stat"

  CommandResult = Struct.new(:stdout, :stderr, :exit_status)
  LoginCommand = Struct.new(:command, :arguments)
end
