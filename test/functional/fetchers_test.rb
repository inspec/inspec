require "functional/helper"

describe "the fetchers" do
  parallelize_me!

  include FunctionalHelper

  let(:looks_like_a_stacktrace) { %r{lib/inspec/.+\.rb:\d+:in} }
  let(:invocation) { "exec #{path} --no-create-lockfile" }
  let(:run_result) { inspec(invocation) }
  let(:fetcher_profiles) { "#{profile_path}/fetcher-failures" }

  # Refs #4726
  describe "when fetchers fetch a bad dependency" do
    def assert_fetcher_failed_cleanly(run_result, error_regex, profile_location)
      _(run_result.stdout).must_be_empty
      _(run_result.stderr).wont_match looks_like_a_stacktrace
      _(run_result.stderr).must_match(error_regex)
      _(run_result.stderr).must_include profile_location
      assert_exit_code(1, run_result)
    end

    describe "when using the local fetcher on a bad dep" do
      let(:path) { "#{fetcher_profiles}/local-bad" }
      it "should throw an exception not a stacktrace with a local fetcher" do
        assert_fetcher_failed_cleanly(
          run_result,
          /Profile dependency local path .+ does not exist/,
          "fetcher-failures/nonesuch"
        )
      end
    end

    describe "when using the url fetcher on a bad dep" do
      let(:path) { "#{fetcher_profiles}/url-bad" }
      it "should throw an exception not a stacktrace with a url fetcher" do
        assert_fetcher_failed_cleanly(
          run_result,
          /Profile URL dependency .+ could not be fetched:/,
          "https://localhost.invalid/inspec/inspec-nonesuch/path/to/profile.tgz"
        )
      end
    end

    describe "when using the git fetcher on a bad dep" do
      let(:path) { "#{fetcher_profiles}/git-bad" }
      it "should throw an exception not a stacktrace with a git fetcher" do
        assert_fetcher_failed_cleanly(
          run_result,
          /Profile git dependency failed for .+ Could not resolve host.+/,
          "http://localhost.invalid/no/such"
        )
      end
    end

  end

  # Refs #4727
  describe "when a archive is available of an unfetchable profile with --airgap" do

    let(:invocation) { "archive #{fetcher_profiles}/#{profile_name} --airgap" }

    def teardown
      FileUtils.rm_rf "#{fetcher_profiles}/#{profile_name}/vendor"
      FileUtils.rm_f "#{profile_name}-0.1.0.tar.gz"
    end

    def assert_archive_worked(run_result)
      _(run_result.stderr).must_be_empty
      _(run_result.stdout).must_include "Finished archive generation"
      assert_exit_code(0, run_result)
    end

    describe "when using a local fetcher" do
      let(:profile_name) { "local-dep-on-bad-local-archive" }
      it "should be able to create a new archive wrapping the profile" do
        assert_archive_worked(run_result)
      end
    end

    describe "when using a git fetcher" do
      let(:profile_name) { "local-dep-on-bad-git-archive" }
      it "should be able to create a new archive wrapping the profile" do
        assert_archive_worked(run_result)
      end
    end

    describe "when using a url fetcher" do
      let(:profile_name) { "local-dep-on-bad-url-archive" }
      it "should be able to create a new archive wrapping the profile" do
        assert_archive_worked(run_result)
      end
    end

    if ENV["CI_ENABLE_AUTOMATE_FETCHER"] then
      # To develop on this test, setup an Automate server, run
      # `inspec compliance login`, and upload two profiles to the admin account:
      # test/fixtures/profiles/fetcher-failures/{basic,auto-dep-on-missing}
      describe "when using a compliance fetcher" do
        let(:profile_name) { "local-dep-on-bad-auto-archive" }
        it "should be able to create a new archive wrapping the profile" do
          assert_archive_worked(run_result)
        end
      end
    end
  end
end
