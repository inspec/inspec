# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

include Serverspec::Type

class AuditDaemonRules < Vulcano::Resource

  def initialize
    @runner = Specinfra::Runner
    @command_result ||= @runner.run_command("/sbin/auditctl -l")
    @content = @command_result.stdout.chomp

    @opts = {
      assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
      multiple_values: true
    }
    @params = SimpleConfig.new(@content, @opts).params
    
  end

  def method_missing name
    @params[name.to_s]
  end

  def status name
    @status_opts = {
      assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
      multiple_values: false
    }
    @status_content ||= @runner.run_command("/sbin/auditctl -s").stdout.chomp
    @status_params = SimpleConfig.new(@status_content, @status_opts).params
    status = @status_params["AUDIT_STATUS"]
    if (status == nil) then return nil end

    items = Hash[status.scan(/([^=]+)=(\w*)\s*/)]
    return items[name]
  end

  def to_s
    %Q[AuditDaemonRules]
  end

end

module Serverspec::Type
  def audit_daemon_rules()
    AuditDaemonRules.new()
  end
end