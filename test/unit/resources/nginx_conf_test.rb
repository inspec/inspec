# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::NginxConf' do
  # None of these tests currently work correctly on windows. See the
  # nginx_conf toplevel comment.
  next if Gem.win_platform?

  let(:nginx_conf) { MockLoader.new(:ubuntu1404).load_resource('nginx_conf') }

  it 'doesnt fail with a missing file' do
    nginx_conf = MockLoader.new(:ubuntu1404).load_resource('nginx_conf', '/....missing_file')
    _(nginx_conf.params).must_equal({})
  end

  it 'doesnt fail with an incorrect file' do
    nginx_conf = MockLoader.new(:ubuntu1404).load_resource('nginx_conf', '/etc/passwd')
    _(nginx_conf.params).must_equal({})
  end

  it 'reads the nginx_conf with all referenced include calls' do
    _(nginx_conf.params).must_be_kind_of Hash
    _(nginx_conf.contents).must_be_kind_of Hash
    _(nginx_conf.contents.keys).must_equal %w(/etc/nginx/nginx.conf /etc/nginx/conf/mime.types /etc/nginx/proxy.conf)

    # global entries
    _(nginx_conf.params['user']).must_equal [["www", "www"]] # multiple
    _(nginx_conf.params['error_log']).must_equal [["logs/error.log"]] # with /

    # verify http, events, and servers
    _(nginx_conf.params['events']).must_equal [{"worker_connections"=>[["4096"]]}]
    _(nginx_conf.params['http'].length).must_equal 1
    _(nginx_conf.params['http'][0]['server'].length).must_equal 2
    _(nginx_conf.params['http'][0]['default_type']).must_equal [['application/octet-stream']]

    # verify relative include
    _(nginx_conf.params['http'][0]['types']).must_equal [{'text/html'=>[['html', 'htm', 'shtml']]}]
    # verify absolute include
    _(nginx_conf.params['http'][0]['proxy_redirect']).must_equal [['off']]

    # verify multiline
    _(nginx_conf.params['http'][0]['log_format']).must_equal [['main', 'multi', 'line']]
  end

  it 'skips the resource if it cannot parse the config' do
    resource = MockLoader.new(:ubuntu1404).load_resource('nginx_conf', '/etc/nginx/failed.conf')
    _(resource.params).must_equal({})
    _(resource.instance_variable_get(:@resource_skipped)).must_equal "Cannot parse NginX config in /etc/nginx/failed.conf."
  end

  describe '#http' do
    let(:http) { nginx_conf.http }

    it 'provides an accessor for all http entries' do
      _(http).must_be_kind_of Inspec::Resources::NginxConfHttp
    end

    it 'pretty-prints in CLI' do
      _(http.inspect).must_equal 'nginx_conf /etc/nginx/nginx.conf, http entries'
    end

    it 'provides accessors to individual http entries' do
      _(http.entries).must_be_kind_of Array
      _(http.entries.length).must_equal 1
      _(http.entries[0]).must_be_kind_of Inspec::Resources::NginxConfHttpEntry
    end

    it 'provides aggregated access to all servers' do
      _(http.servers).must_be_kind_of Array
      _(http.servers.length).must_equal 2
      _(http.servers[0]).must_be_kind_of Inspec::Resources::NginxConfServer
    end

    it 'provides aggregated access to all locations' do
      _(http.locations).must_be_kind_of Array
      _(http.locations.length).must_equal 3
      _(http.locations[0]).must_be_kind_of Inspec::Resources::NginxConfLocation
    end

    it 'doesnt fail on params == nil' do
      entry = Inspec::Resources::NginxConfHttp.new(nil, nil)
      _(entry.entries).must_equal([])
      _(entry.servers).must_equal([])
      _(entry.locations).must_equal([])
    end
  end

  describe 'NginxConfHttpEntry' do
    let(:entry) { nginx_conf.http.entries[0] }

    it 'pretty-prints in CLI' do
      _(entry.inspect).must_equal 'nginx_conf /etc/nginx/nginx.conf, http entry'
    end

    it 'provides aggregated access to all servers' do
      _(entry.servers).must_be_kind_of Array
      _(entry.servers.length).must_equal 2
      _(entry.servers[0]).must_be_kind_of Inspec::Resources::NginxConfServer
    end

    it 'provides aggregated access to all locations' do
      _(entry.locations).must_be_kind_of Array
      _(entry.locations.length).must_equal 3
      _(entry.locations[0]).must_be_kind_of Inspec::Resources::NginxConfLocation
    end

    it 'doesnt fail on params == nil' do
      entry = Inspec::Resources::NginxConfHttpEntry.new(nil, nil)
      _(entry.params).must_equal({})
      _(entry.servers).must_equal([])
      _(entry.locations).must_equal([])
    end
  end

  describe '#servers' do
    let(:servers) { nginx_conf.servers }

    it 'forwards access to #http.servers' do
      _(servers.map(&:params)).must_equal nginx_conf.http.servers.map(&:params)
    end
  end

  describe '#locations' do
    let(:locations) { nginx_conf.locations }

    it 'forwards access to #http.locations' do
      _(locations.map(&:params)).must_equal nginx_conf.http.locations.map(&:params)
    end
  end

  describe 'NginxConfServer' do
    let(:entry) { nginx_conf.servers[0] }

    it 'pretty-prints in CLI' do
      _(entry.inspect).must_equal 'nginx_conf /etc/nginx/nginx.conf, server domain1.com:85'
    end

    it 'provides access to all its parameters' do
      _(entry.params).must_equal nginx_conf.params['http'][0]['server'][0]
    end

    it 'provides access to its parent' do
      _(entry.parent.params).must_equal nginx_conf.http.entries[0].params
    end

    it 'provides access to all its locations' do
      _(entry.locations).must_be_kind_of Array
      _(entry.locations.length).must_equal 1
      _(entry.locations[0]).must_be_kind_of Inspec::Resources::NginxConfLocation
    end

    it 'doesnt fail on params == nil' do
      entry = Inspec::Resources::NginxConfServer.new(nil, nil)
      _(entry.params).must_equal({})
      _(entry.locations).must_equal([])
    end
  end

  describe 'NginxConfLocation' do
    let(:entry) { nginx_conf.locations[0] }

    it 'pretty-prints in CLI' do
      _(entry.inspect).must_equal 'nginx_conf /etc/nginx/nginx.conf, location "~ \\\\.php$"'
    end

    it 'provides access to all its parameters' do
      _(entry.params).must_equal nginx_conf.params['http'][0]['server'][0]['location'][0]
    end

    it 'provides access to its parent' do
      _(entry.parent.params).must_equal nginx_conf.servers[0].params
    end

    it 'doesnt fail on params == nil' do
      entry = Inspec::Resources::NginxConfLocation.new(nil, nil)
      _(entry.params).must_equal({})
    end
  end
end
