# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'utils/parseconfig'
require 'resources/mysql'

class MysqlConfEntry
  def initialize( path, params )
    @runner = Specinfra::Runner
    @params = params
    @path = path
  end
  def method_missing name, *args
    k = name.to_s
    res = @params[k]
    return true if res.nil? && @params.key?(k)
    @params[k]
  end
  def to_s
    group = ' '
    group = "[#{@path.join('][')}] " unless @path.nil? or @path.empty?
    "MySQL Config entry [#{@path.join(' ')}]"
  end
end

class MysqlConf < Vulcano::Resource

  def initialize( conf_path )
    @runner = Specinfra::Runner
    @conf_path = conf_path
    @files_contents = {}
    @content = nil
    @params = nil
    read_content
  end

  def content
    @content ||= read_content
  end

  def params *opts
    @params || read_content
    res = @params
    opts.each do |opt|
      res = res[opt] unless res.nil?
    end
    MysqlConfEntry.new(opts, res)
  end

  def method_missing name
    @params || read_content
    @params[name.to_s]
  end

  def read_content
    @content = ""
    @params = {}
    to_read = [@conf_path]
    while !to_read.empty?
      if !@runner.check_file_is_file(to_read[0])
        return skip_resource("Can't find file \"#{to_read[0]}\"")
      end
      raw_conf = read_file(to_read[0])
      if raw_conf.empty? && @runner.get_file_size(to_read[0]).stdout.strip.to_i > 0
        return skip_resource("Can't read file \"#{to_read[0]}\"")
      end
      @content += raw_conf

      params = ParseConfig.new(raw_conf).params
      @params.merge!(params)

      to_read = to_read.drop(1)
      # see if there is more stuff to include
      include_files = raw_conf.scan(/^!include\s+(.*)\s*/).flatten.compact
      include_dirs = raw_conf.scan(/^!includedir\s+(.*)\s*/).flatten.compact
      include_dirs.map do |include_dir|
        include_files += Dir.glob(File.join include_dir, '*')
      end
      to_read += include_files.find_all do |fp|
        not @files_contents.key? fp
      end
    end
    #
    @content
  end

  def read_file(path)
    @files_contents[path] ||= @runner.get_file_content(path).stdout
  end
end

module Serverspec::Type
  def mysql_conf(path = nil)
    @mysql_conf ||= {}
    dpath = path || mysql.conf_path
    @mysql_conf[dpath] ||= MysqlConf.new( dpath )
  end
end