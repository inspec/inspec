require "functional/helper"
require "fileutils"
require "tmpdir"

describe "running profiles with git-based dependencies" do
  include FunctionalHelper
  let(:git_profiles) { "#{profile_path}/git-fetcher" }
  let(:git_default_main_profile_url) { "https://github.com/inspec/inspec-test-profile-default-main.git" }

  attr_accessor :out

  def inspec(commandline, prefix = nil)
    @stdout = @stderr = nil
    self.out = super
  end

  def stdout
    @stdout ||= out.stdout
      .force_encoding(Encoding::UTF_8)
      .gsub(/\e\[(\d+)(;\d+)*m/, "") # strip ANSI color codes
  end

  def stderr
    @stderr ||= out.stderr
      .force_encoding(Encoding::UTF_8)
      .gsub(/\e\[(\d+)(;\d+)*m/, "") # strip ANSI color codes
  end

  #======================================================================#
  #                         Git Repo Setup
  #======================================================================#
  fixture_repos = %w{basic-local git-repo-01}

  before(:all) do
    skip_windows! # Right now, this is due to symlinking, break executes on L24 <nickchecked>
    # Stacktrace on windows machine:
    # Error:
    #   running profiles with git-based dependencies::running a profile with an ./ relative path dependency#test_0001_should find the top-level profile in the git-referenced child profile and execute that:
    #   Errno::ENOENT: No such file or directory @ apply2files - C:/Users/some/path/inspec/inspec/test/fixtures/profiles/git-fetcher/basic-local/.git
    #       C:/Ruby/lib/ruby/2.6.0/fileutils.rb:1437:in `unlink'
    #       C:/Ruby/lib/ruby/2.6.0/fileutils.rb:1437:in `block in remove_file'
    #       C:/Ruby/lib/ruby/2.6.0/fileutils.rb:1445:in `platform_support'
    #       C:/Ruby/lib/ruby/2.6.0/fileutils.rb:1436:in `remove_file'
    #       C:/Ruby/lib/ruby/2.6.0/fileutils.rb:775:in `remove_file'
    #       C:/Ruby/lib/ruby/2.6.0/fileutils.rb:562:in `block in rm'
    #       C:/Ruby/lib/ruby/2.6.0/fileutils.rb:561:in `each'
    #       C:/Ruby/lib/ruby/2.6.0/fileutils.rb:561:in `rm'
    #       C:/Users/some/path/inspec/inspec/test/functional/git_fetcher_test.rb:31:in `block (3 levels) in <top (required)>'
    #       C:/Users/some/path/inspec/inspec/test/functional/git_fetcher_test.rb:29:in `each'
    #       C:/Users/some/path/inspec/inspec/test/functional/git_fetcher_test.rb:29:in `block (2 levels) in <top (required)>'"

    # We need a git repo for some of the profile test fixtures,
    # but we can't store those directly in git.
    # Here, one approach is to store the .git/ directory under a
    # different name and then symlink to its proper name.
    fixture_repos.each do |profile_name|
      link_src = "#{git_profiles}/#{profile_name}/git-fixture"
      link_dst = "#{git_profiles}/#{profile_name}/.git"
      FileUtils.ln_sf(link_src, link_dst) # -f to tolerate existing links created during manual testing
    end
  end

  after(:all) do
    fixture_repos.each do |profile_name|
      link = "#{git_profiles}/#{profile_name}/.git"
      FileUtils.rm(link)
    end
  end

  #======================================================================#
  #                        Custom Local Assertions
  #======================================================================#
  def assert_relative_fetch_works(profile_name, expected_profiles, expected_controls)
    run_result = run_inspec_process("exec #{git_profiles}/#{profile_name}", json: true)
    assert_empty run_result.stderr
    assert_json_controls_passing(run_result)

    # Should know about the top-level profile and the child profile
    assert_equal expected_profiles, (@json["profiles"].map { |p| p["name"] })

    controls = @json["profiles"].map { |p| p["controls"] }.flatten.map { |c| c["id"] }.uniq
    # Should have controls from the top-level and included child profile
    expected_controls.each { |control| assert_includes controls, control }

    # should not have controls from the profile defined at the top of the repo of the child profile
    refute_includes controls, "red-dye"
  end

  #======================================================================#
  #                        Basic Git Fetching
  #======================================================================#
  describe "running a profile with a basic local dependency" do
    it "should work on a local checkout" do
      run_result = run_inspec_process("exec #{git_profiles}/basic-local", json: true)
      assert_empty run_result.stderr
      assert_json_controls_passing(run_result)
    end
  end
  # describe "running a profile with a basic remote dependency"

  # TODO: move private SSH+git test from inspec_exec_test to here

  #======================================================================#
  #                        Revision Selection
  #======================================================================#
  # NOTE: test branch, rev, and tag capabilities are (lighty) tested in unit tests

  #======================================================================#
  #                     Relative Path Support
  #======================================================================#

  #------------ Happy Cases for Relative Path Support -------------------#
  describe "running a profile with a shallow relative path dependency" do
    it "should find the relative path profile and execute exactly those controls" do
      assert_relative_fetch_works("relative-shallow", %w{relative-shallow child-01}, %w{top-level-01 child-01})
    end
  end

  describe "running a profile with a deep relative path dependency" do
    it "should find the relative path profile and execute exactly those controls" do
      assert_relative_fetch_works("relative-deep", %w{relative-deep child-02}, %w{relative-deep-01 child-02})
    end
  end

  describe "running a profile with a combination of relative path dependencies" do
    it "should find the relative path profiles and execute exactly those controls" do
      assert_relative_fetch_works(
        "relative-combo",
        %w{relative-combo child-01 child-02},
        %w{relative-combo-01 child-01 child-02}
      )
    end
  end

  #------------ Edge Cases for Relative Path Support -------------------#

  describe "running a profile with an '' relative path dependency" do
    it "should find the top-level profile in the git-referenced child profile and execute that" do
      assert_relative_fetch_works("relative-empty", %w{relative-empty basic-local}, %w{relative-empty-01 basic-local-01})
    end
  end

  describe "running a profile with an ./ relative path dependency" do
    it "should find the top-level profile in the git-referenced child profile and execute that" do
      assert_relative_fetch_works("relative-dot-slash", %w{relative-dot-slash basic-local}, %w{relative-dot-slash-01 basic-local-01})
    end
  end

  describe "running a profile with a relative path dependency that does not exist" do
    it "should fail gracefully" do
      run_result = run_inspec_process("exec #{git_profiles}/relative-nonesuch")
      assert_empty run_result.stdout
      refute_includes run_result.stderr, "Errno::ENOENT" # No ugly file missing error
      assert_equal 1, run_result.stderr.lines.count # Not a giant stacktrace
      # Spot check important parts of the message
      assert_includes run_result.stderr, "Cannot find relative path"
      assert_includes run_result.stderr, "no/such/path" # the actual missing path
      assert_includes run_result.stderr, "profile in git repo"
      # The containing git repo (the only identifier the user will have)
      assert_includes run_result.stderr, "test/fixtures/profiles/git-fetcher/git-repo-01"
      assert_exit_code(1, run_result) # General user error
    end
  end

  #------------ Happy Case for default branch GIT fetching -------------------#

  describe "running a remote GIT profile" do
    it "should use default HEAD branch" do
      inspec("exec #{git_default_main_profile_url}")
      assert_empty stderr
      assert_includes stdout, "Profile: InSpec Profile (default-main)"
      assert_includes stdout, "Profile Summary: 1 successful control, 0 control failures, 0 controls skipped\n"
      assert_includes stdout, "Test Summary: 2 successful, 0 failures, 0 skipped\n"
      assert_exit_code 0, out
    end
  end
end
