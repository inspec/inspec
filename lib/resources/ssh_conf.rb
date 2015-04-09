# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

require 'utils/simpleconfig'

class SshConf

  def initialize( conf_path, type = nil )
    @runner = Specinfra::Runner
    @conf_path = conf_path
    @conf_dir = File.expand_path(File.dirname @conf_path)
    @files_contents = {}
    @content = nil
    @params = nil
    typename = ( conf_path.include?('sshd') ? 'server' : 'client' )
    @type = type || "SSH #{typename} configuration"
    read_content
  end

  def to_s
    @type
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

  def method_missing name
    @params || read_content
    @params[name.to_s]
  end

  def read_content
    @content = read_file(@conf_path)
    @params = SimpleConfig.new(@content, assignment_re: /^\s*(\S+?)\s+(.*?)\s*$/).params
    @content
  end

  def read_file(path)
    @files_contents[path] ||= @runner.get_file_content(path).stdout
  end
end

