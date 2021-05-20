require "minitest/autorun"
require "webmock/minitest"
require "mocha/minitest"
require_relative "../../lib/inspec-compliance/api"

describe InspecPlugins::Compliance::API do
  let(:profiles_response) do
    { "profiles":
      [{ "name" => "apache-baseline",
        "title" => "DevSec Apache Baseline",
        "maintainer" => "DevSec Hardening Framework Team",
        "copyright" => "DevSec Hardening Framework Team",
        "copyright_email" => "hello@dev-sec.io",
        "license" => "Apache 2 license",
        "summary" => "Test-suite for best-practice apache hardening",
        "version" => "2.0.2",
        "supports" => [{ "os-family" => "unix" }],
        "depends" => nil,
        "owner_id" => "admin" },
      { "name" => "apache-baseline",
        "title" => "DevSec Apache Baseline",
        "maintainer" => "Hardening Framework Team",
        "copyright" => "Hardening Framework Team",
        "copyright_email" => "hello@dev-sec.io",
        "license" => "Apache 2 license",
        "summary" => "Test-suite for best-practice apache hardening",
        "version" => "2.0.1",
        "supports" => [{ "os-family" => "unix" }],
        "depends" => nil,
        "latest_version" => "2.0.2",
        "owner_id" => "admin" },
      { "name" => "cis-aix-5.3-6.1-level1",
        "title" => "CIS AIX 5.3 and AIX 6.1 Benchmark Level 1",
        "maintainer" => "Chef Software, Inc.",
        "copyright" => "Chef Software, Inc.",
        "copyright_email" => "support@chef.io",
        "license" => "Proprietary, All rights reserved",
        "summary" => "CIS AIX 5.3 and AIX 6.1 Benchmark Level 1 translated from SCAP",
        "version" => "1.1.0",
        "supports" => nil,
        "depends" => nil,
        "latest_version" => "1.1.0-3",
        "owner_id" => "admin" }],
    }
  end

  describe ".version" do
    let(:headers) { "test-headers" }
    let(:config) do
      {
        "server" => "myserver",
        "insecure" => true,
      }
    end

    before do
      InspecPlugins::Compliance::API.expects(:get_headers).returns(headers)
    end

    describe "when a 404 is received" do
      it "should return an empty hash" do
        response = mock
        response.stubs(:code).returns("404")
        InspecPlugins::Compliance::HTTP.expects(:get).with("myserver/version", "test-headers", true).returns(response)
        _(InspecPlugins::Compliance::API.version(config)).must_equal({})
      end
    end

    describe "when the returned body is nil" do
      it "should return an empty hash" do
        response = mock
        response.stubs(:code).returns("200")
        response.stubs(:body).returns(nil)
        InspecPlugins::Compliance::HTTP.expects(:get).with("myserver/version", "test-headers", true).returns(response)
        _(InspecPlugins::Compliance::API.version(config)).must_equal({})
      end
    end

    describe "when the returned body is an empty string" do
      it "should return an empty hash" do
        response = mock
        response.stubs(:code).returns("200")
        response.stubs(:body).returns("")
        InspecPlugins::Compliance::HTTP.expects(:get).with("myserver/version", "test-headers", true).returns(response)
        _(InspecPlugins::Compliance::API.version(config)).must_equal({})
      end
    end

    describe "when the returned body has no version key" do
      it "should return an empty hash" do
        response = mock
        response.stubs(:code).returns("200")
        response.stubs(:body).returns('{"api":"compliance"}')
        InspecPlugins::Compliance::HTTP.expects(:get).with("myserver/version", "test-headers", true).returns(response)
        _(InspecPlugins::Compliance::API.version(config)).must_equal({})
      end
    end

    describe "when the returned body has an empty version key" do
      it "should return an empty hash" do
        response = mock
        response.stubs(:code).returns("200")
        response.stubs(:body).returns('{"api":"compliance","version":""}')
        InspecPlugins::Compliance::HTTP.expects(:get).with("myserver/version", "test-headers", true).returns(response)
        _(InspecPlugins::Compliance::API.version(config)).must_equal({})
      end
    end

    describe "when the returned body has a proper version" do
      it "should return an empty hash" do
        response = mock
        response.stubs(:code).returns("200")
        response.stubs(:body).returns('{"api":"compliance","version":"1.2.3"}')
        InspecPlugins::Compliance::HTTP.expects(:get).with("myserver/version", "test-headers", true).returns(response)
        _(InspecPlugins::Compliance::API.version(config)).must_equal({ "version" => "1.2.3", "api" => "compliance" })
      end
    end
  end

  describe ".server_version_from_config" do
    it "returns nil when the config has no version key" do
      config = {}
      _(InspecPlugins::Compliance::API.server_version_from_config(config)).must_be_nil
    end

    it "returns nil when the version value is not a hash" do
      config = { "version" => "123" }
      _(InspecPlugins::Compliance::API.server_version_from_config(config)).must_be_nil
    end

    it "returns nil when the version value is a hash but has no version key inside" do
      config = { "version" => {} }
      _(InspecPlugins::Compliance::API.server_version_from_config(config)).must_be_nil
    end

    it "returns the version if the version value is a hash containing a version" do
      config = { "version" => { "version" => "1.2.3" } }
      _(InspecPlugins::Compliance::API.server_version_from_config(config)).must_equal "1.2.3"
    end
  end

  describe "profile_split" do
    it "handles a profile without version" do
      _(InspecPlugins::Compliance::API.profile_split("admin/apache-baseline")).must_equal ["admin", "apache-baseline", nil]
    end

    it "handles a profile with a version" do
      _(InspecPlugins::Compliance::API.profile_split("admin/apache-baseline#2.0.1")).must_equal ["admin", "apache-baseline", "2.0.1"]
    end
  end

  describe "target_url" do
    it "handles a automate2 profile with and without version" do
      config = InspecPlugins::Compliance::Configuration.new
      config.clean
      config["server_type"] = "automate2"
      config["server"] = "https://myautomate2"
      config["version"] = "1.6.99"
      _(InspecPlugins::Compliance::API.target_url(config, "admin/apache-baseline")).must_equal       "https://myautomate2/compliance/profiles/tar"
      _(InspecPlugins::Compliance::API.target_url(config, "admin/apache-baseline#2.0.2")).must_equal "https://myautomate2/compliance/profiles/tar"
    end
  end

  describe "exist?" do
    it "works with profiles returned by Automate 2" do
      # ruby 2.3.3 has issues running stub_requests properly
      # skipping for that specific version
      return if RUBY_VERSION == "2.3.3"

      config = InspecPlugins::Compliance::Configuration.new
      config.clean
      config["owner"] = "admin"
      config["server_type"] = "automate2"
      config["server"] = "https://myautomate2"
      config["version"] = "1.6.99"
      config["automate"] = { "ent" => "automate", "token_type" => "dctoken" }
      config["version"] = { "api" => "compliance", "version" => "0.8.24" }

      stub_request(:post, "https://myautomate2/compliance/profiles/search")
        .with(
          body: "{\"owner\":\"admin\",\"name\":\"apache-baseline\"}",
          headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "Chef-Delivery-Enterprise" => "automate",
          "User-Agent" => "Ruby",
          "X-Data-Collector-Token" => "",
          }
        )
        .to_return(status: 200, body: profiles_response.to_json, headers: {})

      stub_request(:post, "https://myautomate2/compliance/profiles/search")
        .with(
          body: "{\"owner\":\"admin\",\"name\":\"missing-in-action\"}",
          headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "Chef-Delivery-Enterprise" => "automate",
          "User-Agent" => "Ruby",
          "X-Data-Collector-Token" => "",
          }
        )
        .to_return(status: 200, body: profiles_response.to_json, headers: {})

      _(InspecPlugins::Compliance::API.exist?(config, "admin/apache-baseline")).must_equal true
      _(InspecPlugins::Compliance::API.exist?(config, "admin/apache-baseline#2.0.1")).must_equal true
      _(InspecPlugins::Compliance::API.exist?(config, "admin/apache-baseline#2.0.999")).must_equal false
      _(InspecPlugins::Compliance::API.exist?(config, "admin/missing-in-action")).must_equal false
    end
  end
end
