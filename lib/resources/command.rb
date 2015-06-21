# Copyright (c) 2015 Vulcano Security GmbH. All rights reserved.
module Serverspec::Type
  class Command < Base
    # Check if a given command (executable) exists
    # in the default path
    def exists?
      cmd = @name
      Command.new("type \"#{cmd}\" > /dev/null").exit_status == 0
    end
  end
end