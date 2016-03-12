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
      @filters = ''
      @contents = {}
    end

    def to_s
      "Xinetd config #{@conf_path}#{@filters}"
    end

    def params
      @params ||= read_params
    end

    extend Inspec::Filter
    add_filter 'service'
    add_filter 'id'
    add_filter 'socket_type'
    add_filter 'type'
    add_filter 'wait'

    def disabled?
      where({ 'disable' => 'no' }).services.empty?
    end

    def enabled?
      where({ 'disable' => 'yes' }).services.empty?
    end

    def where(conditions = {})
      fields, filters = Inspec::Filter.where(service_lines, conditions)
      res = clone
      res.instance_variable_set(:@filters, @filters + filters)
      res.instance_variable_set(:@services, fields)
      res
    end

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

    def get_fields(*fields)
      res = service_lines.map do |line|
        fields.map { |f| line[f] }
      end.flatten
      return res unless fields == ['service']
      res.uniq
    end
  end
end
