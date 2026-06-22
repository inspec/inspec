require "helper"

require "inspec/plugin/v2"
require "inspec/cached_fetcher"
require "plugins/inspec-compliance/lib/inspec-compliance"
require "inspec/dependencies/cache"

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
      InspecPlugins::Compliance::Configuration.expects(:new).returns({ "token" => "123abc", "server" => "https://a2.instance.com" })
    end

    it "downloads the profile from the compliance service when sha256 not in the cache" do
      prof = profiles_result[0]
      InspecPlugins::Compliance::API.stubs(:profiles).returns(["success", profiles_result])
      cache = Inspec::Cache.new
      entry_path = cache.base_path_for(prof["sha256"])
      mock_fetch = Minitest::Mock.new
      mock_fetch.expect :call, "#{entry_path}.tar.gz", [entry_path]
      cf = Inspec::CachedFetcher.new("compliance://#{prof["owner"]}/#{prof["name"]}", cache)
      cache.stubs(:exists?).with(prof["sha256"]).returns(false)
      cf.fetcher.stub(:fetch, mock_fetch) do
        cf.fetch
      end
      mock_fetch.verify
    end

    it "does not download the profile when the sha256 exists in the inspec cache" do
      prof = profiles_result[0]
      InspecPlugins::Compliance::API.stubs(:profiles).returns(["success", profiles_result])
      cache = Inspec::Cache.new
      entry_path = cache.base_path_for(prof["sha256"])
      mock_prefered_entry_for = Minitest::Mock.new
      mock_prefered_entry_for.expect :call, entry_path, [prof["sha256"]]
      cf = Inspec::CachedFetcher.new("compliance://#{prof["owner"]}/#{prof["name"]}", cache)
      cache.stubs(:exists?).with(prof["sha256"]).returns(true)
      cache.stub(:prefered_entry_for, mock_prefered_entry_for) do
        cf.fetch
      end
      mock_prefered_entry_for.verify
    end
  end

  describe "permission error handling during fetch" do
    let(:target) { "https://example.com/profile.tar.gz" }
    let(:cache) { Inspec::Cache.new }
    let(:mock_fetcher) { mock("fetcher") }
    let(:cached_fetcher) { Inspec::CachedFetcher.new(target, cache) }

    before do
      Inspec::Fetcher::Registry.stubs(:resolve).with(target, {}).returns(mock_fetcher)
      mock_fetcher.stubs(:cache_key).returns("test_key")
      cache.stubs(:exists?).with("test_key").returns(false)
      cache.stubs(:base_path_for).with("test_key").returns("/tmp/test_path")
    end

    it "handles Errno::EACCES permission errors gracefully" do
      error = Errno::EACCES.new("Permission denied")
      mock_fetcher.expects(:fetch).with("/tmp/test_path").raises(error)

      Inspec::Log.expects(:error).with("Permission error while fetching #{target}: #{error.message}")

      err = _ { cached_fetcher.fetch }.must_raise Inspec::FetcherFailure
      _(err.message).must_include "Failed to fetch profile due to permission error"
      _(err.message).must_include error.message
    end

    it "handles Errno::EPERM operation not permitted errors gracefully" do
      error = Errno::EPERM.new("Operation not permitted")
      mock_fetcher.expects(:fetch).with("/tmp/test_path").raises(error)

      Inspec::Log.expects(:error).with("Permission error while fetching #{target}: #{error.message}")

      err = _ { cached_fetcher.fetch }.must_raise Inspec::FetcherFailure
      _(err.message).must_include "Failed to fetch profile due to permission error"
      _(err.message).must_include error.message
    end

    it "does not interfere with successful fetches" do
      mock_fetcher.expects(:fetch).with("/tmp/test_path")
      mock_fetcher.stubs(:archive_path).returns("/tmp/archive_path")
      mock_fetcher.stubs(:writable?).returns(true)
      mock_fetcher.stubs(:resolved_source).returns({})

      result = cached_fetcher.fetch
      _(result).must_equal ["/tmp/archive_path", true]
    end

    it "does not catch other types of exceptions" do
      error = StandardError.new("Different error")
      mock_fetcher.expects(:fetch).with("/tmp/test_path").raises(error)

      _ { cached_fetcher.fetch }.must_raise StandardError
    end

    it "still calls assert_cache_sanity! after successful fetch" do
      mock_fetcher.expects(:fetch).with("/tmp/test_path")
      mock_fetcher.stubs(:archive_path).returns("/tmp/archive_path")
      mock_fetcher.stubs(:writable?).returns(true)
      mock_fetcher.stubs(:resolved_source).returns({})

      # Mock the private method call to verify it's called
      cached_fetcher.expects(:assert_cache_sanity!)

      cached_fetcher.fetch
    end
  end

  describe "permission error handling with target containing sha256" do
    let(:target) { { url: "https://example.com/profile.tar.gz", sha256: "abc123" } }
    let(:cache) { Inspec::Cache.new }
    let(:mock_fetcher) { mock("fetcher") }
    let(:cached_fetcher) { Inspec::CachedFetcher.new(target, cache) }

    before do
      Inspec::Fetcher::Registry.stubs(:resolve).with(target, {}).returns(mock_fetcher)
      mock_fetcher.stubs(:cache_key).returns("test_key")
      cache.stubs(:exists?).with("abc123").returns(false)
      cache.stubs(:base_path_for).with("test_key").returns("/tmp/test_path")
    end

    it "handles permission errors with hash targets" do
      error = Errno::EACCES.new("Access denied")
      mock_fetcher.expects(:fetch).with("/tmp/test_path").raises(error)

      Inspec::Log.expects(:error).with("Permission error while fetching #{target}: #{error.message}")

      err = _ { cached_fetcher.fetch }.must_raise Inspec::FetcherFailure
      _(err.message).must_include "Failed to fetch profile due to permission error"
      _(err.message).must_include error.message
    end
  end

  describe "fetch method behavior" do
    let(:target) { "https://example.com/profile.tar.gz" }
    let(:cache) { Inspec::Cache.new }
    let(:mock_fetcher) { mock("fetcher") }
    let(:cached_fetcher) { Inspec::CachedFetcher.new(target, cache) }

    before do
      Inspec::Fetcher::Registry.stubs(:resolve).with(target, {}).returns(mock_fetcher)
      mock_fetcher.stubs(:cache_key).returns("test_key")
    end

    it "returns cached entry when cache exists" do
      cache.stubs(:exists?).with("test_key").returns(true)
      cache.stubs(:prefered_entry_for).with("test_key").returns("/cached/path")

      Inspec::Log.expects(:debug).with("Using cached dependency for #{target}")

      result = cached_fetcher.fetch
      _(result).must_equal ["/cached/path", false]
    end

    it "fetches and returns new entry when cache does not exist" do
      cache.stubs(:exists?).with("test_key").returns(false)
      cache.stubs(:base_path_for).with("test_key").returns("/tmp/test_path")
      mock_fetcher.expects(:fetch).with("/tmp/test_path")
      mock_fetcher.stubs(:archive_path).returns("/tmp/archive_path")
      mock_fetcher.stubs(:writable?).returns(false)
      mock_fetcher.stubs(:resolved_source).returns({})

      Inspec::Log.expects(:debug).with("Dependency does not exist in the cache #{target}")

      result = cached_fetcher.fetch
      _(result).must_equal ["/tmp/archive_path", false]
    end
  end

  describe "error message formatting and logging" do
    let(:target) { "file:///path/to/profile" }
    let(:cache) { Inspec::Cache.new }
    let(:mock_fetcher) { mock("fetcher") }
    let(:cached_fetcher) { Inspec::CachedFetcher.new(target, cache) }

    before do
      Inspec::Fetcher::Registry.stubs(:resolve).with(target, {}).returns(mock_fetcher)
      mock_fetcher.stubs(:cache_key).returns("file_key")
      cache.stubs(:exists?).with("file_key").returns(false)
      cache.stubs(:base_path_for).with("file_key").returns("/cache/path")
    end

    it "formats permission denied error message correctly" do
      error = Errno::EACCES.new("Permission denied")
      mock_fetcher.expects(:fetch).with("/cache/path").raises(error)

      # Verify log message format
      expected_log_msg = "Permission error while fetching #{target}: #{error.message}"
      Inspec::Log.expects(:error).with(expected_log_msg)

      # Verify exception message format
      err = _ { cached_fetcher.fetch }.must_raise Inspec::FetcherFailure
      _(err.message).must_match(/Failed to fetch profile due to permission error\./)
      _(err.message).must_include("Error: #{error.message}")
    end

    it "preserves original error details in the exception" do
      original_message = "Access is denied. (5)"
      error = Errno::EACCES.new(original_message)
      mock_fetcher.expects(:fetch).with("/cache/path").raises(error)

      Inspec::Log.expects(:error).with("Permission error while fetching #{target}: #{error.message}")

      err = _ { cached_fetcher.fetch }.must_raise Inspec::FetcherFailure
      _(err.message).must_include(original_message)
    end

    it "handles permission errors during Windows file operations" do
      # Simulate Windows-style permission error
      error = Errno::EPERM.new("Operation not permitted")
      mock_fetcher.expects(:fetch).with("/cache/path").raises(error)

      Inspec::Log.expects(:error).with("Permission error while fetching #{target}: #{error.message}")

      err = _ { cached_fetcher.fetch }.must_raise Inspec::FetcherFailure
      _(err.message).must_include("Failed to fetch profile due to permission error")
      _(err.class).must_equal(Inspec::FetcherFailure)
    end
  end

  describe "cache_key method behavior" do
    let(:cache) { Inspec::Cache.new }
    let(:mock_fetcher) { mock("fetcher") }

    it "returns sha256 from target hash when available" do
      target = { url: "https://example.com/profile.tar.gz", sha256: "abc123def456" }
      Inspec::Fetcher::Registry.stubs(:resolve).with(target, {}).returns(mock_fetcher)

      cached_fetcher = Inspec::CachedFetcher.new(target, cache)
      _(cached_fetcher.cache_key).must_equal "abc123def456"
    end

    it "returns ref from target hash when sha256 not available" do
      target = { url: "https://example.com/profile.git", ref: "main" }
      Inspec::Fetcher::Registry.stubs(:resolve).with(target, {}).returns(mock_fetcher)

      cached_fetcher = Inspec::CachedFetcher.new(target, cache)
      _(cached_fetcher.cache_key).must_equal "main"
    end

    it "delegates to fetcher.cache_key when target has no sha256 or ref" do
      target = "https://example.com/profile.tar.gz"
      Inspec::Fetcher::Registry.stubs(:resolve).with(target, {}).returns(mock_fetcher)
      mock_fetcher.stubs(:cache_key).returns("fetcher_generated_key")

      cached_fetcher = Inspec::CachedFetcher.new(target, cache)
      _(cached_fetcher.cache_key).must_equal "fetcher_generated_key"
    end

    it "uses correct cache_key for permission error handling" do
      target = { url: "https://example.com/profile.tar.gz", sha256: "test_sha" }
      Inspec::Fetcher::Registry.stubs(:resolve).with(target, {}).returns(mock_fetcher)
      mock_fetcher.stubs(:cache_key).returns("fetcher_key")
      cache.stubs(:exists?).with("test_sha").returns(false)
      cache.stubs(:base_path_for).with("fetcher_key").returns("/cache/path")

      error = Errno::EACCES.new("Permission denied")
      mock_fetcher.expects(:fetch).with("/cache/path").raises(error)
      Inspec::Log.expects(:error).with("Permission error while fetching #{target}: #{error.message}")

      cached_fetcher = Inspec::CachedFetcher.new(target, cache)
      _ { cached_fetcher.fetch }.must_raise Inspec::FetcherFailure
    end
  end
end
