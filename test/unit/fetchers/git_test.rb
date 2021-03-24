require "helper"
require "inspec/fetcher"

describe Inspec::Fetcher::Git do
  let(:fetcher) { Inspec::Fetcher::Git }

  it "registers with the fetchers registry" do
    reg = Inspec::Fetcher::Registry.registry
    _(reg["git"]).must_equal fetcher
  end

  it "handles sources beginning with `git@`" do
    f = fetcher.resolve("git@github.com:foo/bar")
    _(f).wont_be_nil
    _(f).must_be_kind_of Inspec::Fetcher::Git
  end

  it "handles sources ending with `.git`" do
    f = fetcher.resolve("https://github.com/foo/bar.git")
    _(f).wont_be_nil
    _(f).must_be_kind_of Inspec::Fetcher::Git
  end

  it "handles sources specified by a :git key" do
    f = fetcher.resolve({ git: "https://example.com/foo.gi" })
    _(f).wont_be_nil
    _(f).must_be_kind_of Inspec::Fetcher::Git
  end

  describe "when given a valid repository" do
    let(:git_dep_dir) { "test-directory" }
    let(:git_master_ref) { "bf4d5774f02d24155bfc34b5897d22785a304cfa" }
    let(:git_branch_ref) { "b979579e5fc8edb72511fe5d2a1230dede71eff7" }
    let(:git_tag_ref) { "efc85d89ee9d5798ca93ee95db0c711b99061590" }
    let(:git_output) do
      out = mock
      out.stubs(:stdout).returns("")
      out.stubs(:exitstatus).returns(0)
      out.stubs(:stderr).returns("")
      out.stubs(:status).returns(true)
      out.stubs(:error!).returns(false)
      out.stubs(:run_command).returns(true)
      out
    end

    let(:git_ls_remote_output) do
      out = mock
      out.stubs(:stdout).returns("9abea97db10a428709353fd582b969d0e17cb923\tHEAD
bf4d5774f02d24155bfc34b5897d22785a304cfa\trefs/heads/master
b979579e5fc8edb72511fe5d2a1230dede71eff7\trefs/heads/somebranch
d9d5a6fe85c3df709bb1c878c2de8f2cb5893ced\trefs/tags/boringtag
ad280246a1a2b3d1b1179e1a8d9e1a044e7ee94f\trefs/tags/antag
efc85d89ee9d5798ca93ee95db0c711b99061590\trefs/tags/antag^{}
be002c56b0806ea40aabf7a2b742c41182336198\trefs/tags/anothertag
a7729ce65636d6d8b80159dd5dd7a40fdb6f2501\trefs/tags/anothertag^{}\n")
      out.stubs(:exitstatus).returns(0)
      out.stubs(:stderr).returns("")
      out.stubs(:error!).returns(false)
      out.stubs(:run_command).returns(true)
      out
    end

    let(:git_remote_head_master) do
      out = mock
      out.stubs(:stdout).returns("HEAD branch: master\n")
      out.stubs(:exitstatus).returns(0)
      out.stubs(:stderr).returns("")
      out.stubs(:error!).returns(false)
      out.stubs(:run_command).returns(true)
      out
    end

    before do
      # git fetcher likes to make directories, let's stub that for every test
      Dir.stubs(:mktmpdir).yields("test-tmp-dir")
      File.stubs(:directory?).with("fetchpath/.git").returns(false)
      FileUtils.stubs(:mkdir_p)
    end

    def expect_git_remote_head_master(remote_url)
      Mixlib::ShellOut.expects(:new).with("git remote show #{remote_url}", {}).returns(git_remote_head_master)
    end

    def expect_ls_remote(ref)
      Mixlib::ShellOut.expects(:new).with("git ls-remote \"#{git_dep_dir}\" \"#{ref}*\"", {}).returns(git_ls_remote_output)
    end

    def expect_checkout(ref, at = "test-tmp-dir")
      Mixlib::ShellOut.expects(:new).with("git checkout #{ref}", { cwd: at }).returns(git_output)
    end

    def expect_clone
      Mixlib::ShellOut.expects(:new).with("git clone #{git_dep_dir} ./", { cwd: "test-tmp-dir" }).returns(git_output)
    end

    def expect_mv_into_place
      FileUtils.expects(:cp_r).with("test-tmp-dir/.", "fetchpath")
    end

    it "resolves to the revision of master when head branch master" do
      expect_git_remote_head_master(git_dep_dir)
      expect_ls_remote("master")
      result = fetcher.resolve({ git: git_dep_dir })
      _(result.resolved_source).must_equal({ git: git_dep_dir, ref: git_master_ref })
    end

    it "can resolve a tag" do
      expect_ls_remote("antag")
      result = fetcher.resolve({ git: git_dep_dir, tag: "antag" })
      _(result.resolved_source).must_equal({ git: git_dep_dir, ref: git_tag_ref })
    end

    it "can resolve a branch" do
      expect_ls_remote("somebranch")
      result = fetcher.resolve({ git: git_dep_dir, branch: "somebranch" })
      _(result.resolved_source).must_equal({ git: git_dep_dir, ref: git_branch_ref })
    end

    it "assumes the ref you gave it is the thing you want" do
      result = fetcher.resolve({ git: git_dep_dir, ref: "a_test_ref" })
      _(result.resolved_source).must_equal({ git: git_dep_dir, ref: "a_test_ref" })
    end

    it "fetches to the given location" do
      expect_git_remote_head_master(git_dep_dir)
      expect_ls_remote("master")
      expect_clone
      expect_checkout(git_master_ref)
      expect_mv_into_place
      result = fetcher.resolve({ git: git_dep_dir })
      result.fetch("fetchpath")
    end

    it "doesn't refetch an already cloned repo" do
      File.expects(:directory?).with("fetchpath/.git").at_least_once.returns(true)
      expect_git_remote_head_master(git_dep_dir)
      expect_ls_remote("master")
      expect_checkout(git_master_ref, "fetchpath")
      result = fetcher.resolve({ git: git_dep_dir })
      result.fetch("fetchpath")
    end

    it "returns the repo_path that we fetched to as the archive_path" do
      File.expects(:directory?).with("fetchpath/.git").at_least_once.returns(true)
      expect_git_remote_head_master(git_dep_dir)
      expect_ls_remote("master")
      expect_checkout(git_master_ref, "fetchpath")
      result = fetcher.resolve({ git: git_dep_dir })
      result.fetch("fetchpath")
      _(result.archive_path).must_equal "fetchpath"
    end
  end

  describe "when given a repository with default branch main" do
    let(:git_default_main) { "inspec-test-profile-default-main" }
    let(:git_main_ref) { "69220a2ba6a3b276184f328e69a953e83e283323" }

    let(:git_remote_head_main) do
      out = mock
      out.stubs(:stdout).returns("HEAD branch: main\n")
      out.stubs(:exitstatus).returns(0)
      out.stubs(:stderr).returns("")
      out.stubs(:error!).returns(false)
      out.stubs(:run_command).returns(true)
      out
    end

    let(:git_ls_remote_output_for_main) do
      out = mock
      out.stubs(:stdout).returns("69220a2ba6a3b276184f328e69a953e83e283323\trefs/heads/main")
      out.stubs(:exitstatus).returns(0)
      out.stubs(:stderr).returns("")
      out.stubs(:error!).returns(false)
      out.stubs(:run_command).returns(true)
      out
    end

    def expect_git_remote_head_main(remote_url)
      Mixlib::ShellOut.expects(:new).with("git remote show #{remote_url}", {}).returns(git_remote_head_main)
    end

    def expect_ls_remote(ref)
      Mixlib::ShellOut.expects(:new).with("git ls-remote \"#{git_default_main}\" \"#{ref}*\"", {}).returns(git_ls_remote_output_for_main)
    end

    it "resolves to the revision of main when head branch main" do
      expect_git_remote_head_main(git_default_main)
      expect_ls_remote("main")
      result = fetcher.resolve({ git: git_default_main })
      _(result.resolved_source).must_equal({ git: git_default_main, ref: git_main_ref })
    end
  end
end
