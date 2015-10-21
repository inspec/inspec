# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require_relative '../helper'
require 'train'

def run_as(cmd, opts = {})
  Train.create('local', opts)
    .connection
    .run_command(cmd)
end
