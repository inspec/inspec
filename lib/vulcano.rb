# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'utils/spec_helper'

require 'vulcano/version'
require 'vulcano/resource'
require 'vulcano/rule'
require 'vulcano/rspec_json_formatter'

require 'resources/audit_policy'
require 'resources/command'
require 'resources/env'
require 'resources/etc_group'
require 'resources/file'
require 'resources/group_policy'
require 'resources/login_def'
require 'resources/mysql_conf'
require 'resources/mysql_session'
require 'resources/parse_config'
require 'resources/passwd'
require 'resources/postgres_conf'
require 'resources/postgres_session'
require 'resources/processes'
require 'resources/registry_key'
require 'resources/security_policy'
require 'resources/ssh_conf'
require 'matchers/matchers'

# Dummy module for handling additional attributes
# which may be injected by the user. This covers data
# like passwords, usernames, or configuration flags.
def attributes what, required: false
  return nil
end
