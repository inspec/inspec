require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::LoginDef' do
  it 'verify login.def config parsing' do
    resource = load_resource('login_defs')
    _(resource.UMASK).must_equal '022'
    _(resource.PASS_MIN_DAYS).must_equal '0'
    _(resource.PASS_WARN_AGE).must_equal '7'
    _(resource.USERDEL_CMD).must_be_nil
  end
end
