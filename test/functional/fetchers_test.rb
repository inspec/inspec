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

    def assert_fetcher_failed_cleanly(run_result, error_regex, profile_location)
      _(run_result.stdout).must_be_empty
      _(run_result.stderr).wont_match looks_like_a_stacktrace
      _(run_result.stderr).must_match(error_regex)
      _(run_result.stderr).must_include profile_location
      assert_exit_code(1, run_result)
    end

    describe "when using the local fetcher on a bad dep" do
      let(:path) { "#{fetcher_profiles}/local-bad" }
      it "should throw an exception not a stacktrace" do
        assert_fetcher_failed_cleanly(
          run_result,
          /Profile dependency local path .+ does not exist/,
          "fetcher-failures/nonesuch"
        )
      end
    end

    describe "when using the url fetcher on a bad dep" do
      let(:path) { "#{fetcher_profiles}/url-bad" }
      it "should throw an exception not a stacktrace" do
        assert_fetcher_failed_cleanly(
          run_result,
          /Profile URL dependency .+ could not be fetched:/,
          "https://localhost/inspec/inspec-nonesuch/path/to/profile.tgz"
        )
      end
    end

    describe "when using the url fetcher on a bad dep" do
      let(:path) { "#{fetcher_profiles}/git-bad" }
      it "should throw an exception not a stacktrace" do
        assert_fetcher_failed_cleanly(
          run_result,
          /Profile git dependency failed for .+ Connection refused/,
          "http://localhost/no/such"
        )
      end
    end

  end
end
