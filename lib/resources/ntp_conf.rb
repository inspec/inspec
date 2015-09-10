# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'utils/simpleconfig'

# Usage:
#
# describe ntp_conf do
#   its('server') { should_not eq nil }
#   its('restrict') { should include '-4 default kod notrap nomodify nopeer noquery'}
# end

class NtpConf < Vulcano.resource(1)
  name 'ntp_conf'

  def initialize(path = nil)
    @conf_path = path || '/etc/ntp.conf'
    @files_contents = {}
    @content = nil
    @params = nil
    read_content
  end

  def to_s
    'ntp_conf'
  end

  def method_missing(name)
    @params || read_content
    param = @params[name.to_s]
    # extract first value if we have only one value in array
    param = param[0] if !param.nil? && param.length == 1
    param
  end

  def read_content
    # read the file
    if !vulcano.file(@conf_path).file?
      return skip_resource "Can't find file \"#{@conf_path}\""
    end
    @content = vulcano.file(@conf_path).content
    if @content.empty? && vulcano.file(@conf_path).size > 0
      return skip_resource "Can't read file \"#{@conf_path}\""
    end
    # parse the file
    @params = SimpleConfig.new(
      @content,
      assignment_re: /^\s*(\S+)\s+(.*)\s*$/,
      multiple_values: true,
    ).params
    @content
  end
end
