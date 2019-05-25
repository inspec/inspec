
require 'helper'
require 'inspec/resource'
require 'inspec/resources/elasticsearch'

describe 'Inspec::Resources::Elasticsearch' do
  let(:resource) { load_resource('elasticsearch') }

  it 'returns a build hash' do
    _(resource.build_hash).must_equal [ 'b2f0c09', 'b2f0c09' ]
  end

  it 'returns a cluster name' do
    _(resource.cluster_name).must_equal [ 'foo', 'foo' ]
  end

  it 'returns a hostname' do
    _(resource.host).must_equal [ 'node1.mycompany.biz', 'node2.mycompany.biz' ]
  end

  it 'returns http settings' do
    _(resource.http[0].bound_address.first).must_equal '0.0.0.0:9200'
    _(resource.http[1].bound_address.first).must_equal '0.0.0.0:9200'
    _(resource.http[0].publish_address).must_equal '172.19.0.2:9200'
    _(resource.http[1].publish_address).must_equal '172.19.0.3:9200'
    _(resource.http[0].max_content_length_in_bytes).must_equal 104857600
    _(resource.http[1].max_content_length_in_bytes).must_equal 104857600
  end

  it 'returns ingest settings' do
    _(resource.ingest[0].key?('processors')).must_equal true
    _(resource.ingest[1].key?('processors')).must_equal true
  end

  it 'returns IP addresses' do
    _(resource.ip).must_equal [ '172.19.0.2', '172.19.0.3' ]
  end

  it 'returns jvm settings' do
    _(resource.jvm[0].vm_name).must_equal 'OpenJDK 64-Bit Server VM'
    _(resource.jvm[1].vm_name).must_equal 'OpenJDK 64-Bit Server VM'
  end

  it 'returns a module list' do
    _(resource.module_list[0]).must_include 'percolator'
    _(resource.module_list[1]).must_include 'lang-mustache'
  end

  it 'returns modules' do
    node_1_module = resource.modules[0].find { |mod| mod.name == 'percolator' }
    node_2_module = resource.modules[1].find { |mod| mod.name == 'lang-mustache' }

    node_1_module.classname.must_equal 'org.elasticsearch.percolator.PercolatorPlugin'
    node_2_module.classname.must_equal 'org.elasticsearch.script.mustache.MustachePlugin'
  end

  it 'returns node names' do
    _(resource.node_name).must_equal ['_L4HxbL', 'N1XoIhE']
  end

  it 'returns node IDs' do
    _(resource.node_id).must_equal ['_L4HxbLvQuWJdD5ejUgt8A', 'N1XoIhE6RWGAMTS1fSdsLg']
  end

  it 'returns operating system information' do
    _(resource.os[0].arch).must_equal 'amd64'
    _(resource.os[1].arch).must_equal 'amd64'
  end

  it 'returns a plugin list' do
    _(resource.plugin_list).must_equal [['ingest-user-agent'], ['ingest-user-agent']]
  end

  it 'returns plugins' do
    node_1_plugin = resource.plugins[0].find { |plugin| plugin.name == 'ingest-user-agent' }
    node_2_plugin = resource.plugins[1].find { |plugin| plugin.name == 'ingest-user-agent' }

    node_1_plugin.version.must_equal '5.5.2'
    node_2_plugin.version.must_equal '5.5.2'
  end

  it 'returns process information' do
    _(resource.process[0]).must_equal({"refresh_interval_in_millis"=>1000, "id"=>1, "mlockall"=>false})
    _(resource.process[1]).must_equal({"refresh_interval_in_millis"=>1000, "id"=>1, "mlockall"=>false})
  end

  it 'returns role information' do
    _(resource.roles).must_equal [["master", "data", "ingest"], ["master", "data", "ingest"]]
  end

  it 'returns settings' do
    _(resource.settings[0].path.logs).must_equal '/usr/share/elasticsearch/logs'
    _(resource.settings[1].path.logs).must_equal '/usr/share/elasticsearch/logs'
  end

  it 'returns the total indexing buffer' do
    _(resource.total_indexing_buffer).must_equal [213005107, 213005107]
  end

  it 'returns transport information' do
    _(resource.transport[0].publish_address).must_equal '172.19.0.2:9300'
    _(resource.transport[1].publish_address).must_equal '172.19.0.3:9300'
  end

  it 'returns a transport address' do
    _(resource.transport_address).must_equal ['172.19.0.2:9300', '172.19.0.3:9300']
  end

  it 'returns the Elasticsearch version' do
    _(resource.version).must_equal ['5.5.2', '5.5.2']
  end

  it 'returns the correct node count' do
    _(resource.node_count).must_equal 2
  end

  describe "with a custom url" do
    let(:resource) { load_resource('elasticsearch', url: 'http://elasticsearch.mycompany.biz:1234') }

    # this test relies on the MockLoader running a unique command to get Elasticsearch data
    # using a custom URL which returns a different payload than the other tests.
    it 'returns proper data from the custom URL' do
      _(resource.cluster_name).must_equal ['custom_url']
    end
  end

  describe "with authentication" do
    let(:resource) { load_resource('elasticsearch', username: 'es_admin', password: 'password') }

    # this test relies on the MockLoader running a unique command to get Elasticsearch data
    # using authentication which returns a different payload than the other tests.
    it 'returns proper data from the URL with authentication' do
      _(resource.cluster_name).must_equal ['authentication']
    end
  end

  describe "with SSL verification disabled" do
    let(:resource) { load_resource('elasticsearch', ssl_verify: false) }

    # this test relies on the MockLoader running a unique command to get Elasticsearch data
    # with SSL verification disabled which returns a different payload than the other tests.
    it 'returns proper data with SSL verification disabled' do
      _(resource.cluster_name).must_equal ['no_ssl']
    end
  end
end
