# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

class AuditDaemonRules < Inspec.resource(1)
  name 'auditd_rules'
  desc 'Use the auditd_rules InSpec audit resource to test the rules for logging that exist on the system. The audit.rules file is typically located under /etc/audit/ and contains the list of rules that define what is captured in log files.'
  example "
    describe auditd_rules do
      its('LIST_RULES') {should contain_match(/^exit,always arch=.* key=time-change syscall=adjtimex,settimeofday/) }
      its('LIST_RULES') {should contain_match(/^exit,always arch=.* key=time-change syscall=stime,settimeofday,adjtimex/) }
      its('LIST_RULES') {should contain_match(/^exit,always arch=.* key=time-change syscall=clock_settime/)}
      its('LIST_RULES') {should contain_match(/^exit,always watch=\/etc\/localtime perm=wa key=time-change/)}
    end
  "

  def initialize
    @content = inspec.command('/sbin/auditctl -l').stdout.chomp

    @opts = {
      assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
      multiple_values: true,
    }
  end

  def params
    @params ||= SimpleConfig.new(@content, @opts).params
  end

  def method_missing(name)
    params[name.to_s]
  end

  def status(name)
    @status_opts = {
      assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
      multiple_values: false,
    }
    @status_content ||= inspec.command('/sbin/auditctl -s').stdout.chomp
    @status_params = SimpleConfig.new(@status_content, @status_opts).params

    status = @status_params['AUDIT_STATUS']
    return nil if status.nil?

    items = Hash[status.scan(/([^=]+)=(\w*)\s*/)]
    items[name]
  end

  def to_s
    'Audit Daemon Rules'
  end
end
