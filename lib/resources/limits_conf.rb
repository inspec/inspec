# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'utils/simpleconfig'

class LimitsConf < Vulcano.resource(1)
  name 'limits_conf'

  def initialize(path)
    @conf_path = path
    @files_contents = {}
    @content = nil
    @params = nil
    read_content
  end

  def to_s
    "limits_conf"
  end

  def method_missing name
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
    @params = SimpleConfig.new(@content,
      assignment_re: /^\s*(\S+?)\s+(.*?)\s+(.*?)\s+(.*?)\s*$/,
      key_vals: 3,
      multiple_values: true
    ).params
    @content
  end

end
