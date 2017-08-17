require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::PamPwqualityTest' do
  resourceDef = load_resource('pam_pwquality')
  resourcePathInc = load_resource('pam_pwquality', '/etc/pam.d/passwd')
  it 'verify pam_pwquality resource can detect if it is enabled in a file' do
    _(resourceDef.enabled?).must_equal true
    _(resourcePathInc.enabled?).must_equal true
  end

  it 'verify pam_pwquality resource can detect the arguments given where pam_pwquality.so is declared in a file' do
    _(resourceDef.arguments).must_equal ['try_first_pass', 'local_users_only', 'retry=3', 'authtok_type=']
    _(resourcePathInc.arguments).must_equal ['try_first_pass', 'local_users_only', 'retry=3', 'authtok_type=']
  end
end
