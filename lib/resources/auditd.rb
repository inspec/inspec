# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# author: Jen Burns

require 'forwardable'
require 'utils/filter_array'
require 'utils/filter'
require 'utils/parser'

module Inspec::Resources
  class AuditdRulesLegacy
    def initialize(content)
      @content = content
      @opts = {
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
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
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
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
      'Audit Daemon Rules (for auditd version < 2.3)'
    end
  end

  # rubocop:disable Metrics/ClassLength
  class AuditDaemonRules < Inspec.resource(1)
    extend Forwardable
    attr_accessor :lines
    attr_reader :params

    name 'auditd'
    desc 'Use the auditd InSpec audit resource to test the rules for logging that exist on the system. The audit.rules file is typically located under /etc/audit/ and contains the list of rules that define what is captured in log files. These rules are output using the auditcl -l command.'
    example "
      # syntax for auditd < 2.3
      describe auditd do
        its('LIST_RULES') { should include %r(^exit,always arch=.* key=time-change syscall=adjtimex,settimeofday) }
        its('LIST_RULES') { should include %r(^exit,always arch=.* key=time-change syscall=stime,settimeofday,adjtimex) }
        its('LIST_RULES') { should include %r(^exit,always arch=.* key=time-change syscall=clock_settime) }
        its('LIST_RULES') { should include %r(^exit,always watch=\/etc\/localtime perm=wa key=time-change) }
      end

      # syntax for auditd >= 2.3
      describe auditd.syscall('chown').where {arch == 'b32'} do
        its('action') { should eq ['always'] }
        its('filter') { should eq ['exit'] }
      end

      describe auditd.where {key == 'privileged'} do
        its('permissions') { should include ['x'] }
      end

      describe auditd do
        its('lines') { should include (%r{-w /etc/ssh/sshd_config/}) }
      end
    "

    def initialize
      @content = inspec.command('/sbin/auditctl -l').stdout.chomp
      @params = []

      if @content =~ /^LIST_RULES:/
        # do not warn on centos 5
        unless inspec.os[:name] == 'centos' && inspec.os[:release].to_i == 5
          warn '[WARN] this version of auditd is outdated. Updating it allows for using more precise matchers.'
        end
        @legacy = AuditdRulesLegacy.new(@content)
      else
        parse_content
        @legacy = nil
      end
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:file,         field: 'file')
          .add(:filter,       field: 'filter')
          .add(:action,       field: 'action')
          .add(:fields,       field: 'fields')
          .add(:fields_nokey, field: 'fields_nokey')
          .add(:syscall,      field: 'syscall')
          .add(:key,          field: 'key')
          .add(:arch,         field: 'arch')
          .add(:path,         field: 'path')
          .add(:permissions,  field: 'permissions')
          .add(:exit,         field: 'exit')

    filter.connect(self, :params)

    # non-legacy instances are not asked for `its('LIST_RULES')`
    # rubocop:disable Style/MethodName
    def LIST_RULES
      return @legacy.LIST_RULES if @legacy
      raise 'Using legacy auditd_rules LIST_RULES interface with non-legacy audit package. Please use the new syntax.'
    end

    def status(name = nil)
      return @legacy.status(name) if @legacy

      @status_content ||= inspec.command('/sbin/auditctl -s').stdout.chomp
      @status_params ||= Hash[@status_content.scan(/^([^ ]+) (.*)$/)]

      return @status_params[name] if name
      @status_params
    end

    def parse_content
      @lines = @content.lines.map(&:chomp)

      lines.each do |line|
        if is_file_syscall_syntax?(line)
          get_file_syscall_syntax_rules(line)
        end

        if is_syscall?(line)
          get_syscall_rules(line)

        elsif is_file?(line)
          get_file_rules(line)
        end
      end
    end

    def get_file_syscall_syntax_rules(line)
      file = get_file_syscall_syntax(line)
      action, list = get_action_list line
      fields, opts = get_fields line
      key_field, fields_nokey = remove_key fields
      key = get_key_from_field key_field.join('')
      perms = get_perms fields

      @params.push(
        {
          'file' => file,
          'filter' => list,
          'action' => action,
          'fields' => fields,
          'permissions' => perms,
          'key' => key,
          'fields_nokey' => fields_nokey,
        }.merge(opts))
    end

    def get_syscall_rules(line)
      syscalls = get_syscalls line
      action, list = get_action_list line
      fields, opts = get_fields line
      key_field, fields_nokey = remove_key fields
      key = get_key_from_field key_field.join('')
      arch = get_arch fields
      path = get_path fields
      perms = get_perms fields
      exit_field = get_exit fields

      syscalls.each do |s|
        @params.push(
          {
            'syscall' => s,
            'filter' => list,
            'action' => action,
            'fields' => fields,
            'key' => key,
            'arch' => arch,
            'path' => path,
            'permissions' => perms,
            'exit' => exit_field,
            'fields_nokey' => fields_nokey,
          }.merge(opts))
      end
    end

    def get_file_rules(line)
      file = get_file line
      perms = get_permissions line
      key = get_key line

      @params.push(
        {
          'file' => file,
          'key' => key,
          'permissions' => perms,
        },)
    end

    def to_s
      'Audit Daemon Rules'
    end

    private

    def is_syscall?(line)
      line.match(/-S /)
    end

    def is_file?(line)
      line.match(/-w /)
    end

    def is_file_syscall_syntax?(line)
      line.match(/-F path=/)
    end

    def get_syscalls(line)
      line.scan(/-S ([^ ]+)\s?/).flatten.first.split(',')
    end

    def get_action_list(line)
      line.scan(/-a ([^,]+),([^ ]+)\s?/).flatten
    end

    def get_key(line)
      line.match(/-k ([^ ]+)\s?/)[1] if line.include?('-k ')
    end

    # NOTE there are NO precautions wrt. filenames containing spaces in auditctl
    # `auditctl -w /foo\ bar` gives the following line: `-w /foo bar -p rwxa`
    def get_file(line)
      line.match(/-w ([^ ]+)\s?/)[1]
    end

    def get_file_syscall_syntax(line)
      line.match(/-F path=(\S+)\s?/)[1]
    end

    def get_permissions(line)
      line.match(/-p ([^ ]+)/)[1].scan(/\w/)
    end

    def get_fields(line)
      fields = line.gsub(/-[aS] [^ ]+ /, '').split('-F ').map { |l| l.split(' ') }.flatten
      opts = {}
      fields.find_all { |x| x.match(/[a-z]+=.*/) }.each do |kv|
        k, v = kv.split('=')
        opts[k.to_sym] = v
      end
      [fields, opts]
    end

    def get_arch(fields)
      fields.each do |field|
        return field.match(/arch=(\S+)\s?/)[1] if field.start_with?('arch=')
      end
      nil
    end

    def get_perms(fields)
      fields.each do |field|
        return field.match(/perm=(\S+)\s?/)[1].scan(/\w/) if field.start_with?('perm=')
      end
      nil
    end

    def get_path(fields)
      fields.each do |field|
        return field.match(/path=(\S+)\s?/)[1] if field.start_with?('path=')
      end
      nil
    end

    def get_exit(fields)
      fields.each do |field|
        return field.match(/exit=(\S+)\s?/)[1] if field.start_with?('exit=')
      end
      nil
    end

    def get_key_from_field(field)
      _, v = field.split('=')
      v
    end

    def remove_key(fields)
      fields.partition { |x| x.start_with? 'key' }
    end
  end
end
