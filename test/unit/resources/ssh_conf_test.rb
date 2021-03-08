require "helper"
require "inspec/resource"
require "inspec/resources/ssh_config"

describe "Inspec::Resources::SshConfig" do

  describe "ssh_config" do
    it "check ssh config parsing" do
      resource = load_resource("ssh_config")
      _(resource.Host).must_equal "*"
      _(resource.Tunnel).must_be_nil
      _(resource.SendEnv).must_equal "LANG LC_*"
      _(resource.HashKnownHosts).must_equal "yes"
    end

    it "is case insensitive" do
      resource = load_resource("ssh_config")
      _(resource.gssapiauthentication).must_equal "no"
      _(resource.GSSAPIAuthentication).must_equal "no"
    end

    it "uses the first value encountered" do
      resource = load_resource("ssh_config")
      _(resource.HostBasedAuthentication).must_equal "yes"
    end
  end

  describe "sshd_config" do
    it "check protocol version" do
      resource = load_resource("sshd_config")
      _(resource.Port).must_equal "22"
      _(resource.UsePAM).must_equal "yes"
      _(resource.ListenAddress).must_be_nil
      _(resource.HostKey).must_equal [
        "/etc/ssh/ssh_host_rsa_key",
        "/etc/ssh/ssh_host_dsa_key",
        "/etc/ssh/ssh_host_ecdsa_key",
      ]
    end

    it "check bad path" do
      resource = load_resource("sshd_config", "/etc/ssh/sshd_config_does_not_exist")
      _(resource.resource_exception_message).must_equal "Can't find file: /etc/ssh/sshd_config_does_not_exist"
    end

    it "check cannot read" do
      resource = load_resource("sshd_config", "/etc/ssh/sshd_config_empty")
      _(resource.resource_exception_message).must_equal "File is empty: /etc/ssh/sshd_config_empty"
    end
  end
end
