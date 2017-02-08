# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# license: All rights reserved

require 'utils/simpleconfig'
require 'utils/find_files'
require 'utils/hash'
require 'resources/mysql'

module Inspec::Resources
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

  class MysqlConf < Inspec.resource(1)
    name 'mysql_conf'
    desc 'Use the mysql_conf InSpec audit resource to test the contents of the configuration file for MySQL, typically located at /etc/mysql/my.cnf or /etc/my.cnf.'
    example "
      describe mysql_conf('path') do
        its('setting') { should eq 'value' }
      end
    "

    include FindFiles

    def initialize(conf_path = nil)
      @conf_path = conf_path || inspec.mysql.conf_path
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
      if !inspec.file(@conf_path).file?
        return skip_resource "Can't find file \"#{@conf_path}\""
      end
      raw_conf = read_file(@conf_path)
      if raw_conf.empty? && !inspec.file(@conf_path).empty?
        return skip_resource("Can't read file \"#{@conf_path}\"")
      end

      to_read = [@conf_path]
      until to_read.empty?
        cur_file = to_read[0]
        raw_conf = read_file(cur_file)
        @content += raw_conf

        params = SimpleConfig.new(raw_conf).params
        @params = @params.deep_merge(params)

        to_read = to_read.drop(1)
        # see if there is more stuff to include

        dir = File.dirname(cur_file)
        to_read += include_files(dir, raw_conf).find_all do |fp|
          not @files_contents.key? fp
        end
      end
      #
      @content
    end

    def include_files(reldir, conf)
      files = conf.scan(/^!include\s+(.*)\s*/).flatten.compact.map { |x| abs_path(reldir, x) }
      dirs = conf.scan(/^!includedir\s+(.*)\s*/).flatten.compact.map { |x| abs_path(reldir, x) }
      dirs.map do |dir|
        # @TODO: non local glob
        files += find_files(dir, depth: 1, type: 'file')
      end
      files
    end

    def abs_path(dir, f)
      return f if f.start_with? '/'
      File.join(dir, f)
    end

    def read_file(path)
      @files_contents[path] ||= inspec.file(path).content
    end

    def to_s
      'MySQL Configuration'
    end
  end
end
