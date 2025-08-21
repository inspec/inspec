require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/ssh_key"
require "mixlib/shellout"

class TestSshKeyResource < Minitest::Test
  def setup
    skip_windows!
    # Generate an SSH RSA key for testing
    @private_key_path = generate_ssh_key
  end

  def teardown
    skip_windows!
    # Clean up: remove the generated ssh keys
    FileUtils.rm_rf(@private_key_path)
    FileUtils.rm_rf("#{@private_key_path}.pub")
  end

  def test_ssh_key_resoure
    skip_windows! # confirmed failure on Windows https://buildkite.com/chef/inspec-inspec-main-verify-private/builds/596#018d308c-df4f-476b-a1d7-57a4ebc90d8b
    @ssh_key = MockLoader.new("ubuntu".to_sym).load_resource("ssh_key", @private_key_path)
    assert_match("rsa", @ssh_key.type)
    assert_equal(4096, @ssh_key.key_length)
    assert_equal(true, @ssh_key.private?)
    assert_equal(false, @ssh_key.public?)
  end

  private

  def generate_ssh_key
    file_path = "test/fixtures/files/test_rsa_key"
    # Use PEM format to ensure Net::SSH can parse the private key reliably across environments
    cmd = Mixlib::ShellOut.new("yes | ssh-keygen -t rsa -b 4096 -m PEM -N '' -f #{file_path}")
    cmd.run_command
    cmd.error!
    sleep 3

    file_path
  end
end