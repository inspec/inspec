# encoding: utf-8
require 'vulcano/resource'

# require 'resources/apache_conf'
# require 'resources/audit_policy'
# require 'resources/auditd_conf'
# require 'resources/auditd_rules'
# require 'resources/command'
# require 'resources/env'
require 'resources/etc_group'
# require 'resources/file'
# require 'resources/group_policy'
require 'resources/inetd_conf'
require 'resources/limits_conf'
require 'resources/login_def'
require 'resources/mysql'
require 'resources/mysql_conf'
require 'resources/mysql_session'
require 'resources/ntp_conf'
require 'resources/parse_config'
require 'resources/passwd'
require 'resources/postgres'
require 'resources/postgres_conf'
require 'resources/postgres_session'
require 'resources/processes'
require 'resources/registry_key'
require 'resources/security_policy'
require 'resources/ssh_conf'

# extend serverspec types
module Serverspec
  module Type

    def directory(name)
      Directory.new(name)
    end

  end
end
