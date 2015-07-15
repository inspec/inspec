# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'utils/simpleconfig'

class SshConf < Vulcano::Resource

  def initialize( conf_path, type = nil )
    @runner = Specinfra::Runner
    @conf_path = conf_path
    @conf_dir = File.expand_path(File.dirname @conf_path)
    @files_contents = {}
    @content = nil
    @params = nil
    typename = ( conf_path.include?('sshd') ? 'Server' : 'Client' )
    @type = type || "SSH #{typename} configuration #{conf_path}"
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
    # read the file
    if !@runner.check_file_is_file(@conf_path)
      return skip_resource "Can't find file \"#{@conf_path}\""
    end
    @content = read_file(@conf_path)
    if @content.empty? && @runner.get_file_size(@conf_path).stdout.strip.to_i > 0
      return skip_resource "Can't read file \"#{@conf_path}\""
    end
    # parse the file
    @params = SimpleConfig.new(@content,
      assignment_re: /^\s*(\S+?)\s+(.*?)\s*$/,
      multiple_values: false
    ).params
    @content
  end

  def read_file(path)
    @files_contents[path] ||= @runner.get_file_content(path).stdout
  end
end

module Serverspec
  module Type
    def conf_ssh()
      SshConf.new('/etc/ssh/ssh_config')
    end

    def conf_sshd()
      SshConf.new('/etc/ssh/sshd_config')
    end
  end
end
