
require 'helper'
require 'inspec/resource'
require 'inspec/resources/xinetd_conf'

describe 'Inspec::Resources::XinetdConf' do
  let(:resource) { load_resource('xinetd_conf') }
  it 'reads default params' do
    d = resource.params['defaults']
    _(d).must_be_kind_of SimpleConfig
    _(d.params['instances']).must_equal '50'
    _(d.params['log_type']).must_equal 'SYSLOG daemon info'
    _(d.params.length).must_equal 2
  end

  describe 'with services from child configs' do
    it 'has one service name' do
      _(resource.services.uniq).must_equal %w{chargen echo}
    end

    it 'has multiple service definitions' do
      _(resource.ids).must_equal %w{chargen-stream chargen-dgram echo-stream echo-dgram}
    end

    it 'can filter by name' do
      _(resource.services('not here').services).must_be_empty
    end

    it 'can chain filters' do
      one = resource.services('chargen').socket_types('dgram')
      _(one.services.length).must_equal 1
      _(one.ids).must_equal %w{chargen-dgram}
    end

    it 'get all protocols for echo' do
      one = resource.services('echo')
      _(one.protocols).must_equal %w{tcp udp}
      _(one.ids).must_equal %w{echo-stream echo-dgram}
    end

    it 'get all protocols for chargen, including derived from socket_type' do
      one = resource.services('chargen')
      _(one.protocols).must_equal %w{tcp udp}
      _(one.ids).must_equal %w{chargen-stream chargen-dgram}
    end

    it 'params has only the protocols parsed from the config files' do
      one = resource.params['services']['chargen'].map{|x| x.params['protocol']}
      # in this example(CentOS), protocol is not defined in the config
      _(one).must_equal [nil, nil]
    end

    it 'can filter by protocols' do
      one = resource.services('echo')
      _(one.protocols(/tcp.*/).ids).must_equal %w{echo-stream}
    end

    it 'checks if all are disabled on one disabled service' do
      one = resource.ids('chargen-stream')
      _(one.disabled?).must_equal true
    end

    it 'checks if all are disabled on multiple mixed' do
      _(resource.disabled?).must_equal false
    end

    it 'checks if all are enabled on one enabled service' do
      one = resource.ids(/dgram$/)
      _(one.enabled?).must_equal true
    end

    it 'checks if all are enabled on one enabled service' do
      one = resource.ids(/stream$/)
      _(one.enabled?).must_equal false
    end

    it 'checks if all are enabled on multiple mixed' do
      _(resource.enabled?).must_equal false
    end
  end

  describe 'with single services and no child configs' do
    let (:resource) { load_resource('xinetd_conf', '/etc/xinetd.d/chargen-stream') }

    it 'checks if all are disabled on one disabled service' do
      one = resource.ids('chargen-stream')
      _(one.disabled?).must_equal true
    end
  end
end
