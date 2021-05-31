require "minitest/autorun"
require "mocha/minitest"
require "webmock/minitest"
require_relative "../../../lib/inspec-compliance/api"

describe InspecPlugins::Compliance::API do
  let(:automate_options) do
    {
      "server" => "https://automate.example.com",
      "ent" => "automate",
      "user" => "someone",
      "token" => "token",
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

      it "raises an error if `--user` is missing" do
        options = automate_options
        options.delete("user")
        err = _ { InspecPlugins::Compliance::API.login(options) }.must_raise(ArgumentError)
        _(err.message).must_match(/Please specify a user.*/)
        _(err.message.lines.length).must_equal(1)
      end

      it "raises an error if `--token` and `--dctoken` are missing" do
        options = automate_options
        options.delete("token")
        options.delete("dctoken")
        err = _ { InspecPlugins::Compliance::API.login(options) }.must_raise(ArgumentError)
        _(err.message).must_match(/Please specify a token.*/)
        _(err.message.lines.length).must_equal(1)
      end

      it "stores an access token" do
        stub_request(:get, automate_options["server"] + "/api/v0/version")
          .to_return(status: 200, body: "", headers: {})
        options = automate_options
        InspecPlugins::Compliance::Configuration.expects(:new).returns(fake_config)
        InspecPlugins::Compliance::API.login(options)
        _(fake_config["automate"]["ent"]).must_equal("automate")
        _(fake_config["automate"]["token_type"]).must_equal("dctoken")
        _(fake_config["user"]).must_equal("someone")
        _(fake_config["server"]).must_equal("https://automate.example.com/api/v0")
        _(fake_config["server_type"]).must_equal("automate2")
        _(fake_config["token"]).must_equal("token")
      end

      it "puts error message when api-token is invalid" do
        stub_body = { "error": "request not authenticated", "code": 16, "message": "request not authenticated", "details": [] }.to_json
        stub_request(:get, automate_options["server"] + "/api/v0/version")
          .to_return(status: 401, body: stub_body, headers: {})
        options = automate_options
        res = InspecPlugins::Compliance::API.login(options)
        _(res).must_equal(
          "Failed to authenticate to https://automate.example.com/api/v0 \n"\
        "Response code: 401\nBody: {\"error\":\"request not authenticated\",\"code\":16,\"message\":\"request not authenticated\",\"details\":[]}"
        )
      end
    end

    describe "when target is neither a Chef Compliance nor Chef Automate server" do
      it "raises an error if `https://SERVER` is missing" do
        options = {}
        err = _ { InspecPlugins::Compliance::API.login(options) }.must_raise(ArgumentError)
        _(err.message).must_match(/Please specify a server.*/)
        _(err.message.lines.length).must_equal(1)
      end
    end
  end
end
