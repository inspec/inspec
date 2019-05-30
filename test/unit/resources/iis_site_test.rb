
require 'helper'
require 'inspec/resource'
require 'inspec/resources/iis_site'

describe 'Inspec::Resources::IisSite' do
  it 'verify Default Web Site settings' do
    resource = MockLoader.new(:windows).load_resource('iis_site', 'Default Web Site')
    _(resource.send('app_pool')).must_equal 'DefaultAppPool'
    _(resource.send('bindings')).must_equal [
        "http *:80:",
        "net.tcp 808:*",
        "net.pipe *",
        "net.msmq localhost",
        "msmq.formatname localhost",
        "https *:443: sslFlags=0"
    ]
    _(resource.send('state')).must_equal 'Started'
    _(resource.send('path')).must_equal '%SystemDrive%\\inetpub\\wwwroot'
    _(resource.send('exists?')).must_equal true
    _(resource.send('running?')).must_equal true
    _(resource.send('has_app_pool?', 'DefaultAppPool')).must_equal true
    _(resource.send('has_app_pool?', 'SomeOtherAppPool')).must_equal false
    _(resource.send('has_path?', '%SystemDrive%\\inetpub\\wwwroot')).must_equal true
    _(resource.send('has_path?', '%SystemDrive%\\inetpub\\wwwroot\\subpath')).must_equal false
    _(resource.send('has_binding?', "https *:443: sslFlags=0")).must_equal true
    _(resource.send('has_binding?', "https *:443:")).must_equal false
    _(resource.send('has_binding?', "https :443:example.com sslFlags=0")).must_equal false
    _(resource.send('to_s')).must_equal 'iis_site \'Default Web Site\''
  end
end
