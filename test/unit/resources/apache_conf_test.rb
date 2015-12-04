# encoding: utf-8
# author: Stephan Renatus

require 'helper'

describe 'Inspec::Resources::ApacheConf' do
  let(:resource) { load_resource('apache_conf') }

  it 'verify content is a string' do
    _(resource.content).must_be_kind_of String
  end

  it 'verify params is a hashmap' do
    _(resource.params).must_be_kind_of Hash
  end

  it 'reads values in apache2.conf' do
    _(resource.params('ServerRoot')).must_equal ['"/etc/apache2"']
  end

  it 'reads values in from the direct include ports.conf' do
    _(resource.params('Listen').sort).must_equal ['443', '80']
  end

  it 'reads values in from wildcard include serve-cgi-bin.conf' do
    # TODO(sr) currently, the parser only merges parameter across separate
    # source files, not in one file
    _(resource.params('Define')).must_equal ['ENABLE_USR_LIB_CGI_BIN',
                                             'ENABLE_USR_LIB_CGI_BIN']
  end
end
