# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'utils/simpleconfig'

# Usage:
# describe audit_daemon_conf do
#   its("space_left_action") { should eq "email" }
#   its("action_mail_acct") { should eq "root" }
#   its("admin_space_left_action") { should eq "halt" }
# end

class AuditDaemonConf < Vulcano.resource(1)
  name 'audit_daemon_conf'

  def initialize
    @conf_path = '/etc/audit/auditd.conf'
    @files_contents = {}
    @content = nil
    @params = nil
    read_content
  end

  def to_s
    'audit daemon configuration file'
  end

  def method_missing(name)
    @params || read_content
    @params.nil? ? nil : @params[name.to_s]
  end

  def read_content
    # read the file
    file = vulcano.file(@conf_path)
    if !file.file?
      return skip_resource "Can't find file '#{@conf_path}'"
    end

    @content = file.content
    if @content.empty? && file.size > 0
      return skip_resource "Can't read file '#{@conf_path}'"
    end
    # parse the file
    @params = SimpleConfig.new(
      @content,
      multiple_values: false,
    ).params
  end
end
