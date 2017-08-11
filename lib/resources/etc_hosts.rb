# encoding: utf-8
# author: Matthew Dromazos

require 'utils/parser'

class EtcHosts < Inspec.resource(1)
  name 'etc_hosts'
  desc 'Use the etc_hosts InSpec audit resource to find an
    ip_address and its associated hosts'
  example "
  describe etc_hosts.where { ip_address == '127.0.0.1' } do
    its ( 'ip_address' ) { should eq ['127.0.0.1'] }
    its ( 'canonical_hostname' ) { should eq ['localhost'] }
    its ( 'aliases_list' ) { should eq [['localhost.localdomain', 'localhost4', 'localhost4.localdomain4']] }
  end
  "

  attr_reader :params

  include CommentParser

  def initialize(hosts_path = nil)
    return skip_resource 'The `etc_hosts` resource is not supported on your OS.' unless inspec.os.linux? || inspec.os.windows?
    @conf_path      = get_hosts_path_by_os(hosts_path)
    @content        = nil
    @params         = nil
    read_content
  end

  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add(:ip_address,         field: 'ip_address')
        .add(:canonical_hostname, field: 'canonical_hostname')
        .add(:aliases_list,       field: 'aliases_list')

  filter.connect(self, :params)

  private

  def get_hosts_path_by_os(hosts_path)
    return hosts_path unless !hosts_path.nil?
    return hosts_path || '/etc/hosts' unless inspec.os.linux?
    return hosts_path || 'C:\windows\system32\drivers\etc\hosts' unless inspec.os.windows?
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
    {
      'ip_address'         => line_parts[0],
      'canonical_hostname' => line_parts[1],
      'aliases_list'       => line_parts[2..-1] || '',
    }
  end

  def read_file(conf_path = @conf_path)
    file = inspec.file(conf_path)
    if !file.file?
      return skip_resource "Can't find file. \"#{@conf_path}\""
    end

    raw_conf = file.content
    if raw_conf.empty? && !file.empty?
      return skip_resource("File is empty.\"#{@conf_path}\"")
    end
    inspec.file(conf_path).content.lines
  end
end
