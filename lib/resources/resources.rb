# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'resources/apache_conf'
require 'resources/audit_policy'
require 'resources/auditd_conf'
require 'resources/auditd_rules'
require 'resources/command'
require 'resources/env'
require 'resources/etc_group'
require 'resources/file'
require 'resources/group_policy'
require 'resources/inetd_conf'
require 'resources/limits_conf'
require 'resources/login_def'
require 'resources/mysql_conf'
require 'resources/mysql_session'
require 'resources/ntp_conf'
require 'resources/parse_config'
require 'resources/passwd'
require 'resources/postgres_conf'
require 'resources/postgres_session'
require 'resources/processes'
require 'resources/registry_key'
require 'resources/security_policy'
require 'resources/ssh_conf'

# extend serverspec types
module Serverspec
  module Type

    def audit_daemon_rules()
      AuditDaemonRules.new()
    end

    def audit_daemon_conf()
      AuditDaemonConf.new()
    end

    def audit_policy()
      AuditPolicy.new()
    end

    def conf_ssh()
      SshConf.new('/etc/ssh/ssh_config')
    end

    def conf_sshd()
      SshConf.new('/etc/ssh/sshd_config')
    end

    def directory(name)
      Directory.new(name)
    end

    def etc_group(gid=nil)
      i = EtcGroup.new('/etc/group')
      i.gid = gid
      i
    end

    def group_policy(policy_path)
      GroupPolicy.new(policy_path)
    end

    def inetd_conf()
      InetdConf.new()
    end

    def limits_conf()
      LimitsConf.new()
    end

    def login_def()
      LoginDef.new()
    end

    def ntp_conf()
      NtpConf.new()
    end

    def os_env(name)
      EnvironmentVariable.new(name)
    end

    def parse_config(content, opts={})
      PConfig.new(content, opts)
    end

    def parse_config_file(file)
      p = PConfig.new()
      p.parse_file(file)
      p
    end

    def passwd(uid=nil)
      i = Passwd.new('/etc/passwd')
      i.uid = uid
      i
    end

    def processes( grep )
      Processes.new(grep)
    end

    def registry_key(name, reg_key=nil)

      # if we have one parameter, we use it as name
      if reg_key == nil
        reg_key = name
      end

      # initialize variable
      i = RegistryKey.new(name)
      i.reg_key = reg_key
      i
    end

    def security_policy()
      SecurityPolicy.new()
    end

  end
end
