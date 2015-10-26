# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'resources/file'

module Inspec::Resources
  class Directory < File
    name 'directory'
  end

  def to_s
    "Directory #{@path}"
  end
end
