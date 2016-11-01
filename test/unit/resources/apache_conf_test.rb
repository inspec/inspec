# encoding: utf-8
# author: Stephan Renatus

require 'helper'
require 'inspec/resource'
require 'hashie'

describe 'Inspec::Resources::ApacheConf' do
  # debian style apache2
  it 'reads values in apache2.conf and from Include, IncludeOptional params' do
    resource = MockLoader.new(:ubuntu1404).load_resource('apache_conf')
    _(resource.params).must_be_kind_of Hash
    _(resource.content).must_be_kind_of String
    _(resource.params('ServerRoot')).must_equal ['"/etc/apache2"']
    _(resource.params('Listen').sort).must_equal ['443', '80']
    # TODO(sr) currently, the parser only merges parameter across separate
    # source files, not in one file
    _(resource.params('Define')).must_equal ['ENABLE_USR_LIB_CGI_BIN',
                                             'ENABLE_USR_LIB_CGI_BIN']
  end

  # non debian style httpd
  it 'reads values in httpd.conf and from Include, IncludeOptional params' do
    resource = MockLoader.new(:centos6).load_resource('apache_conf')
    _(resource.params).must_be_kind_of Hash
    _(resource.content).must_be_kind_of String
    _(resource.params('ServerRoot')).must_equal ['"/etc/httpd"']
    _(resource.params('Listen').sort).must_equal ['443', '80']

    # sourced using an absolute path in httpd.conf
    _(resource.params('ExtendedStatus')).must_equal ['Off']
  end
end
