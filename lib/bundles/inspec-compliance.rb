# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

module Compliance
  autoload :Configuration, 'inspec-compliance/configuration'
  autoload :HTTP, 'inspec-compliance/http'
  autoload :Support, 'inspec-compliance/support'
  autoload :API, 'inspec-compliance/api'
end

require 'inspec-compliance/cli'
require 'inspec-compliance/target'
