# encoding: utf-8
# author: Matthew Dromazos

require 'utils/parser'
require 'pry'
module Inspec::Resources
  class EtcHostsAllow < Inspec.resource(1)
    name 'etc_hosts_allow'
    desc 'Use the etc_hosts_allow InSpec audit resource to test the connections
          the client will allow. Controlled by the /etc/hosts.allow file.'
    example "
    describe etc_hosts_allow.where { daemon_list == 'ALL' } do
      its('daemon_list') { should eq [['ALL']] }
      its('client_list') { should eq [['127.0.0.1', '[::1]']] }
    end"

    attr_reader :params

    include CommentParser

    def initialize(hosts_allow_path = nil)
      return skip_resource 'The `etc_hosts_allow` resource is not supported on your OS.' unless inspec.os.linux?
      @conf_path      = hosts_allow_path || '/etc/hosts.allow'
      @files_contents = {}
      @content        = nil
      @params         = nil
      read_content
      return skip_resource '`etc_hosts_allow` is not supported on your OS' if inspec.os.windows?
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:daemon_list, field: 'daemon_list')
          .add(:client_list, field: 'client_list')
          .add(:options,     field: 'options')

    filter.connect(self, :params)

    private

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
      client_list = ''
      options = ''

      daemon_list = line.split(':')[0].split(',').collect { |x| x.strip || x }

      # If the line contains an ipv6 address, parse using a different
      # algorithm. ipv6 addresses will containt a '['
      if !line.index('[').nil?

        # Determines if there contains any options in the line
        if line.rindex(':') > line.rindex(']')
          client_list, options = parse_attributes(line, 1)
        else
          client_list, options = parse_attributes(line, 2)
        end
      elsif !line.index(':', line.index(':')+1).nil?
        client_list, options = parse_attributes(line, 3)
      else
        client_list, options = parse_attributes(line, 4)
      end
      {
        'daemon_list' => daemon_list,
        'client_list' => client_list,
        'options'     => options,
      }
    end

    def parse_attributes(line, method)
      case method
      # Line contains ipv6 and options
      when 1
        # First get a substring starting at the beginning and going to the
        # end of the client_list. Then get a substring containing only the client_list
        # Getting the client_list needs to be seperated into two assignments
        # because of how rubys index method works.
        client_list = line[line.index(':') + 1, line.index(':', line.rindex(']'))-line.index(':')-1]
        # Substring starting after the client_address and goes till the end of the string.
        options = line[line.index(':', line.rindex(']'))+1, line.length]
      # Line contains ipv6 and no options
      when 2
        # Substring starting after the first ':' till the end of the string.
        client_list = line[line.index(':')+1, line.length]
        options = ''
      # Line doesnt contain ipv6 and contains options
      when 3
        client_list = line.split(':')[1]
        options = line.split(':')[2..-1]
      # Line doesnt contain ipv6 and doesnt contain options
      when 4
        client_list = line.split(':')[1]
        options = ''
      else
        raise 'No correct method given to parse client_list and options of a line.'
      end
      [client_list.split(',').collect { |x| x.strip || x }, options.split(':').collect { |x| x.strip || x }]
    end

    def read_file(conf_path = @conf_path)
      # Determine if the file exists and contains anything, if not
      # then access control is turned off.
      file = inspec.file(conf_path)
      if !file.file?
        return skip_resource "Can't find file. If this is the correct path,
          access control is turned off.\"#{@conf_path}\""
      end
      raw_conf = file.content
      if raw_conf.empty? && !file.empty?
        return skip_resource("File is empty. If this is the correct file,
          access control is turned off. Path:\"#{@conf_path}\"")
      end

      # If there is a file and it contains content, continue
      inspec.file(conf_path).content.lines
    end
  end
end
