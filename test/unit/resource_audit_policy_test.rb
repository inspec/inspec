# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::AuditPolicy' do
  describe 'audit_policy' do
    let(:resource) { loadResource('audit_policy') }

    it 'check audit policy parsing' do
      _(resource.send('User Account Management')).must_equal 'Success'
    end
  end
end
