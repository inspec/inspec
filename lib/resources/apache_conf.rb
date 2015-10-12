# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

require 'utils/simpleconfig'
require 'utils/find_files'

class ApacheConf < Vulcano.resource(1)
  name 'apache_conf'

  include FindFiles

  def initialize(conf_path)
    @conf_path = conf_path
    @conf_dir = File.dirname(@conf_path)
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
    res
  end

  def filter_comments(data)
    content = ''
    data.each_line do |line|
      if !line.match(/^\s*#/)
        content << line
      end
    end
    content
  end

  def read_content
    @content = ''
    @params = {}

    # skip if the main configuration file doesn't exist
    file = vulcano.file(@conf_path)
    if !file.file?
      return skip_resource "Can't find file \"#{@conf_path}\""
    end

    raw_conf = file.content
    if raw_conf.empty? && file.size > 0
      return skip_resource("Can't read file \"#{@conf_path}\"")
    end

    to_read = [@conf_path]
    until to_read.empty?
      raw_conf = read_file(to_read[0])
      @content += raw_conf

      # parse include file parameters
      params = SimpleConfig.new(
        raw_conf,
        assignment_re: /^\s*(\S+)\s+(.*)\s*$/,
        multiple_values: true,
      ).params
      @params.merge!(params)

      to_read = to_read.drop(1)
      to_read += include_files(params).find_all do |fp|
        not @files_contents.key? fp
      end
    end

    # fiter comments
    @content = filter_comments @content
    @content
  end

  def include_files(params)
    # see if there is more config files to include
    include_files = params['Include'] || []
    include_files_optional = params['IncludeOptional'] || []

    required = []
    include_files.each do |f|
      id = File.join(@conf_dir, f)
      required.push(find_files(id, depth: 1, type: 'file'))
    end

    optional = []
    include_files_optional.each do |f|
      id = File.join(@conf_dir, f)
      optional.push(find_files(id, depth: 1, type: 'file'))
    end

    required.flatten! + optional.flatten!
  end

  def read_file(path)
    @files_contents[path] ||= vulcano.file(path).content
  end

  def to_s
    "Apache Config #{@conf_path}"
  end
end
