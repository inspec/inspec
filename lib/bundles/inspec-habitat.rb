# encoding: utf-8
# author: Adam Leff

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

module Habitat
  autoload :Log,     'inspec-habitat/log'
  autoload :Profile, 'inspec-habitat/profile'
end

require 'inspec-habitat/cli'
