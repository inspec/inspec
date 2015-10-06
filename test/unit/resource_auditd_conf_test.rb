# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::AuditDaemonConf' do
  let(:resource) { load_resource('audit_daemon_conf') }

  it 'check audit daemon config parsing' do
    _(resource.space_left_action).must_equal 'SYSLOG'
    _(resource.action_mail_acct).must_equal 'root'
    _(resource.tcp_listen_queue).must_equal '5'
  end
end
