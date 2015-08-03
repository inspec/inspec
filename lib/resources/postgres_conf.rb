# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'utils/simpleconfig'
require 'utils/find_files'
require 'resources/postgres'

class PostgresConf

  def initialize( conf_path )
    @runner = Specinfra::Runner
    @conf_path = conf_path
    @conf_dir = File.expand_path(File.dirname @conf_path)
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
    res
  end

  def read_content
    @content = ""
    @params = {}

    # skip if the main configuration file doesn't exist
    if !@runner.check_file_is_file(@conf_path)
      return skip_resource "Can't find file \"#{@conf_path}\""
    end
    raw_conf = read_file(@conf_path)
    if raw_conf.empty? && @runner.get_file_size(@conf_path).stdout.strip.to_i > 0
      return skip_resource("Can't read file \"#{@conf_path}\"")
    end

    to_read = [@conf_path]
    while !to_read.empty?
      raw_conf = read_file(to_read[0])
      @content += raw_conf

      params = SimpleConfig.new(raw_conf).params
      @params.merge!(params)

      to_read = to_read.drop(1)
      # see if there is more config files to include
      include_files = params['include'] || []
      include_files += params['include_if_exists'] || []
      dirs = params['include_dir'] || []
      dirs.each do |dir|
        dir = File.join(@conf_dir, dir) if dir[0] != '/'
        include_files += FindFiles.find(dir, depth: 1, type: 'file')
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
  def postgres_conf(path = nil)
    @postgres_conf ||= {}
    dpath = path || postgres.conf_path
    @postgres_conf[dpath] ||= PostgresConf.new( dpath )
  end
end