# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

require 'utils/simpleconfig'

# Usage:
#
# describe login_def do
#   its('UMASK') {
#     should eq '077'
#   }
#
#   its('PASS_MAX_DAYS.to_i') {
#     should be <= 90
#   }
# end

module Inspec::Resources
  class LoginDef < Inspec.resource(1)
    name 'login_defs'
    desc 'Use the login_defs InSpec audit resource to test configuration settings in the /etc/login.defs file. The logins.defs file defines site-specific configuration for the shadow password suite on Linux and UNIX platforms, such as password expiration ranges, minimum/maximum values for automatic selection of user and group identifiers, or the method with which passwords are encrypted.'
    example "
      describe login_defs do
        its('ENCRYPT_METHOD') { should eq 'SHA512' }
      end
    "

    def initialize(path = nil)
      @conf_path = path || '/etc/login.defs'
    end

    def method_missing(name)
      read_params[name.to_s]
    end

    def read_params
      return @params if defined?(@params)

      # read the file
      file = inspec.file(@conf_path)
      if !file.file?
        skip_resource "Can't find file \"#{@conf_path}\""
        return @params = {}
      end

      content = file.content
      if content.empty? && !file.empty?
        skip_resource "Can't read file \"#{@conf_path}\""
        return @params = {}
      end

      # parse the file
      conf = SimpleConfig.new(
        content,
        assignment_regex: /^\s*(\S+)\s+(\S*)\s*$/,
        multiple_values: false,
      )
      @params = conf.params
    end

    def to_s
      'login.defs'
    end
  end
end
