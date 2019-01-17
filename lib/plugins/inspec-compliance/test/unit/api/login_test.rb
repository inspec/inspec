require "minitest/autorun"
require "mocha/setup"
require "webmock/minitest"
require_relative "../../../lib/inspec-compliance/api.rb"

describe InspecPlugins::Compliance::API do
  let(:automate_options) do
    {
      "server" => "https://automate.example.com",
      "ent" => "automate",
      "user" => "someone",
      "token" => "token",
    }
  end

  let(:compliance_options) do
    {
      "server" => "https://compliance.example.com",
      "user" => "someone",
      "password" => "password",
      "token" => "token",
      "refresh_token" => "refresh_token",
    }
  end

  let(:fake_config) do
    class FakeConfig
      def initialize
        @config = {}
      end

      def [](key)
        @config[key]
      end

      def []=(key, value)
        @config[key] = value
      end

      def clean
        @config = {}
      end

      def store
        nil
      end
    end

    FakeConfig.new
  end

  describe ".login" do
    describe "when target is a Chef Automate2 server" do
      before do
        InspecPlugins::Compliance::API.expects(:determine_server_type).returns(:automate2)
      end

      it "raises an error if `--user` is missing" do
        options = automate_options
        options.delete("user")
        err = proc { InspecPlugins::Compliance::API.login(options) }.must_raise(ArgumentError)
        err.message.must_match(/Please specify a user.*/)
        err.message.lines.length.must_equal(1)
      end

      it "raises an error if `--token` and `--dctoken` are missing" do
        options = automate_options
        options.delete("token")
        options.delete("dctoken")
        err = proc { InspecPlugins::Compliance::API.login(options) }.must_raise(ArgumentError)
        err.message.must_match(/Please specify a token.*/)
        err.message.lines.length.must_equal(1)
      end

      it "stores an access token" do
        stub_request(:get, automate_options["server"] + "/compliance/version")
          .to_return(status: 200, body: "", headers: {})
        options = automate_options
        InspecPlugins::Compliance::Configuration.expects(:new).returns(fake_config)

        InspecPlugins::Compliance::API.login(options)
        fake_config["automate"]["ent"].must_equal("automate")
        fake_config["automate"]["token_type"].must_equal("dctoken")
        fake_config["user"].must_equal("someone")
        fake_config["server"].must_equal("https://automate.example.com/api/v0")
        fake_config["server_type"].must_equal("automate2")
        fake_config["token"].must_equal("token")
      end
    end

    describe "when target is a Chef Automate server" do
      before do
        InspecPlugins::Compliance::API.expects(:determine_server_type).returns(:automate)
      end

      it "raises an error if `--user` is missing" do
        options = automate_options
        options.delete("user")
        err = proc { InspecPlugins::Compliance::API.login(options) }.must_raise(ArgumentError)
        err.message.must_match(/Please specify a user.*/)
        err.message.lines.length.must_equal(1)
      end

      it "raises an error if `--ent` is missing" do
        options = automate_options
        options.delete("ent")
        err = proc { InspecPlugins::Compliance::API.login(options) }.must_raise(ArgumentError)
        err.message.must_match(/Please specify an enterprise.*/)
        err.message.lines.length.must_equal(1)
      end

      it "raises an error if `--token` and `--dctoken` are missing" do
        options = automate_options
        options.delete("token")
        options.delete("dctoken")
        err = proc { InspecPlugins::Compliance::API.login(options) }.must_raise(ArgumentError)
        err.message.must_match(/Please specify a token.*/)
        err.message.lines.length.must_equal(1)
      end

      it "stores an access token" do
        stub_request(:get, automate_options["server"] + "/compliance/version")
          .to_return(status: 200, body: "", headers: {})
        options = automate_options
        InspecPlugins::Compliance::Configuration.expects(:new).returns(fake_config)

        InspecPlugins::Compliance::API.login(options)
        fake_config["automate"]["ent"].must_equal("automate")
        fake_config["automate"]["token_type"].must_equal("usertoken")
        fake_config["user"].must_equal("someone")
        fake_config["server"].must_equal("https://automate.example.com/compliance")
        fake_config["server_type"].must_equal("automate")
        fake_config["token"].must_equal("token")
      end
    end

    describe "when target is a Chef Compliance server" do
      before do
        InspecPlugins::Compliance::API.expects(:determine_server_type).returns(:compliance)
      end

      it "raises an error if `--user` and `--refresh-token` are missing" do
        options = automate_options
        options.delete("user")
        options.delete("refresh_token")
        err = proc { InspecPlugins::Compliance::API.login(options) }.must_raise(ArgumentError)
        err.message.must_match(/Please specify a.*--user.*--refresh-token.*/)
        err.message.lines.length.must_equal(1)
      end

      it "raises an error if `--user` is present but authentication method missing" do
        options = automate_options
        options.delete("password")
        options.delete("token")
        options.delete("refresh_token")
        err = proc { InspecPlugins::Compliance::API.login(options) }.must_raise(ArgumentError)
        err.message.must_match(/Please specify.*--password.*--token.*--refresh-token.*/)
        err.message.lines.length.must_equal(1)
      end

      it "stores an access token" do
        stub_request(:get, compliance_options["server"] + "/api/version")
          .to_return(status: 200, body: "", headers: {})
        options = compliance_options
        InspecPlugins::Compliance::Configuration.expects(:new).returns(fake_config)

        InspecPlugins::Compliance::API.login(options)
        fake_config["user"].must_equal("someone")
        fake_config["server"].must_equal("https://compliance.example.com/api")
        fake_config["server_type"].must_equal("compliance")
        fake_config["token"].must_equal("token")
      end
    end

    describe "when target is neither a Chef Compliance nor Chef Automate server" do
      it "raises an error if `https://SERVER` is missing" do
        options = {}
        err = proc { InspecPlugins::Compliance::API.login(options) }.must_raise(ArgumentError)
        err.message.must_match(/Please specify a server.*/)
        err.message.lines.length.must_equal(1)
      end

      it "rasies a `CannotDetermineServerType` error" do
        InspecPlugins::Compliance::API.expects(:determine_server_type).returns(nil)
        err = proc { InspecPlugins::Compliance::API.login(automate_options) }.must_raise(StandardError)
        err.message.must_match(/Unable to determine/)
      end
    end
  end
end
