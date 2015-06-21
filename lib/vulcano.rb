# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'utils/spec_helper'

require 'resources/audit_policy'
require 'resources/file'
require 'resources/group_policy'
require 'resources/mysql_conf'
require 'resources/mysql_session'
require 'resources/postgres_conf'
require 'resources/postgres_session'
require 'resources/processes'
require 'resources/registry_key'
require 'resources/security_policy'
require 'resources/ssh_conf'
require 'matchers/matchers'

require 'vulcano/version'
require 'vulcano/rule'
require 'vulcano/rspec_json_formatter'

# Dummy module for handling additional attributes
# which may be injected by the user. This covers data
# like passwords, usernames, or configuration flags.
def attributes what, required: false
  return nil
end
