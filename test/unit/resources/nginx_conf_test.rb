require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::NginxConf' do
  # None of these tests currently work correctly on windows. See the
  # nginx_conf toplevel comment.
  next if Gem.win_platform?

  let(:nginx_conf) { MockLoader.new(:ubuntu1404).load_resource('nginx_conf') }

  it 'doesnt fail with a missing file' do
    nginx_conf = MockLoader.new(:ubuntu1404).load_resource('nginx_conf', '/missing_file')
    _(nginx_conf.params).must_equal({})
  end

  it 'doesnt fail with an incorrect file' do
    nginx_conf = MockLoader.new(:ubuntu1404).load_resource('nginx_conf', '/etc/passwd')
    _(nginx_conf.params).must_equal({})
  end

  it 'reads the nginx_conf with all referenced include calls' do
    _(nginx_conf.params).must_be_kind_of Hash
    _(nginx_conf.contents).must_be_kind_of Hash
    _(nginx_conf.contents.keys).must_equal %w(
      /etc/nginx/nginx.conf
      /etc/nginx/conf/mime.types
      /etc/nginx/proxy.conf
      /etc/nginx/conf.d/foobar.conf
      /etc/nginx/conf.d/multiple.conf
      /etc/nginx/quotes.d/example.conf
    )

    # verify user
    _(nginx_conf.params['user']).must_equal [['www', 'www']] # multiple

    # verify error_log
    _(nginx_conf.params['error_log']).must_equal [['logs/error.log']] # with /

    # verify events
    _(nginx_conf.params['events']).must_equal [{'worker_connections'=>[['4096']]}]

    # verify http
    _(nginx_conf.params['http'].length).must_equal 1

    # verify server count
    _(nginx_conf.params['http'][0]['server'].length).must_equal 6

    # verify index
    _(nginx_conf.params['http'][0]['index']).must_equal [['index.html', 'index.htm', 'index.php']]

    # verify default_type (parameter with '/')
    _(nginx_conf.params['http'][0]['default_type']).must_equal [['application/octet-stream']]

    # verify log_format (multi-line parameter)
    _(nginx_conf.params['http'][0]['log_format']).must_equal [['main', 'multi', 'line']]

    # verify types (relative include test)
    _(nginx_conf.params['http'][0]['types']).must_equal [{'text/html'=>[['html', 'htm', 'shtml']]}]

    # verify proxy_redirect (absolute include test)
    _(nginx_conf.params['http'][0]['proxy_redirect']).must_equal [['off']]

    # verify server in main nginx.conf
    _(nginx_conf.params['http'][0]['server'][0]['listen']).must_equal [['80']]
    _(nginx_conf.params['http'][0]['server'][0]['server_name']).must_equal [['domain1.com', 'www.domain1.com']]
    _(nginx_conf.params['http'][0]['server'][0]['location'][0]['_']).must_equal ["~", "\\.php$"]
    _(nginx_conf.params['http'][0]['server'][0]['location'][0]['fastcgi_pass']).must_equal [["127.0.0.1:1025"]]

    # verify another server in main nginx.conf (multi-server and multi-location test)
    _(nginx_conf.params['http'][0]['server'][1]['listen']).must_equal [['443']]
    _(nginx_conf.params['http'][0]['server'][1]['server_name']).must_equal [['domain2.com', 'www.domain2.com']]
    _(nginx_conf.params['http'][0]['server'][1]['location'][0]['_']).must_equal ['~', '^/(images|javascript|js|css|flash|media|static)/']
    _(nginx_conf.params['http'][0]['server'][1]['location'][0]['root']).must_equal [['/var/www/virtual/big.server.com/htdocs']]
    _(nginx_conf.params['http'][0]['server'][1]['location'][1]['_']).must_equal ['/']
    _(nginx_conf.params['http'][0]['server'][1]['location'][1]['proxy_pass']).must_equal [['http://127.0.0.1:8080']]

    # verify a server in conf.d (wildcard include test)
    _(nginx_conf.params['http'][0]['server'][2]['listen']).must_equal [['8081']]
    _(nginx_conf.params['http'][0]['server'][2]['server_name']).must_equal [['foobar.com', 'www.foobar.com']]
    _(nginx_conf.params['http'][0]['server'][2]['location'][0]['_']).must_equal ['~', '^/flash/']
    _(nginx_conf.params['http'][0]['server'][2]['location'][0]['root']).must_equal [['/var/www/virtual/www.foobar.com/htdocs']]

    # verify servers in conf.d files (wildcard include test)
    _(nginx_conf.params['http'][0]['server'][3]['listen']).must_equal [['8083']]
    _(nginx_conf.params['http'][0]['server'][3]['server_name']).must_equal [['example1.com', 'www.example1.com']]
    _(nginx_conf.params['http'][0]['server'][3]['location'][0]['_']).must_equal ['~', '^/static/']
    _(nginx_conf.params['http'][0]['server'][3]['location'][0]['root']).must_equal [['/var/www/virtual/www.example1.com/htdocs']]
    _(nginx_conf.params['http'][0]['server'][4]['listen']).must_equal [['8084']]
    _(nginx_conf.params['http'][0]['server'][4]['server_name']).must_equal [['example2.com', 'www.example2.com']]
    _(nginx_conf.params['http'][0]['server'][4]['location'][0]['_']).must_equal ['~', '^/media/']
    _(nginx_conf.params['http'][0]['server'][4]['location'][0]['root']).must_equal [['/var/www/virtual/www.example2.com/htdocs']]

    # verify a server in conf.d_quotes (quotes in path test)
    _(nginx_conf.params['http'][0]['server'][5]['listen']).must_equal [['8085']]
    _(nginx_conf.params['http'][0]['server'][5]['server_name']).must_equal [['quotes.com', 'www.quotes.com']]
  end

  it 'skips the resource if it cannot parse the config' do
    resource = MockLoader.new(:ubuntu1404).load_resource('nginx_conf', '/etc/nginx/failed.conf')
    _(resource.params).must_equal({})
    _(resource.resource_exception_message).must_equal "Cannot parse NginX config in /etc/nginx/failed.conf."
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
      http.entries.each do |entry|
        _(entry).must_be_kind_of Inspec::Resources::NginxConfHttpEntry
      end
    end

    it 'provides aggregated access to all servers' do
      _(http.servers).must_be_kind_of Array
      _(http.servers.length).must_equal 6
      http.servers.each do |server|
        _(server).must_be_kind_of Inspec::Resources::NginxConfServer
      end
    end

    it 'provides aggregated access to all locations' do
      _(http.locations).must_be_kind_of Array
      _(http.locations.length).must_equal 6
      http.locations.each do |location|
        _(location).must_be_kind_of Inspec::Resources::NginxConfLocation
      end
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
      _(entry.servers.length).must_equal 6
      _(entry.servers[0]).must_be_kind_of Inspec::Resources::NginxConfServer
      entry.servers.each do |server|
        _(server).must_be_kind_of Inspec::Resources::NginxConfServer
      end
    end

    it 'provides aggregated access to all locations' do
      _(entry.locations).must_be_kind_of Array
      _(entry.locations.length).must_equal 6
      _(entry.locations[0]).must_be_kind_of Inspec::Resources::NginxConfLocation
      entry.locations.each do |location|
        _(location).must_be_kind_of Inspec::Resources::NginxConfLocation
      end
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
      _(entry.inspect).must_equal 'nginx_conf /etc/nginx/nginx.conf, server domain1.com:80'
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
      entry.locations.each do |location|
        _(location).must_be_kind_of Inspec::Resources::NginxConfLocation
      end
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
