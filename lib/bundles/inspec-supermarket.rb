# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

module Supermarket
  autoload :API, 'inspec-supermarket/api'
end

require 'inspec-supermarket/cli'
require 'inspec-supermarket/target'
