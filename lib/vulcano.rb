# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

require 'utils/spec_helper'

require 'resources/mysql_conf'
require 'resources/mysql_session'
require 'resources/postgres_conf'
require 'resources/postgres_session'
require 'resources/processes'
require 'resources/ssh_conf'

# Dummy module for handling additional attributes
# which may be injected by the user. This covers data
# like passwords, usernames, or configuration flags.
def attributes what, required: false
  return nil
end
