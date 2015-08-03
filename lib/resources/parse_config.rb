# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

# Usage example:
#
#  audit = command('/sbin/auditctl -l').stdout
#  options = {
#    assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
#    multiple_values: true
#  }
#  describe parse_config(audit, options ) do

class PConfig < Vulcano::Resource

  def initialize ( content=nil, useropts = {} )
    
    default_options = {}
    @opts = default_options.merge(useropts)
    @runner = Specinfra::Runner
    @content = content
    @files_contents = {}
    @params = nil

    if @content != nil then
      read_content
    end
  end

  def to_s
    "parse_config #{@conf_path}"
  end

  def method_missing name
    @params || read_content
    @params[name.to_s]
  end

  def parse_file conf_path
    @conf_path = conf_path

    # read the file
    if !@runner.check_file_is_file(conf_path)
      return skip_resource "Can't find file \"#{conf_path}\""
    end
    @content = read_file(conf_path)
    if @content.empty? && @runner.get_file_size(conf_path).stdout.strip.to_i > 0
      return skip_resource "Can't read file \"#{conf_path}\""
    end

    read_content
  end

  def read_file(path)
    @files_contents[path] ||= @runner.get_file_content(path).stdout
  end

  def read_content
    # parse the file
    @params = SimpleConfig.new(@content, @opts).params
    @content
  end
end

module Serverspec::Type
  def parse_config(content, opts={})
    PConfig.new(content, opts)
  end

  def parse_config_file(file, opts={})
    p = PConfig.new(nil, opts)
    p.parse_file(file)
    p
  end
end
