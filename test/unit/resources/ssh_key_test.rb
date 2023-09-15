require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/ssh_key"

describe Inspec::Resources::SshKey do
  let(:resource) { MockLoader.new("ubuntu".to_sym).load_resource("ssh_key", "test/fixtures/files/test_ssh_key") }

  it "returns the key type" do
    _(resource.send("type")).must_equal "rsa"
  end

  it "returns the key_length" do
    _(resource.send("key_length")).must_equal 4096
  end

  it "returns resource_id" do
    _(resource.send("resource_id")).must_equal "test/fixtures/files/test_ssh_key"
  end

  it "returns true if key is private" do
    _(resource.send("private?")).must_equal true
  end

  it "returns true if key is public" do
    _(resource.send("public?")).must_equal true
  end

end
