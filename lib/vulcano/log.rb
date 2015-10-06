# encoding: utf-8
# Copyright 2015 Dominik Richter. All rights reserved.
# author: Dominik Richter
# author: Christoph Hartmann

require 'rainbow/ext/string'

module Vulcano
  class Log
    def initialize(opts = {})
      @quiet = opts[:quiet] || false
    end

    def show(msg)
      puts msg unless @quiet
    end

    def info(msg)
      show '  .  '.color(:white) + msg
    end

    def error(msg)
      show '  ✖  '.color(:red).bright + msg
    end

    def warn(msg)
      show '  !  '.color(:yellow).bright + msg
    end

    def ok(msg)
      show '  ✔  '.color(:green).bright + msg
    end
  end
end
