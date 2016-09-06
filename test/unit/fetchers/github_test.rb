# encoding: utf-8

require 'helper'
require 'uri'
require 'vcr'

describe Fetchers::Github do
  let(:fetcher) { Fetchers::Github }
  let(:ref_for_test) { "0ca497e333a3222e4b517bc3ebe43eba01986c4c" }
  let(:tag_ref_for_test) { "202d4e0f97b5dc2b88df13d686eae36320a5a53c" }
  let(:uri_without_spec) { URI.parse("github://chef/inspec") }
  let(:uri_with_branch) { URI.parse("github://chef/inspec/branch/master") }
  let(:uri_with_tag) { URI.parse("github://chef/inspec/tag/v0.32.0") }
  let(:uri_with_ref) { URI.parse("github://chef/inspec/ref/#{ref_for_test}") }

  VCR.configure do |config|
    config.cassette_library_dir = "test/fixtures/vcr_cassettes"
    config.hook_into :webmock
  end

  it 'registers with the fetchers registry' do
    reg = Inspec::Fetcher.registry
    reg['github'].must_equal fetcher
  end

  it "transforms a github url to an https url" do
    VCR.use_cassette("github", :record => :new_episodes) do
      f = fetcher.new(uri_without_spec)
      f.expanded_target.must_match(/^https/)
    end
  end

  it "transforms a github url with no branch, tag, or ref to an https pointing at master" do
    VCR.use_cassette("github", :record => :new_episodes) do
      f1 = fetcher.new(uri_without_spec)
      f2 = fetcher.new(uri_with_branch)
      f1.expanded_target.must_equal f2.expanded_target
    end
  end

  it "transforms a github url with a branch to a tarball of an exact sha" do
    VCR.use_cassette("github", :record => :new_episodes) do
      f = fetcher.new(uri_with_branch)
      # We don't know what master of inspec will point to.  We can clean
      # this up if we mock out the API responses from Octocat
      f.expanded_target.must_match(/[0-9a-z]{40}.tar.gz$/)
    end
  end

  it "transforms a github url with a ref to a tarball of an exact sha" do
    VCR.use_cassette("github", :record => :new_episodes) do
      f = fetcher.new(uri_with_tag)
      f.expanded_target.must_equal("https://github.com/chef/inspec/archive/#{tag_ref_for_test}.tar.gz")
    end
  end

  it "transforms a github url with a ref to a tarball of that same ref" do
    VCR.use_cassette("github", :record => :new_episodes) do
      f = fetcher.new(uri_with_ref)
      f.expanded_target.must_equal("https://github.com/chef/inspec/archive/#{ref_for_test}.tar.gz")
    end
  end

  describe "resolve" do
    it "handles our temporary api" do
      VCR.use_cassette("github", :record => :new_episodes) do
        source = "github://chef/inspec"
        r = fetcher.resolve(source)
        r.wont_be_nil
      end
    end
  end
end
