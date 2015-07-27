# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'utils/simpleconfig'

class Glob

  def initialize( path )
    @runner = Specinfra::Runner
    @command_result ||= @runner.run_command("ls -1 #{path}")
    @content = @command_result.stdout
    @exit_status = @command_result.exit_status.to_i
  end

  def files
    if @exit_status != 0 then
      return []
    else
      split = @content.split("\n")
      return split
    end
  end

end

class ApacheConf

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

  def filter_comments data
    contents = ""
    data.each_line do |line|
      if (!line.match(/^\s*#/)) then
        contents << line
      end
    end
    return contents
  end

  def read_content
    @content = ""
    @params = {}
    to_read = [@conf_path]
    while !to_read.empty?
      raw_conf = read_file(to_read[0])
      @content += raw_conf

      # parse include file parameters
      params = SimpleConfig.new(raw_conf,
        assignment_re: /^\s*(\S+)\s+(.*)\s*$/,
        multiple_values: true
      ).params
      @params.merge!(params)

      to_read = to_read.drop(1)
      # see if there is more config files to include
      include_files = params['Include'] || []
      include_files_optional = params['IncludeOptional'] || []

      required = Array.new
      include_files.each do |f|
        id = File.join(@conf_dir, f)
        required.push(Glob.new(id).files)
      end

      required.flatten!
      to_read += required.find_all do |fp|
        not @files_contents.key? fp
      end

      optional = Array.new
      include_files_optional.each do |f|
        id = File.join(@conf_dir, f)
        optional.push(Glob.new(id).files)
      end

      optional.flatten!
      to_read += optional.find_all do |fp|
        not @files_contents.key? fp
      end
    end

    # fiter comments
    @content = filter_comments @content

    @content
  end

  def read_file(path)
    @files_contents[path] ||= @runner.get_file_content(path).stdout
  end
end
