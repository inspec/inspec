# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

require 'utils/simpleconfig'
require 'utils/find_files'

module Inspec::Resources
  class ApacheConf < Inspec.resource(1)
    name 'apache_conf'
    desc 'Use the apache_conf InSpec audit resource to test the configuration settings for Apache. This file is typically located under /etc/apache2 on the Debian and Ubuntu platforms and under /etc/httpd on the Fedora, CentOS, Red Hat Enterprise Linux, and Arch Linux platforms. The configuration settings may vary significantly from platform to platform.'
    example "
      describe apache_conf do
        its('setting_name') { should eq 'value' }
      end
    "

    include FindFiles

    def initialize(conf_path = nil)
      @conf_path = conf_path || inspec.apache.conf_path
      @conf_dir = conf_path ? File.dirname(@conf_path) : inspec.apache.conf_dir
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

    def method_missing(name)
      # ensure params are loaded
      @params || read_content

      # extract values
      @params[name.to_s] unless @params.nil?
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
      file = inspec.file(@conf_path)
      if !file.file?
        return skip_resource "Can't find file \"#{@conf_path}\""
      end

      raw_conf = file.content
      if raw_conf.empty? && !file.empty?
        return skip_resource("Can't read file \"#{@conf_path}\"")
      end

      to_read = [@conf_path]
      until to_read.empty?
        raw_conf = read_file(to_read[0])
        @content += raw_conf

        # parse include file parameters
        params = SimpleConfig.new(
          raw_conf,
          assignment_regex: /^\s*(\S+)\s+(.*)\s*$/,
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

      includes = []
      (include_files + include_files_optional).each do |f|
        id    = Pathname.new(f).absolute? ? f : File.join(@conf_dir, f)
        files = find_files(id, depth: 1, type: 'file')
        files += find_files(id, depth: 1, type: 'link')

        includes.push(files) if files
      end

      # [].flatten! == nil
      includes.flatten! || []
    end

    def read_file(path)
      @files_contents[path] ||= inspec.file(path).content
    end

    def to_s
      "Apache Config #{@conf_path}"
    end
  end
end
