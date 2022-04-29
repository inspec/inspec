require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/x509_private_key"

describe Inspec::Resources::X509PrivateKey do
  # linux
  it "checks x509 secret key with no passphrase on linux" do
    resource = MockLoader.new("ubuntu".to_sym).load_resource("x509_private_key", "/home/openssl_activity/bob_private.pem")
    _(resource.valid?).must_equal true
    _(resource.encrypted?).must_be_nil
    _(resource.has_matching_certificate?("/home/openssl_activity/bob_certificate.crt")).must_equal true
  end

  # linux - with password
  it "checks x509 secret key with passphrase on linux" do
    resource = MockLoader.new("ubuntu".to_sym).load_resource("x509_private_key", "/home/openssl_activity/alice_private.pem", "password@123")
    _(resource.valid?).must_equal true
    _(resource.encrypted?).wont_be_nil
    _(resource.has_matching_certificate?("/home/openssl_activity/alice_certificate.crt")).must_equal true
  end

  # darwin
  it "checks x509 secret key with no passphrase on darwin" do
    resource = MockLoader.new(:macos10_10).load_resource("x509_private_key", "/home/openssl_activity/bob_private.pem")
    _(resource.valid?).must_equal true
    _(resource.encrypted?).must_be_nil
    _(resource.has_matching_certificate?("/home/openssl_activity/bob_certificate.crt")).must_equal true
  end

  # freebsd
  it "checks x509 secret key with no passphrase on darwin" do
    resource = MockLoader.new(:freebsd10).load_resource("x509_private_key", "/home/openssl_activity/bob_private.pem")
    _(resource.valid?).must_equal true
    _(resource.encrypted?).must_be_nil
    _(resource.has_matching_certificate?("/home/openssl_activity/bob_certificate.crt")).must_equal true
  end

  # linux
  it "checks unavailable x509 secret key with no passphrase on linux" do
    secret_key_path = "/home/openssl_activity/ghost_private.pem"
    resource = MockLoader.new("ubuntu".to_sym).load_resource("x509_private_key", secret_key_path)
    _(resource.valid?).must_equal false
    ex = _ { resource.encrypted? }.must_raise(Inspec::Exceptions::ResourceFailed)
    _(ex.message).must_include "The given secret key #{secret_key_path} does not exist."
    ex = _ { resource.has_matching_certificate?("/home/openssl_activity/ghost_cert.crt") }.must_raise(Inspec::Exceptions::ResourceFailed)
    _(ex.message).must_include "Executing openssl x509 -noout -modulus -in /home/openssl_activity/ghost_cert.crt | openssl md5 failed:"
  end
end
