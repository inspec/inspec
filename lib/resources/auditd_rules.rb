# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# author: Stephan Renatus
# license: All rights reserved

class AuditDaemonStatus
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def method_missing(name, *_)
    k = name.to_s
    items[k]
  end
end

class AuditDaemonRules < Inspec.resource(1)
  name 'auditd_rules'
  desc 'Use the auditd_rules InSpec audit resource to test the rules for logging that are effective on the system. The rules are queried using `auditctl`. The audit.rules file is typically located under /etc/audit/ and contains the list of rules that define what is captured in log files. To check the audit rules stored on the filesystem, use the file resource.'
  example "
    describe auditd_rules do
      its('rules') { should contain_match(/^-a always,exit -F arch=b[\d]+ -S open -S openat -F exit=-EACCES -k access/) }
    end

    describe auditd_rules.status do
      its('backlog_limit') { should cmp 8192 }
    end
  "

  attr_reader :rules

  def LIST_RULES
    warn '[DEPRECATION] `LIST_RULES` is deprecated.  Please use `rules` instead.'
    rules
  end

  def initialize
    @rules = inspec.command('/sbin/auditctl -l').stdout.lines.map(&:chomp)
  end

  def status
    @status ||= AuditDaemonStatus.new(items)
  end

  def items
    # each line = one status keyval item
    @status_content ||= inspec.command('/sbin/auditctl -s').stdout.lines.map(&:chomp)
    return nil if @status_content.nil?

    @items ||= Hash[@status_content.flat_map {|l| l.scan(/^(\w+) (.*)$/)}]
  end

  def to_s
    'Audit Daemon Rules'
  end
end
