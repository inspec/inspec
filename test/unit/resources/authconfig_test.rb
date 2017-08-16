# encoding: utf-8
# author: Matthew Dromazos

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::AuthConfig' do
  resource = load_resource('authconfig')
  centResource = MockLoader.new(:centos7).load_resource('authconfig')
  it 'Verify authconfig can detect all fields in its conf file' do
    _(resource.CACHECREDENTIALS).must_equal 'yes'
    _(resource.FORCELEGACY).must_equal 'no'
    _(resource.FORCESMARTCARD).must_equal 'no'
    _(resource.IPADOMAINJOINED).must_equal 'no'
    _(resource.IPAV2NONTP).must_equal 'no'
    _(resource.PASSWDALGORITHM).must_equal 'sha512'
    _(resource.USEDB).must_equal 'no'
    _(resource.USEECRYPTFS).must_equal 'no'
    _(resource.USEFPRINTD).must_equal 'no'
    _(resource.USEHESIOD).must_equal 'no'
    _(resource.USEIPAV2).must_equal 'no'
    _(resource.USEKERBEROS).must_equal 'no'
    _(resource.USELDAP).must_equal 'no'
    _(resource.USELDAPAUTH).must_equal 'no'
    _(resource.USELOCAUTHORIZE).must_equal 'yes'
    _(resource.USEMKHOMEDIR).must_equal 'no'
    _(resource.USENIS).must_equal 'no'
    _(resource.USEPAMACCESS).must_equal 'no'
    _(resource.USEPASSWDQC).must_equal 'no'
    _(resource.USEPWQUALITY).must_equal 'yes'
    _(resource.USESHADOW).must_equal 'yes'
    _(resource.USESMARTCARD).must_equal 'no'
    _(resource.USESSSD).must_equal 'yes'
    _(resource.USESSSDAUTH).must_equal 'no'
    _(resource.USESYSNETAUTH).must_equal 'no'
    _(resource.USEWINBIND).must_equal 'no'
    _(resource.USEWINBINDAUTH).must_equal 'no'
    _(resource.WINBINDKRB5).must_equal 'no'
  end

  it 'Verify authconfig can detect the smartcard login authentication' do
    _(centResource.smartcard_authen_enabled?).must_equal false
  end

  it 'Verify authconfig can detect the smartcard removal action' do
    _(centResource.smartcard_removal_action).must_equal 'Ignore'
  end
end
