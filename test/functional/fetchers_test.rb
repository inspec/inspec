require "functional/helper"

describe "the fetchers" do
  parallelize_me!
  include FunctionalHelper

  let(:looks_like_a_stacktrace) { %r{lib/inspec/.+\.rb:\d+:in} }
  let(:invocation) { "exec #{path} --no-create-lockfile" }
  let(:run_result) { inspec(invocation) }

  # Refs #4726
  describe "when fetchers fetch a bad dependency" do
    let(:fetcher_profiles) { "#{profile_path}/fetcher-failures" }

    describe "when using the local fetcher on a bad dep" do
      let(:path) { "#{fetcher_profiles}/local-bad" }
      it "should throw an exception not a stacktrace" do
        _(run_result.stdout).must_be_empty
        _(run_result.stderr).wont_match looks_like_a_stacktrace
        _(run_result.stderr).must_match(/Profile dependency local path .+ does not exist/)
        _(run_result.stderr).must_include "fetcher-failures/nonesuch" # path of the missing profile in message
        assert_exit_code(1, run_result)
      end
    end

    describe "when using the url fetcher on a bad dep" do
      let(:path) { "#{fetcher_profiles}/url-bad" }
      it "should throw an exception not a stacktrace" do
        _(run_result.stdout).must_be_empty
        _(run_result.stderr).wont_match looks_like_a_stacktrace
        _(run_result.stderr).must_match(/Profile URL dependency .+ could not be fetched:/)
        _(run_result.stderr).must_include "https://localhost/inspec/inspec-nonesuch/path/to/profile.tgz" # URL of the missing profile in message
        assert_exit_code(1, run_result)
      end
    end

    describe "when using the url fetcher on a bad dep" do
      let(:path) { "#{fetcher_profiles}/git-bad" }
      it "should throw an exception not a stacktrace" do
        _(run_result.stdout).must_be_empty
        _(run_result.stderr).wont_match looks_like_a_stacktrace
        _(run_result.stderr).must_match(/Profile git dependency failed for .+ Connection refused/)
        _(run_result.stderr).must_include "http://localhost/no/such" # URL of the missing profile in message
        assert_exit_code(1, run_result)
      end
    end

  end
end
