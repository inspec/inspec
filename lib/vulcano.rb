# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'vulcano/version'
require 'vulcano/profile'
require 'vulcano/resource'
require 'vulcano/rspec_json_formatter'
require 'vulcano/rule'
require 'vulcano/runner'
require 'vulcano/shell'
require 'matchers/matchers'
