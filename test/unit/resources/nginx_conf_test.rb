# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::NginxConf' do
  # None of these tests currently work correctly on windows. See the
  # nginx_conf toplevel comment.
  next if Gem.win_platform?

  it 'reads the nginx_conf with all referenced include calls' do
    resource = MockLoader.new(:ubuntu1404).load_resource('nginx_conf')

    _(resource.params).must_be_kind_of Hash
    _(resource.contents).must_be_kind_of Hash
    _(resource.contents.keys).must_equal ["/etc/nginx/nginx.conf", "/etc/nginx/conf/mime.types", "/etc/nginx/proxy.conf"]

    # global entries
    _(resource.params['user']).must_equal [["www", "www"]] # multiple
    _(resource.params['error_log']).must_equal [["logs/error.log"]] # with /

    # verify http, events, and servers
    _(resource.params['events']).must_equal [{"worker_connections"=>[["4096"]]}]
    _(resource.params['http'].length).must_equal 1
    _(resource.params['http'][0]['server'].length).must_equal 2
    _(resource.params['http'][0]['default_type']).must_equal [['application/octet-stream']]

    # verify relative include
    _(resource.params['http'][0]['types']).must_equal [{'text/html'=>[['html', 'htm', 'shtml']]}]
    # verify absolute include
    _(resource.params['http'][0]['proxy_redirect']).must_equal [['off']]

    # verify multiline
    _(resource.params['http'][0]['log_format']).must_equal [['main', 'multi', 'line']]
  end

  it 'skips the resource if it cannot parse the config' do
    resource = MockLoader.new(:ubuntu1404).load_resource('nginx_conf', '/etc/nginx/failed.conf')
    _(resource.params).must_equal({})
    _(resource.instance_variable_get(:@resource_skipped)).must_equal "Cannot parse NginX config in /etc/nginx/failed.conf."
  end
end
