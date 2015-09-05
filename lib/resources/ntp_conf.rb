# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'utils/simpleconfig'

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
    @params[name.to_s]
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
      multiple_values: true
    ).params
    @content
  end
end
