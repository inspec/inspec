require_relative '../test_helper'

describe Fastly::Client do
  let(:user)     { "test@example.com" }
  let(:password) { "notasecret" }
  let(:api_key)  { "notasecreteither" }

  describe 'initialize' do
    it 'raises ArgumentError when no options provided' do
      assert_raises(ArgumentError) {
        Fastly::Client.new()
      }
    end

    it 'does not set the user/pass if they are not provided' do
      client = Fastly::Client.new(api_key: api_key)

      assert_equal api_key, client.api_key
      assert_equal nil, client.user
      assert_equal nil, client.password
    end

    it 'raises Unauthorized if user/pass provided but are invalid' do
      stub_request(:any, /api.fastly.com/).to_return(status: 400)

      e = assert_raises(Fastly::Unauthorized) {
        Fastly::Client.new(user: user, password: pass)
      }
      assert_equal "Invalid auth credentials. Check username/password.", e.message
    end

    it 'surfaces a deprecation message when a username or password is provided' do
      stub_request(:any, /api.fastly.com/).
        to_return(body: JSON.generate(i: "dont care"), status: 200)

      assert_output('', /DEPRECATION WARNING:/) { Fastly::Client.new(user: user, password: pass) }
    end

    it 'initializes an http client' do
      client = Fastly::Client.new(api_key: api_key)

      assert_equal Net::HTTP, client.http.class
      assert_equal 443, client.http.port
      assert_equal 'api.fastly.com', client.http.address
      assert client.http.use_ssl?
    end

    it 'sets a cookie when auth with valid user/pass' do
      stub_request(:any, /api.fastly.com/).
        to_return(body: JSON.generate(i: "dont care"), status: 200, headers: { 'Set-Cookie' => 'tasty!' })

      client = Fastly::Client.new(user: user, password: pass)
      assert_equal "tasty!", client.cookie
    end

    it 'raises an Error if username is used in place of user as an option' do
      stub_request(:any, /api.fastly.com/).
        to_return(body: JSON.generate(i: "dont care"), status: 200, headers: { 'Set-Cookie' => 'tasty!' })

      assert_raises(ArgumentError) { Fastly.new(username: user, password: pass) }

      Fastly.new(user: user, password: pass)
      Fastly.new(api_key: api_key)
      Fastly.new(api_key: api_key, user: user, password: pass)
    end
  end

  describe 'get' do
    let(:client) { Fastly::Client.new(api_key: api_key) }

    it 'accepts a path and returns a parsed json hash' do
      stub_request(:any, /api.fastly.com/).
        to_return(body: JSON.generate(i: "dont care"), status: 200)

      resp = client.get('/service/blah')
      assert_equal resp.class, Hash
      assert_includes resp, "i"
    end

    it 'raises Fastly::Error on unsuccessful GETs' do
      stub_request(:any, /api.fastly.com/).to_return(status: 400)

      assert_raises(Fastly::Error) {
        client.get('/service/blah')
      }
    end
  end

  describe 'post' do
    let(:client) { Fastly::Client.new(api_key: api_key) }

    it 'raises Fastly::Error on unsuccessful POST' do
      stub_request(:any, /api.fastly.com/).to_return(status: 400)

      assert_raises(Fastly::Error) {
        client.post('/service/blah')
      }
    end

    it 'can make a successful POST' do
      stub_request(:any, /api.fastly.com/).
        to_return(body: JSON.generate(i: "dont care"), status: 200)

      resp = client.post('/service/blah')
      assert_equal resp.class, Hash
      assert_includes resp, "i"
    end

    it 'can make a POST without auth if asked to do so' do
      stub_request(:post, /api.fastly.com/).
        with(headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Accept'=>'application/json',
          'Content-Type'=>'application/x-www-form-urlencoded',
          #'Fastly-Key'=>'notasecreteither',
          'User-Agent'=> /fastly-ruby/
          }).
        to_return(body: JSON.generate(i: "dont care"), status: 200)

      resp = client.post(
        '/service/blah',
        {include_auth: false}
      )
    end

  end

  describe 'get_stats' do
    let(:client) { Fastly::Client.new(api_key: api_key) }

    it 'raises Fastly::Error when unsuccessful get' do
      stub_request(:any, /api.fastly.com/).to_return(status: 400)

      assert_raises(Fastly::Error) {
        client.get_stats('/stats')
      }
    end

    it 'can make a successful stats GET' do
      stub_request(:any, /api.fastly.com/).
        to_return(body: JSON.generate(i: "dont care", status: 'success', data: {}), status: 200)

      resp = client.get_stats('/stats')
      assert_equal resp.class, Hash

    end
  end
end
