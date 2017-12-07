# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
# author: Jen Burns

require 'forwardable'
require 'utils/filter_array'
require 'utils/filter'
require 'utils/parser'

module Inspec::Resources
  class AuditDaemon < Inspec.resource(1)
    extend Forwardable
    attr_accessor :lines
    attr_reader :params

    name 'auditd'
    desc 'Use the auditd InSpec audit resource to test the rules for logging that exist on the system. The audit.rules file is typically located under /etc/audit/ and contains the list of rules that define what is captured in log files. These rules are output using the auditcl -l command.'
    example "
      describe auditd.syscall('chown').where {arch == 'b32'} do
        its('action') { should eq ['always'] }
        its('list') { should eq ['exit'] }
      end

      describe auditd.where {key == 'privileged'} do
        its('permissions') { should include ['x'] }
      end

      describe auditd do
        its('lines') { should include %r(-w /etc/ssh/sshd_config) }
      end
    "

    def initialize
      @content = inspec.command('/sbin/auditctl -l').stdout.chomp
      @params = []

      if @content =~ /^LIST_RULES:/
        return skip_resource 'The version of audit is outdated. The `auditd` resource supports versions of audit >= 2.3.'
      end
      parse_content
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:file,         field: 'file')
          .add(:list,         field: 'list')
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

    def status(name = nil)
      @status_content ||= inspec.command('/sbin/auditctl -s').stdout.chomp
      @status_params ||= Hash[@status_content.scan(/^([^ ]+) (.*)$/)]

      return @status_params[name] if name
      @status_params
    end

    def parse_content
      @lines = @content.lines.map(&:chomp)

      lines.each do |line|
        if is_file_syscall_syntax?(line)
          file_syscall_syntax_rules_for(line)
        end

        if is_syscall?(line)
          syscall_rules_for(line)

        elsif is_file?(line)
          file_rules_for(line)
        end
      end
    end

    def file_syscall_syntax_rules_for(line)
      file = file_syscall_syntax_for(line)
      action, list = action_list_for(line)
      fields = rule_fields_for(line)
      key_field, fields_nokey = remove_key_from(fields)
      key = key_in(key_field.join(''))
      perms = perms_in(fields)

      @params.push(
        {
          'file' => file,
          'list' => list,
          'action' => action,
          'fields' => fields,
          'permissions' => perms,
          'key' => key,
          'fields_nokey' => fields_nokey,
        },
      )
    end

    def syscall_rules_for(line)
      syscalls = syscalls_for(line)
      action, list = action_list_for(line)
      fields = rule_fields_for(line)
      key_field, fields_nokey = remove_key_from(fields)
      key = key_in(key_field.join(''))
      arch = arch_in(fields)
      path = path_in(fields)
      perms = perms_in(fields)
      exit_field = exit_in(fields)

      syscalls.each do |s|
        @params.push(
          {
            'syscall' => s,
            'list' => list,
            'action' => action,
            'fields' => fields,
            'key' => key,
            'arch' => arch,
            'path' => path,
            'permissions' => perms,
            'exit' => exit_field,
            'fields_nokey' => fields_nokey,
          },
        )
      end
    end

    def file_rules_for(line)
      file = file_for(line)
      perms = permissions_for(line)
      key = key_for(line)

      @params.push(
        {
          'file' => file,
          'key' => key,
          'permissions' => perms,
        },
      )
    end

    def to_s
      'Auditd Rules'
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

    def syscalls_for(line)
      line.scan(/-S ([^ ]+)\s?/).flatten.first.split(',')
    end

    def action_list_for(line)
      line.scan(/-a ([^,]+),([^ ]+)\s?/).flatten
    end

    def key_for(line)
      line.match(/-k ([^ ]+)\s?/)[1] if line.include?('-k ')
    end

    def file_for(line)
      line.match(/-w ([^ ]+)\s?/)[1]
    end

    def file_syscall_syntax_for(line)
      line.match(/-F path=(\S+)\s?/)[1]
    end

    def permissions_for(line)
      line.match(/-p ([^ ]+)/)[1].scan(/\w/)
    end

    def rule_fields_for(line)
      line.gsub(/-[aS] [^ ]+ /, '').split('-F ').map { |l| l.split(' ') }.flatten
    end

    def arch_in(fields)
      fields.each do |field|
        return field.match(/arch=(\S+)\s?/)[1] if field.start_with?('arch=')
      end
      nil
    end

    def perms_in(fields)
      fields.each do |field|
        return field.match(/perm=(\S+)\s?/)[1].scan(/\w/) if field.start_with?('perm=')
      end
      nil
    end

    def path_in(fields)
      fields.each do |field|
        return field.match(/path=(\S+)\s?/)[1] if field.start_with?('path=')
      end
      nil
    end

    def exit_in(fields)
      fields.each do |field|
        return field.match(/exit=(\S+)\s?/)[1] if field.start_with?('exit=')
      end
      nil
    end

    def key_in(field)
      _, v = field.split('=')
      v
    end

    def remove_key_from(fields)
      fields.partition { |x| x.start_with? 'key' }
    end
  end
end
