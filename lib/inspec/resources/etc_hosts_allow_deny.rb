
require 'inspec/utils/parser'
require 'inspec/utils/file_reader'

module Inspec::Resources
  class EtcHostsAllow < Inspec.resource(1)
    name 'etc_hosts_allow'
    supports platform: 'unix'
    desc 'Use the etc_hosts_allow InSpec audit resource to test the connections
          the client will allow. Controlled by the /etc/hosts.allow file.'
    example <<~EXAMPLE
      describe etc_hosts_allow.where { daemon == 'ALL' } do
        its('client_list') { should include ['127.0.0.1', '[::1]'] }
        its('options') { should eq [[]] }
      end
    EXAMPLE

    attr_reader :params

    include CommentParser
    include FileReader

    def initialize(hosts_allow_path = nil)
      @conf_path      = hosts_allow_path || '/etc/hosts.allow'
      @content        = nil
      @params         = nil
      read_content
    end

    filter = FilterTable.create
    filter.register_column(:daemon,      field: 'daemon')
          .register_column(:client_list, field: 'client_list')
          .register_column(:options,     field: 'options')

    filter.install_filter_methods_on_resource(self, :params)

    private

    def read_content
      @content = ''
      @params  = {}
      @content = split_daemons(read_file(@conf_path))
      @params  = parse_conf(@content)
    end

    def split_daemons(content)
      split_daemons_list = []
      content.each do |line|
        data, = parse_comment_line(line, comment_char: '#', standalone_comments: false)
        next unless data != ''
        data.split(':')[0].split(',').each do |daemon|
          split_daemons_list.push("#{daemon} : " + line.split(':', 2)[1])
        end
      end
      split_daemons_list
    end

    def parse_conf(content)
      content.map do |line|
        data, = parse_comment_line(line, comment_char: '#', standalone_comments: false)
        parse_line(data) unless data == ''
      end.compact
    end

    def parse_line(line)
      daemon, clients_and_options = line.split(/:\s+/, 2)
      daemon = daemon.strip

      clients_and_options ||= ''
      clients, options = clients_and_options.split(/\s+:\s+/, 2)
      client_list = clients.split(/,/).map(&:strip)

      options ||= ''
      options_list = options.split(/:\s+/).map(&:strip)

      {
        'daemon'      => daemon,
        'client_list' => client_list,
        'options'     => options_list,
      }
    end

    def read_file(conf_path = @conf_path)
      read_file_content(conf_path).lines
    end
  end

  class EtcHostsDeny < EtcHostsAllow
    name 'etc_hosts_deny'
    supports platform: 'unix'
    desc 'Use the etc_hosts_deny InSpec audit resource to test the connections
          the client will deny. Controlled by the /etc/hosts.deny file.'
    example <<~EXAMPLE
      describe etc_hosts_deny.where { daemon_list == 'ALL' } do
        its('client_list') { should eq [['127.0.0.1', '[::1]']] }
        its('options') { should eq [] }
      end
    EXAMPLE

    def initialize(path = nil)
      return skip_resource '`etc_hosts_deny` is not supported on your OS' unless inspec.os.linux?
      super(path || '/etc/hosts.deny')
    end

    def to_s
      'hosts.deny Configuration'
    end
  end
end
