
require 'helper'
require 'inspec/resource'
require 'inspec/resources/audit_policy'

describe 'Inspec::Resources::AuditPolicy' do
  it 'check audit policy parsing' do
    resource = MockLoader.new(:windows).load_resource('audit_policy')
    _(resource.send('User Account Management')).must_equal 'Success'
  end
end
