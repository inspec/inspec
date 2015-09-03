# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

class AuditDaemonRules < Vulcano.resource(1)
  name 'audit_daemon_rules'

  def initialize
    @content = vulcano.run_command('/sbin/auditctl -l').stdout.chomp

    @opts = {
      assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
      multiple_values: true
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
      multiple_values: false
    }
    @status_content ||= vulcano.run_command('/sbin/auditctl -s').stdout.chomp
    @status_params = SimpleConfig.new(@status_content, @status_opts).params
    status = @status_params['AUDIT_STATUS']
    if (status == nil) then return nil end

    items = Hash[status.scan(/([^=]+)=(\w*)\s*/)]
    items[name]
  end

  def to_s
    'Audit Daemon Rules'
  end

end
