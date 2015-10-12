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

class LoginDef < Vulcano.resource(1)
  name 'login_defs'

  def initialize(path = nil)
    @conf_path = path || '/etc/login.defs'
  end

  def method_missing(name)
    read_params[name.to_s]
  end

  def read_params
    return @params if defined?(@params)

    # read the file
    file = vulcano.file(@conf_path)
    if !file.file?
      skip_resource "Can't find file \"#{@conf_path}\""
      return @params = {}
    end

    content = file.content
    if content.empty? && file.size > 0
      skip_resource "Can't read file \"#{@conf_path}\""
      return @params = {}
    end

    # parse the file
    conf = SimpleConfig.new(
      content,
      assignment_re: /^\s*(\S+)\s+(\S*)\s*$/,
      multiple_values: false,
    )
    @params = conf.params
  end

  def to_s
    'login.defs'
  end
end
