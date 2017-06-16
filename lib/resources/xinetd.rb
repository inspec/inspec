# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'utils/parser'
require 'utils/filter'

module Inspec::Resources
  class XinetdConf < Inspec.resource(1)
    name 'xinetd_conf'
    desc 'Xinetd services configuration.'
    example "
      describe xinetd_conf.services('chargen') do
        its('socket_types') { should include 'dgram' }
      end

      describe xinetd_conf.services('chargen').socket_types('dgram') do
        it { should be_disabled }
      end
    "

    include XinetdParser

    def initialize(conf_path = '/etc/xinetd.conf')
      @conf_path = conf_path
      @contents = {}
    end

    def to_s
      "Xinetd config #{@conf_path}#{@filters}"
    end

    def params
      @params ||= read_params
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:services,     field: 'service')
          .add(:ids,          field: 'id')
          .add(:socket_types, field: 'socket_type')
          .add(:types,        field: 'type')
          .add(:protocols,    field: 'protocol')
          .add(:wait,         field: 'wait')
          .add(:disabled?) { |x| x.where('disable' => 'no').services.empty? }
          .add(:enabled?) { |x| x.where('disable' => 'yes').services.empty? }
          .connect(self, :service_lines)

    private

    def read_content(path = @conf_path)
      return @contents[path] if @contents.key?(path)
      file = inspec.file(path)
      if !file.file?
        return skip_resource "Can't find file \"#{path}\""
      end

      @contents[path] = file.content
      if @contents[path].nil? || @contents[path].empty?
        return skip_resource "Can't read file \"#{path}\""
      end

      @contents[path]
    end

    def read_params
      return {} if read_content.nil?
      flat_params = parse_xinetd(read_content)
      # we need to map service data in order to use it with filtertable
      params = { 'services' => {} }

      # map services that were defined and map it to the service hash
      flat_params.each do |k, v|
        name = k[/^service (.+)$/, 1]
        # its not a service, no change required
        if name.nil?
          params[k] = v
        # handle service entries
        else
          # store service
          params['services'][name] = v

          # add the service identifier to its parameters
          if v.is_a?(Array)
            v.each { |service| service.params['service'] = name }
          else
            v.params['service'] = name
          end
        end
      end
      params
    end

    # Method used to derive the default protocol used from the socket_type
    def default_protocol(type)
      case type
      when 'stream'
        'tcp'
      when 'dgram'
        'udp'
      else
        'unknown'
      end
    end

    def service_lines
      @services ||= params['services'].values.flatten.map { |service|
        service.params['protocol'] ||= default_protocol(service.params['socket_type'])
        service.params
      }
    end
  end
end
