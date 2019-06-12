require "minitest/autorun"
require "mocha/setup"
require_relative "../../lib/inspec-compliance/api.rb"

describe InspecPlugins::Compliance::Fetcher do
  let(:config) { { "server" => "myserver" } }

  describe "the check_compliance_token method" do
    let(:fetcher) { InspecPlugins::Compliance::Fetcher.new("a/bad/url", config) }

    it "returns without error if token is set" do
      config["token"] = "my-token"
      fetcher.class.check_compliance_token("http://test.com", config)
    end

    it "returns an error when token is not set" do
      ex = assert_raises(Inspec::FetcherFailure) { fetcher.class.check_compliance_token("http://test.com", config) }
      ex.message.must_include "Cannot fetch http://test.com because your compliance token has not been\nconfigured."
    end
  end

  describe "when the server is an automate2 server" do
    before { InspecPlugins::Compliance::API.expects(:is_automate2_server?).with(config).returns(true) }

    it "returns the correct owner and profile name" do
      config["profile"] = ["admin", "ssh-baseline", nil]
      fetcher = InspecPlugins::Compliance::Fetcher.new("myserver/profile", config)
      fetcher.send(:compliance_profile_name).must_equal "admin/ssh-baseline"
    end
  end

  describe "when the server is an automate server pre-0.8.0" do
    before { InspecPlugins::Compliance::API.expects(:is_automate_server_pre_080?).with(config).returns(true) }

    it "returns the correct profile name when the url is correct" do
      fetcher = InspecPlugins::Compliance::Fetcher.new("myserver/myowner/myprofile/tar", config)
      fetcher.send(:compliance_profile_name).must_equal "myowner/myprofile"
    end

    it "raises an exception if the url is malformed" do
      fetcher = InspecPlugins::Compliance::Fetcher.new("a/bad/url", config)
      proc { fetcher.send(:compliance_profile_name) }.must_raise RuntimeError
    end
  end

  describe "when the server is an automate server 0.8.0-or-later" do
    before do
      InspecPlugins::Compliance::API.expects(:is_automate_server_pre_080?).with(config).returns(false)
      InspecPlugins::Compliance::API.expects(:is_automate_server_080_and_later?).with(config).returns(true)
    end

    it "returns the correct profile name when the url is correct" do
      fetcher = InspecPlugins::Compliance::Fetcher.new("myserver/profiles/myowner/myprofile/tar", config)
      fetcher.send(:compliance_profile_name).must_equal "myowner/myprofile"
    end

    it "raises an exception if the url is malformed" do
      fetcher = InspecPlugins::Compliance::Fetcher.new("a/bad/url", config)
      proc { fetcher.send(:compliance_profile_name) }.must_raise RuntimeError
    end
  end

  describe "when the server is not an automate server (likely a compliance server)" do
    before do
      InspecPlugins::Compliance::API.expects(:is_automate_server_pre_080?).with(config).returns(false)
      InspecPlugins::Compliance::API.expects(:is_automate_server_080_and_later?).with(config).returns(false)
    end

    it "returns the correct profile name when the url is correct" do
      fetcher = InspecPlugins::Compliance::Fetcher.new("myserver/owners/myowner/compliance/myprofile/tar", config)
      fetcher.send(:compliance_profile_name).must_equal "myowner/myprofile"
    end

    it "raises an exception if the url is malformed" do
      fetcher = InspecPlugins::Compliance::Fetcher.new("a/bad/url", config)
      proc { fetcher.send(:compliance_profile_name) }.must_raise RuntimeError
    end
  end

  describe "when the server calls an automate profile" do
    let(:profiles_result) do
      [{ "name" => "ssh-baseline",
         "title" => "InSpec Profile",
         "maintainer" => "The Authors",
         "copyright" => "The Authors",
         "copyright_email" => "you@example.com",
         "license" => "Apache-2.0",
         "summary" => "An InSpec Compliance Profile",
         "version" => "0.1.1",
         "owner" => "admin",
         "supports" => [],
         "depends" => [],
         "sha256" => "132j1kjdasfasdoaefaewo12312",
         "groups" => [],
         "controls" => [],
         "attributes" => [],
         "latest_version" => "" }]
    end
    before do
      InspecPlugins::Compliance::Configuration.expects(:new).returns({ "token" => "123abc", "server" => "https://a2.instance.com" })
    end

    it "returns the correct profile name when parsing url" do
      InspecPlugins::Compliance::API.stubs(:profiles).returns(["success", profiles_result])
      fetcher = InspecPlugins::Compliance::Fetcher.resolve("compliance://admin/ssh-baseline")
      assert = ["admin", "ssh-baseline", nil]
      fetcher.instance_variable_get(:"@config")["profile"].must_equal assert
    end

    it "returns the correct profile name when parsing compliance hash" do
      InspecPlugins::Compliance::API.stubs(:profiles).returns(["success", profiles_result])
      hash = {
        target: "https://a2.instance.com/api/v0/compliance/tar",
        compliance: "admin/ssh-baseline",
        sha256: "132j1kjdasfasdoaefaewo12312",
      }
      fetcher = InspecPlugins::Compliance::Fetcher.resolve(hash)
      assert = ["admin", "ssh-baseline", nil]
      fetcher.instance_variable_get(:"@config")["profile"].must_equal assert
    end
  end

  describe "when the server provides a sha256 in the profiles_result" do
    let(:profiles_result) do
      [{ "name" => "ssh-baseline",
         "title" => "InSpec Profile",
         "maintainer" => "The Authors",
         "copyright" => "The Authors",
         "copyright_email" => "you@example.com",
         "license" => "Apache-2.0",
         "summary" => "An InSpec Compliance Profile",
         "version" => "0.1.1",
         "owner" => "admin",
         "supports" => [],
         "depends" => [],
         "sha256" => "132j1kjdasfasdoaefaewo12312",
         "groups" => [],
         "controls" => [],
         "attributes" => [],
         "latest_version" => "" }]
    end

    before do
      InspecPlugins::Compliance::Configuration.expects(:new).returns({ "token" => "123abc", "server" => "https://a2.instance.com" })
    end

    it "contains the upstream_sha256" do
      InspecPlugins::Compliance::API.stubs(:profiles).returns(["success", profiles_result])
      prof = profiles_result[0]
      target = "compliance://#{prof['owner']}/#{prof['name']}"
      fetcher = InspecPlugins::Compliance::Fetcher.resolve(target)
      fetcher.upstream_sha256.must_equal prof["sha256"]
    end
  end
end
