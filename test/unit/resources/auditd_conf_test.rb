
require 'helper'

describe 'Inspec::Resources::AuditDaemonConf' do
  it 'check audit daemon config parsing' do
    resource = MockLoader.new(:windows).load_resource('auditd_conf')
    _(resource.space_left_action).must_equal 'SYSLOG'
    _(resource.action_mail_acct).must_equal 'root'
    _(resource.tcp_listen_queue).must_equal '5'
  end
end
