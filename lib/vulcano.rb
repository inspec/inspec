# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'vulcano/version'
require 'vulcano/backend'
require 'vulcano/resource'
require 'vulcano/rspec_json_formatter'
require 'vulcano/rule'
require 'vulcano/runner'

require 'matchers/matchers'

# Dummy module for handling additional attributes
# which may be injected by the user. This covers data
# like passwords, usernames, or configuration flags.
def attributes(what, required: false)
  nil
end
