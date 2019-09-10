require "helper"
require "inspec/resources/ssl"
require "sslshake"

describe "Inspec::Resources::SSL" do
  it "verify cipher enabled" do
    SSLShake.expects(:hello).at_least_once.returns({ "cipher_suite" => "TLS_RSA_WITH_AES_128_CBC_SHA", "success" => true })
    resource = load_resource("ssl", host: "localhost").ciphers(/rsa/i)
    _(resource.enabled?).must_equal true
  end

  it "verify cipher disabled" do
    SSLShake.expects(:hello).at_least_once.returns({ "error" => "SSL Alert." })
    resource = load_resource("ssl", host: "localhost").ciphers(/rc4/i)
    _(resource.enabled?).must_equal false
  end

  it "verify protocol enabled" do
    SSLShake.expects(:hello).at_least_once.returns({ "version" => "tls1.2", "success" => true })
    resource = load_resource("ssl", host: "localhost").protocols("tls1.2")
    _(resource.enabled?).must_equal true
  end

  it "verify protocol disabled" do
    SSLShake.expects(:hello).at_least_once.returns({ "error" => "Failed to parse response. Cannot handle SSLv2 responses" })
    resource = load_resource("ssl", host: "localhost").protocols("ssl2")
    _(resource.enabled?).must_equal false
  end

  it "verify host reachable" do
    SSLShake.expects(:hello).at_least_once.returns({ "success" => true })
    resource = load_resource("ssl", host: "localhost")
    _(resource.enabled?).must_equal true
  end

  it "verify host unreachable" do
    SSLShake.expects(:hello).at_least_once.returns({ "error" => "Connection error Errno::ECONNREFUSED, can't connect to localhost:443." })
    resource = load_resource("ssl", host: "localhost")
    _(resource.enabled?).must_equal false
  end

  it "error with nil host" do
    resource = load_resource("ssl", host: nil)
    err = proc { resource.enabled? }.must_raise(RuntimeError)
    err.message.must_equal "Cannot determine host for SSL test. Please specify it or use a different target."
  end

  it "verify sslshake resources" do
    resource = load_resource("ssl", host: "localhost")
    _(resource.protocols.uniq).must_equal ["ssl2", "ssl3", "tls1.0", "tls1.1", "tls1.2"]
    _(resource.ciphers.include?("TLS_RSA_WITH_AES_128_CBC_SHA256")).must_equal true
    [681, 993].must_include(resource.ciphers.count)
  end
end
