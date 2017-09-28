# encoding: utf-8
# author: Matthew Dromazos

require 'utils/parser'

class EtcHosts < Inspec.resource(1)
  name 'etc_hosts'
  desc 'Use the etc_hosts InSpec audit resource to find an
    ip_address and its associated hosts'
  example "
    describe etc_hosts.where { ip_address == '127.0.0.1' } do
      its('ip_address') { should cmp '127.0.0.1' }
      its('primary_name') { should cmp 'localhost' }
      its('all_host_names') { should eq [['localhost', 'localhost.localdomain', 'localhost4', 'localhost4.localdomain4']] }
    end
  "

  attr_reader :params

  include CommentParser

  def initialize(hosts_path = nil)
    return skip_resource 'The `etc_hosts` resource is not supported on your OS.' unless inspec.os.bsd? || inspec.os.linux? || inspec.os.windows?
    @conf_path      = hosts_path || default_hosts_file_path
    @content        = nil
    @params         = nil
    read_content
  end

  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add(:ip_address,     field: 'ip_address')
        .add(:primary_name,   field: 'primary_name')
        .add(:all_host_names, field: 'all_host_names')

  filter.connect(self, :params)

  private

  def default_hosts_file_path
    inspec.os.windows? ? 'C:\windows\system32\drivers\etc\hosts' : '/etc/hosts'
  end

  def read_content
    @content = ''
    @params  = {}
    @content = read_file(@conf_path)
    @params  = parse_conf(@content)
  end

  def parse_conf(content)
    content.map do |line|
      data, = parse_comment_line(line, comment_char: '#', standalone_comments: false)
      parse_line(data) unless data == ''
    end.compact
  end

  def parse_line(line)
    line_parts = line.split
    return nil unless line_parts.length >= 2
    {
      'ip_address'     => line_parts[0],
      'primary_name'   => line_parts[1],
      'all_host_names' => line_parts[1..-1],
    }
  end

  def read_file(conf_path = @conf_path)
    file = inspec.file(conf_path)
    if !file.file?
      return skip_resource "Can't find file. \"#{@conf_path}\""
    end

    raw_conf = file.content
    if raw_conf.empty? && !file.empty?
      return skip_resource("Could not read file contents\" #{@conf_path}\"")
    end
    raw_conf.lines
  end
end
