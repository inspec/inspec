# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
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

  def initialize(path = nil)
    @conf_path = path || '/etc/audit/auditd.conf'
  end

  def to_s
    'audit daemon configuration file'
  end

  def method_missing(name)
    read_params[name.to_s]
  end

  private

  def read_params
    return @params if defined?(@params)

    # read the file
    file = vulcano.file(@conf_path)
    if !file.file?
      skip_resource "Can't find file '#{@conf_path}'"
      return @params = {}
    end

    content = file.content
    if content.empty? && file.size > 0
      skip_resource "Can't read file '#{@conf_path}'"
      return @params = {}
    end

    # parse the file
    conf = SimpleConfig.new(
      content,
      multiple_values: false,
    )
    @params = conf.params
  end
end
