require "helper"

describe Inspec::CachedFetcher do
  describe "when original fetcher is Compliance::Fetcher" do
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
         "inputs" => [],
         "latest_version" => "" }]
    end
    before do
      Compliance::Configuration.expects(:new).returns({ "token" => "123abc", "server" => "https://a2.instance.com" })
    end

    it "downloads the profile from the compliance service when sha256 not in the cache" do
      prof = profiles_result[0]
      Compliance::API.stubs(:profiles).returns(["success", profiles_result])
      cache = Inspec::Cache.new
      entry_path = cache.base_path_for(prof["sha256"])
      mock_fetch = Minitest::Mock.new
      mock_fetch.expect :call, "#{entry_path}.tar.gz", [entry_path]
      cf = Inspec::CachedFetcher.new("compliance://#{prof['owner']}/#{prof['name']}", cache)
      cache.stubs(:exists?).with(prof["sha256"]).returns(false)
      cf.fetcher.stub(:fetch, mock_fetch) do
        cf.fetch
      end
      mock_fetch.verify
    end

    it "does not download the profile when the sha256 exists in the inspec cache" do
      prof = profiles_result[0]
      Compliance::API.stubs(:profiles).returns(["success", profiles_result])
      cache = Inspec::Cache.new
      entry_path = cache.base_path_for(prof["sha256"])
      mock_prefered_entry_for = Minitest::Mock.new
      mock_prefered_entry_for.expect :call, entry_path, [prof["sha256"]]
      cf = Inspec::CachedFetcher.new("compliance://#{prof['owner']}/#{prof['name']}", cache)
      cache.stubs(:exists?).with(prof["sha256"]).returns(true)
      cache.stub(:prefered_entry_for, mock_prefered_entry_for) do
        cf.fetch
      end
      mock_prefered_entry_for.verify
    end
  end
end
