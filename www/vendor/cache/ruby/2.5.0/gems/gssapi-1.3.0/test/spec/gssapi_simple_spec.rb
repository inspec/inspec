$: << File.dirname(__FILE__) + '/../../lib/'
require 'gssapi'
require 'base64'
require 'yaml'


describe GSSAPI::Simple, 'Test the Simple GSSAPI interface' do

  let(:conf) { YAML.load_file "#{File.dirname(__FILE__)}/conf_file.yaml" }
  let(:cli) { GSSAPI::Simple.new(conf['s_host'], conf['s_service']) }
  let(:srv ) { GSSAPI::Simple.new(conf['s_host'], conf['s_service'], conf['keytab']) }

  it 'should get the initial context for a client' do
    token = cli.init_context
    expect(token).not_to be_empty
  end

  it 'should acquire credentials for a server service' do
    expect(srv.acquire_credentials).to eq(true)
  end

  def play_handshake(cli,srv,clioptions={})
    clitoken = cli.init_context(nil, clioptions)
    expect(clitoken).not_to be_empty

    expect(srv.acquire_credentials).to eq(true)

    srvoktok = srv.accept_context(clitoken)
    expect(srvoktok).not_to be_empty

    ret = cli.init_context(srvoktok)
    expect(ret).to eq(true)
  end

  it 'client server should handshake' do
    play_handshake(cli,srv)
  end

  it 'mic' do
    play_handshake(cli,srv)

    secret = "this is secreta"

    mic = cli.get_mic(secret)

    expect(srv.verify_mic(secret,mic)).to eq(true)
  end

  context "no delegation" do
    it "sets delegated_credentials to nil" do
      play_handshake(cli,srv,:delegate => false)
      expect(srv.delegated_credentials).to be_nil
    end
  end

  describe "delegation" do
    it "sets delegated_credentials to valid" do
      play_handshake(cli,srv,:delegate => true)
      expect(srv.delegated_credentials).not_to be_nil
      delegated_display_name = srv.display_name

      host2 = conf['s_host2'] || conf['s_host']
      service2 = conf['s_service2'] || conf['s_service']
      cli_del = GSSAPI::Simple.new(host2, service2)
      srv_del = GSSAPI::Simple.new(host2, service2, conf['keytab2'])
      play_handshake(cli_del,srv_del,:credentials => srv.delegated_credentials)
      expect(srv_del.display_name).to eq(delegated_display_name)
    end
  end
end
