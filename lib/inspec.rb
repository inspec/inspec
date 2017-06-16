# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'inspec/version'
require 'inspec/exceptions'
require 'inspec/profile'
require 'inspec/rspec_json_formatter'
require 'inspec/rule'
require 'matchers/matchers'
require 'inspec/runner'
require 'inspec/shell'

# all utils that may be required by plugins
require 'inspec/base_cli'
require 'inspec/fetcher'
require 'inspec/source_reader'
require 'inspec/resource'
require 'inspec/plugins'
