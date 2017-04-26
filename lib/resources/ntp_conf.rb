# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

require 'utils/simpleconfig'

module Inspec::Resources
  class NtpConf < Inspec.resource(1)
    name 'ntp_conf'
    desc 'Use the ntp_conf InSpec audit resource to test the synchronization settings defined in the ntp.conf file. This file is typically located at /etc/ntp.conf.'
    example "
      describe ntp_conf do
        its('server') { should_not eq nil }
        its('restrict') { should include '-4 default kod notrap nomodify nopeer noquery'}
      end
    "

    def initialize(path = nil)
      @conf_path = path || '/etc/ntp.conf'
    end

    def method_missing(name)
      param = read_params[name.to_s]
      # extract first value if we have only one value in array
      return param[0] if param.is_a?(Array) and param.length == 1
      param
    end

    def to_s
      'ntp.conf'
    end

    private

    def read_params
      return @params if defined?(@params)

      if !inspec.file(@conf_path).file?
        skip_resource "Can't find file \"#{@conf_path}\""
        return @params = {}
      end

      content = inspec.file(@conf_path).content
      if content.empty? && !inspec.file(@conf_path).empty?
        skip_resource "Can't read file \"#{@conf_path}\""
        return @params = {}
      end

      # parse the file
      conf = SimpleConfig.new(
        content,
        assignment_regex: /^\s*(\S+)\s+(.*)\s*$/,
        multiple_values: true,
      )
      @params = conf.params
    end
  end
end
