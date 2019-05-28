
require 'inspec/utils/parser'
require 'inspec/utils/file_reader'

class EtcHosts < Inspec.resource(1)
  name 'etc_hosts'
  supports platform: 'linux'
  supports platform: 'bsd'
  supports platform: 'windows'
  desc 'Use the etc_hosts InSpec audit resource to find an
    ip_address and its associated hosts'
  example <<~EXAMPLE
    describe etc_hosts.where { ip_address == '127.0.0.1' } do
      its('ip_address') { should cmp '127.0.0.1' }
      its('primary_name') { should cmp 'localhost' }
      its('all_host_names') { should eq [['localhost', 'localhost.localdomain', 'localhost4', 'localhost4.localdomain4']] }
    end
  EXAMPLE

  attr_reader :params

  include CommentParser
  include FileReader

  DEFAULT_UNIX_PATH    = '/etc/hosts'.freeze
  DEFAULT_WINDOWS_PATH = 'C:\windows\system32\drivers\etc\hosts'.freeze

  def initialize(hosts_path = nil)
    content = read_file_content(hosts_path || default_hosts_file_path)

    @params = parse_conf(content.lines)
  end

  FilterTable.create
             .register_column(:ip_address,     field: 'ip_address')
             .register_column(:primary_name,   field: 'primary_name')
             .register_column(:all_host_names, field: 'all_host_names')
             .install_filter_methods_on_resource(self, :params)

  private

  def default_hosts_file_path
    inspec.os.windows? ? DEFAULT_WINDOWS_PATH : DEFAULT_UNIX_PATH
  end

  def parse_conf(lines)
    lines.reject(&:empty?).reject(&comment?).map(&parse_data).map(&format_data)
  end

  def comment?
    parse_options = { comment_char: '#', standalone_comments: false }

    ->(data) { parse_comment_line(data, parse_options).first.empty? }
  end

  def parse_data
    ->(data) { [data.split[0], data.split[1], data.split[1..-1]] }
  end

  def format_data
    ->(data) { %w{ip_address primary_name all_host_names}.zip(data).to_h }
  end
end
