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

    filter = FilterTable.create(self, :service_lines)
    filter.add_delegator(:where)
          .add(:services,     field: 'service')
          .add(:ids,          field: 'id')
          .add(:socket_types, field: 'socket_type')
          .add(:types,        field: 'type')
          .add(:wait,         field: 'wait')
          .add(:disabled?) { |x| x.where('disable' => 'no').services.empty? }
          .add(:enabled?) { |x| x.where('disable' => 'yes').services.empty? }

    private

    def read_content(path = @conf_path)
      return @contents[path] if @contents.key?(path)
      file = inspec.file(path)
      if !file.file?
        return skip_resource "Can't find file \"#{path}\""
      end

      @contents[path] = file.content
      if @contents[path].empty? && file.size > 0
        return skip_resource "Can't read file \"#{path}\""
      end

      @contents[path]
    end

    def read_params
      return {} if read_content.nil?
      flat_params = parse_xinetd(read_content)
      params = { 'services' => {} }

      # parse services that were defined:
      flat_params.each do |k, v|
        name = k[/^service (.+)$/, 1]
        if name.nil?
          params[k] = v
        else
          params['services'][name] = v
          # add the service identifier to its parameters
          v.each { |service| service.params['service'] = name }
        end
      end
      params
    end

    def service_lines
      @services ||= params['services'].values.flatten.map(&:params)
    end
  end
end
