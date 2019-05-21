
require 'helper'

describe 'Inspec::Resources::AuditPolicy' do
  it 'check audit policy parsing' do
    resource = MockLoader.new(:windows).load_resource('audit_policy')
    _(resource.send('User Account Management')).must_equal 'Success'
  end
end
