# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'utils/parseconfig'
require 'utils/find_files'
require 'resources/mysql'

class MysqlConfEntry
  def initialize(path, params)
    @params = params
    @path = path
  end

  def method_missing(name, *_)
    k = name.to_s
    res = @params[k]
    return true if res.nil? && @params.key?(k)
    @params[k]
  end

  def to_s
    "MySQL Config entry [#{@path.join(' ')}]"
  end
end

class MysqlConf < Vulcano.resource(1)
  name 'mysql_conf'

  def initialize(conf_path)
    @conf_path = conf_path
    @files_contents = {}
    @content = nil
    @params = nil
    read_content
  end

  def content
    @content ||= read_content
  end

  def params(*opts)
    @params || read_content
    res = @params
    opts.each do |opt|
      res = res[opt] unless res.nil?
    end
    MysqlConfEntry.new(opts, res)
  end

  def method_missing(name)
    @params || read_content
    @params[name.to_s]
  end

  def read_content
    @content = ''
    @params = {}

    # skip if the main configuration file doesn't exist
    if !vulcano.file(@conf_path).file?
      return skip_resource "Can't find file \"#{@conf_path}\""
    end
    raw_conf = read_file(@conf_path)
    if raw_conf.empty? && vulcano.file(@conf_path).size > 0
      return skip_resource("Can't read file \"#{@conf_path}\"")
    end

    to_read = [@conf_path]
    until to_read.empty?
      raw_conf = read_file(to_read[0])
      @content += raw_conf

      params = ParseConfig.new(raw_conf).params
      @params.merge!(params)

      to_read = to_read.drop(1)
      # see if there is more stuff to include

      to_read += include_files(conf).find_all do |fp|
        not @files_contents.key? fp
      end
    end
    #
    @content
  end

  def include_files(conf)
    files = conf.scan(/^!include\s+(.*)\s*/).flatten.compact
    dirs = conf.scan(/^!includedir\s+(.*)\s*/).flatten.compact
    dirs.map do |dir|
      # @TODO: non local glob
      files += FindFiles.find(dir, depth: 1, type: 'file')
    end
    files
  end

  def read_file(path)
    @files_contents[path] ||= vulcano.file(path).content
  end
end
