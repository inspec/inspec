# copyright: 2017, Chef Software Inc.

require "helper"
require "thor"

describe "BaseCLI" do
  let(:cli) { Inspec::BaseCLI.new }

  describe "formats the platfrom information" do
    it "verify platform formatting" do
      hash = { name: "test-os", families: "aws, cloud", release: "aws-sdk-v1" }
      expect = <<EOF
  Name:      \e[1m\e[35mtest-os\e[0m
  Families:  \e[1m\e[35maws, cloud\e[0m
  Release:   \e[1m\e[35maws-sdk-v1\e[0m
EOF
      _(Inspec::BaseCLI.format_platform_info(params: hash, indent: 2, color: 35)).must_equal expect
    end
  end

  describe "configure_logger" do
    after do
      Inspec::Log.init
      Inspec::Log.level = :fatal
    end

    let(:options) do
      o = {
        "log_location" => $stderr,
        "log_level" => "debug",
        "reporter" => {
          "json" => {
            "stdout" => true,
          },
        },
      }
      Thor::CoreExt::HashWithIndifferentAccess.new(o)
    end

    let(:format) do
      device = options[:logger].instance_variable_get(:"@logdev")
      device.instance_variable_get(:"@dev")
    end

    it "sets to stderr for log_location" do
      cli.send(:configure_logger, options)
      _(format).must_equal $stderr
    end

    it "sets to stderr for json" do
      options.delete("log_location")
      options.delete("log_level")
      cli.send(:configure_logger, options)
      _(format).must_equal $stderr
    end

    it "sets defaults to stdout for everything else" do
      options.delete("log_location")
      options.delete("log_level")
      options.delete("reporter")

      cli.send(:configure_logger, options)
      _(format).must_equal $stdout
    end
  end

  describe "suppress_log_output?" do
    it "suppresses json" do
      opts = { "reporter" => { "json" => { "stdout" => true } } }
      _(cli.send(:suppress_log_output?, opts)).must_equal true
    end

    it "do not suppresses json-min when going to file" do
      opts = { "reporter" => { "json-min" => { "file" => "/tmp/json" } } }
      _(cli.send(:suppress_log_output?, opts)).must_equal false
    end

    it "suppresses json-rspec" do
      opts = { "reporter" => { "json-rspec" => { "stdout" => true } } }
      _(cli.send(:suppress_log_output?, opts)).must_equal true
    end

    it "suppresses json-automate" do
      opts = { "reporter" => { "json-automate" => { "stdout" => true } } }
      _(cli.send(:suppress_log_output?, opts)).must_equal true
    end

    it "suppresses junit" do
      opts = { "reporter" => { "junit" => { "stdout" => true } } }
      _(cli.send(:suppress_log_output?, opts)).must_equal true
    end

    it "do not suppresses cli" do
      opts = { "reporter" => { "cli" => nil } }
      _(cli.send(:suppress_log_output?, opts)).must_equal false
    end

    it "do not suppresses cli" do
      opts = { "reporter" => { "cli" => nil, "json" => { "file" => "/tmp/json" } } }
      _(cli.send(:suppress_log_output?, opts)).must_equal false
    end
  end

  describe "checks socks5 cli parameters" do
    it "accepts socks_proxy option" do
      options = { "socks_proxy" => "socks5h://proxy-host:1080" }
      cli.send(:configure_logger, options)
      _(options["socks_proxy"]).must_equal "socks5h://proxy-host:1080"
    end

    it "accepts socks_user option" do
      options = { "socks_user" => "proxyuser" }
      cli.send(:configure_logger, options)
      _(options["socks_user"]).must_equal "proxyuser"
    end

    it "accepts socks_password option" do
      options = { "socks_password" => "proxypass" }
      cli.send(:configure_logger, options)
      _(options["socks_password"]).must_equal "proxypass"
    end

    it "accepts kerberos_realm option" do
      options = { "kerberos_realm" => "EXAMPLE.COM" }
      cli.send(:configure_logger, options)
      _(options["kerberos_realm"]).must_equal "EXAMPLE.COM"
    end

    it "accepts kerberos_service option" do
      options = { "kerberos_service" => "HTTP" }
      cli.send(:configure_logger, options)
      _(options["kerberos_service"]).must_equal "HTTP"
    end
  end
end
