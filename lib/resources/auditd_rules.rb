# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

require 'forwardable'
require 'utils/filter_array'

class AuditdRulesLegacy
  def initialize(content)
    @content = content
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
    'Audit Daemon Rules (legacy format)'
  end
end

class AuditDaemonRules < Inspec.resource(1)
  extend Forwardable
  attr_accessor :rules, :lines

  name 'auditd_rules'
  desc 'Use the auditd_rules InSpec audit resource to test the rules for logging that exist on the system. The audit.rules file is typically located under /etc/audit/ and contains the list of rules that define what is captured in log files.'
  example "
    # legacy syntax for auditd <= 2.2
    describe auditd_rules do
      its('LIST_RULES') {should contain_match(/^exit,always arch=.* key=time-change syscall=adjtimex,settimeofday/) }
      its('LIST_RULES') {should contain_match(/^exit,always arch=.* key=time-change syscall=stime,settimeofday,adjtimex/) }
      its('LIST_RULES') {should contain_match(/^exit,always arch=.* key=time-change syscall=clock_settime/)}
      its('LIST_RULES') {should contain_match(/^exit,always watch=\/etc\/localtime perm=wa key=time-change/)}
    end

    # TODO(sr) new interface
  "

  def initialize
    @content = inspec.command('/sbin/auditctl -l').stdout.chomp

    if @content.match /^LIST_RULES:/
      warn '[LEGACY] this version of auditd is outdated. Updating it allows for using more precise matchers.'
      @legacy = AuditdRulesLegacy.new(@content)
    else
      parse_content
    end
  end

  # non-legacy instances are not asked for `its('LIST_RULES')`
  def LIST_RULES
    return @legacy.LIST_RULES if @legacy
    fail 'Using legacy auditd_rules LIST_RULES interface with non-legacy audit package. Please use the new syntax.'
  end

  def parse_content
    @rules = {
      syscalls: [],
      files: []
    }
    @lines = @content.lines.map(&:chomp)

    lines.each do |line|
      if is_syscall?(line)
        syscalls = get_syscalls line
        action, list = get_action_list line
        key = get_key line
        opts = get_opts line

        # create a 'flatter' structure because sanity
        syscalls.each do |s|
          @rules[:syscalls] << { syscall: s, list: list, action: action, key: key, opts: opts }
        end
      elsif is_file?(line)
        file = get_file line
        perms = get_permissions line
        key = get_key line

        @rules[:files] << { file: file, key: key, permissions: perms }
      end
    end
  end

  def syscall(name)
    select_name(:syscall, name)
  end

  def file(name)
    select_name(:file, name)
  end

  def to_s
    'Audit Daemon Rules'
  end

  private

  def select_name(key, name)
    plural = "#{key}s".to_sym
    res = rules[plural].find_all { |rule| rule[key] == name }
    FilterArray.new(res)
  end

  def is_syscall?(line)
    line.match /\ -S /
  end

  def is_file?(line)
    line.match /-w /
  end

  def get_syscalls(line)
    line.scan(/-S ([^ ]+)/).flatten
  end

  def get_action_list(line)
    line.scan(/-a ([^,]+),([^ ]+)/).flatten
  end

  def get_key(line)
    line.match(/-k ([^ ]+)/)[1]
  end

  # NOTE there are NO precautions wrt. filenames containing spaces in auditctl
  # `auditctl -w /foo\ bar` gives the following line: `-w /foo bar -p rwxa`
  def get_file(line)
     line.match(/-w (.+) -p/)[1]
  end

  def get_permissions(line)
    line.match(/-p ([^ ]+)/)[1]
  end

  def get_opts(line)
    opts = {}
    line.scan(/-F ([^= ]+)=([^ ]+)/).each do |key, val|
      opts[key.to_s] = val
    end

    opts
  end
end
