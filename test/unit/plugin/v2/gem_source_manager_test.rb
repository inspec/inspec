# frozen_string_literal: true
require "helper"

require "inspec/plugin/v2/gem_source_manager"

class TestGemSourceManager < Minitest::Test
  def setup
    Gem.sources.clear
    @gem_source_manager = Inspec::Plugin::V2::GemSourceManager.instance
  end

  def test_add_chef_rubygems_server
    ChefLicensing.stub(:license_keys, ["test-license"]) do
      expected_server = "https://v1:test-license@rubygems.chef.io"
      @gem_source_manager.add_chef_rubygems_server
      assert_includes mapped_uri_string, expected_server
    end
  end

  def test_add_single_source
    source = "https://custom.source.com"
    @gem_source_manager.add(source)
    assert_includes mapped_uri_string, source
  end

  def test_add_multiple_sources
    sources = ["https://source1.com", "https://source2.com"]
    @gem_source_manager.add(sources)
    sources.each do |source|
      assert_includes mapped_uri_string, source
    end
  end

  def test_chef_rubygems_server_url_format
    ChefLicensing.stub(:license_keys, %w{test-license-1 test-license-2}) do
      expected_url = "https://v1:test-license-1,test-license-2@rubygems.chef.io"
      assert_equal expected_url, @gem_source_manager.send(:chef_rubygems_server)
    end
  end

  def test_no_duplicate_sources
    source = "https://unique.source.com"
    @gem_source_manager.add(source)
    @gem_source_manager.add(source)
    sources = mapped_uri_string
    assert_equal sources.count(source), 1
  end

  def test_licenses_string_handles_error
    # Test that licenses_string returns empty string when ChefLicensing.license_keys raises an error
    ChefLicensing.stub(:license_keys, -> { raise StandardError, "Licensing error" }) do
      result = @gem_source_manager.send(:licenses_string)
      assert_equal "", result
    end
  end

  def test_chef_rubygems_server_returns_nil_when_licenses_string_empty
    # Test that chef_rubygems_server returns nil when licenses_string is empty (due to error)
    ChefLicensing.stub(:license_keys, -> { raise StandardError, "Licensing error" }) do
      result = @gem_source_manager.send(:chef_rubygems_server)
      assert_nil result
    end
  end

  def test_add_chef_rubygems_server_handles_licensing_error
    # Test that add_chef_rubygems_server doesn't add a source when licensing fails
    initial_sources_count = Gem.sources.sources.length

    ChefLicensing.stub(:license_keys, -> { raise StandardError, "Licensing error" }) do
      @gem_source_manager.add_chef_rubygems_server
      # Should not add any new sources since chef_rubygems_server returns nil
      assert_equal initial_sources_count, Gem.sources.sources.length
    end
  end

  def mapped_uri_string
    Gem.sources.sources.map { _1.uri.to_s }
  end
end


