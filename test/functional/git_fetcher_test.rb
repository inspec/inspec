require "functional/helper"
require "fileutils"
require "tmpdir"

describe "running profiles with git-based dependencies" do
  include FunctionalHelper
  let(:git_profiles) { "#{profile_path}/git-fetcher" }

  #======================================================================#
  #                         Git Repo Setup
  #======================================================================#
  fixture_repos = ["basic-local", "git-repo-01"]

  before(:all) do
    skip_windows! # Right now, this is due to symlinking

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
    run_result.must_have_all_controls_passing

    # Should know about the top-level profile and the child profile
    assert_equal expected_profiles, (run_result.payload.json["profiles"].map { |p| p["name"] })

    controls = run_result.payload.json["profiles"].map { |p| p["controls"] }.flatten.map { |c| c["id"] }.uniq
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
      run_result.must_have_all_controls_passing
    end
  end
  # describe "running a profile with a basic remote dependency"

  # TODO: move private SSH+git test from inspec_exec_test to here

  #======================================================================#
  #                        Revision Selection
  #======================================================================#
  # TODO: test branch, rev, and tag capabilities

  #======================================================================#
  #                     Relative Path Support
  #======================================================================#

  #------------ Happy Cases for Relative Path Support -------------------#
  describe "running a profile with a shallow relative path dependency" do
    it "should find the relative path profile and execute exactly those controls" do
      assert_relative_fetch_works("relative-shallow", ["relative-shallow", "child-01"], ["top-level-01", "child-01"])
    end
  end

  describe "running a profile with a deep relative path dependency" do
    it "should find the relative path profile and execute exactly those controls" do
      assert_relative_fetch_works("relative-deep", ["relative-deep", "child-02"], ["relative-deep-01", "child-02"])
    end
  end

  describe "running a profile with a combination of relative path dependencies" do
    it "should find the relative path profiles and execute exactly those controls" do
      assert_relative_fetch_works(
        "relative-combo",
        ["relative-combo", "child-01", "child-02"],
        ["relative-combo-01", "child-01", "child-02"]
      )
    end
  end

  #------------ Edge Cases for Relative Path Support -------------------#

  # TODO: These next two tests trigger a bug, in which the profile appears
  # to have a key collision in the cache.

  describe "running a profile with an '' relative path dependency" do
    it "should find the top-level profile in the git-referenced child profile and execute that" do
      assert_relative_fetch_works("relative-empty", ["relative-empty", "basic-local"], ["relative-empty-01", "basic-local-01"])
    end
  end

  describe "running a profile with an ./ relative path dependency" do
    it "should find the top-level profile in the git-referenced child profile and execute that" do
      assert_relative_fetch_works("relative-dot-slash", ["relative-dot-slash", "basic-local"], ["relative-dot-slash-01", "basic-local-01"])
    end
  end

  # describe "running a profile with a relative path dependency that does not exist" do

end
