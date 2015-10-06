# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::LoginDef' do
  let(:resource) { load_resource('login_defs') }

  it 'verify login.def config parsing' do
    _(resource.UMASK).must_equal '022'
    _(resource.PASS_MIN_DAYS).must_equal '0'
    _(resource.PASS_WARN_AGE).must_equal '7'
    _(resource.USERDEL_CMD).must_equal nil
  end
end
