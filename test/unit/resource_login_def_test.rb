# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::LoginDef' do
  describe 'login_defs' do
    let(:resource) { loadResource('login_defs') }

    it 'verify login.def config parsing' do
      _(resource.UMASK).must_equal '022'
      _(resource.PASS_MIN_DAYS).must_equal '0'
      _(resource.PASS_WARN_AGE).must_equal '7'
      _(resource.USERDEL_CMD).must_equal nil
    end
  end
end
