# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
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
    @files_contents = {}
    @content = nil
    @params = nil
    read_content
  end

  def to_s
    'login_def'
  end

  def method_missing(name)
    @params || read_content
    @params[name.to_s]
  end

  def read_content
    # read the file
    file = vulcano.file(@conf_path)
    if !file.file?
      return skip_resource "Can't find file \"#{@conf_path}\""
    end
    @content = file.content
    if @content.empty? && file.size > 0
      return skip_resource "Can't read file \"#{@conf_path}\""
    end
    # parse the file
    @params = SimpleConfig.new(
      @content,
      assignment_re: /^\s*(\S+)\s+(\S*)\s*$/,
      multiple_values: false,
    ).params
    @content
  end
end
