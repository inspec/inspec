# encoding: utf-8
# author: Matthew Dromazos

require 'utils/parser'

module Inspec::Resources
  class EtcHostsAllow < Inspec.resource(1)
    name 'etc_hosts_allow'
    desc 'Use the etc_hosts_allow InSpec audit resource to test the connections
          the client will allow. Controlled by the /etc/hosts.allow file.'
    example "
      describe etc_hosts_allow.where { daemon == 'ALL' } do
        its('client_list') { should include ['127.0.0.1', '[::1]'] }
        its('options') { should eq [[]] }
      end
    "

    attr_reader :params

    include CommentParser

    def initialize(hosts_allow_path = nil)
      return skip_resource 'The `etc_hosts_allow` resource is not supported on your OS.' unless inspec.os.linux?
      @conf_path      = hosts_allow_path || '/etc/hosts.allow'
      @content        = nil
      @params         = nil
      read_content
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:daemon,      field: 'daemon')
          .add(:client_list, field: 'client_list')
          .add(:options,     field: 'options')

    filter.connect(self, :params)

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
      # Determine if the file exists and contains anything, if not
      # then access control is turned off.
      file = inspec.file(conf_path)
      if !file.file?
        return skip_resource "Can't find file at \"#{@conf_path}\""
      end
      raw_conf = file.content
      if raw_conf.empty? && !file.empty?
        return skip_resource("Unable to read file \"#{@conf_path}\"")
      end

      # If there is a file and it contains content, continue
      raw_conf.lines
    end
  end

  class EtcHostsDeny < EtcHostsAllow
    name 'etc_hosts_deny'
    desc 'Use the etc_hosts_deny InSpec audit resource to test the connections
          the client will deny. Controlled by the /etc/hosts.deny file.'
    example "
      describe etc_hosts_deny.where { daemon_list == 'ALL' } do
        its('client_list') { should eq [['127.0.0.1', '[::1]']] }
        its('options') { should eq [] }
      end
    "

    def initialize(path = nil)
      return skip_resource '`etc_hosts_deny` is not supported on your OS' unless inspec.os.linux?
      super(path || '/etc/hosts.deny')
    end

    def to_s
      'hosts.deny Configuration'
    end
  end
end
