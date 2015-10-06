# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::AuditPolicy' do
  let(:resource) { load_resource('audit_policy') }

  it 'check audit policy parsing' do
    _(resource.send('User Account Management')).must_equal 'Success'
  end
end
