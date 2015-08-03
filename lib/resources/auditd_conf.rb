# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'utils/simpleconfig'

class AuditDaemonConf < Vulcano::Resource

  def initialize
    @runner = Specinfra::Runner
    @conf_path = '/etc/audit/auditd.conf'
    @files_contents = {}
    @content = nil
    @params = nil
    read_content
  end

  def to_s
    "audit daemon configuration file"
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
      multiple_values: false
    ).params
    @content
  end

  def read_file(path)
    @files_contents[path] ||= @runner.get_file_content(path).stdout
  end
end

module Serverspec::Type
  def audit_daemon_conf()
    AuditDaemonConf.new()
  end
end