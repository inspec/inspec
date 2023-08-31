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
      out.stubs(:status).returns(true)
      out
    end

    before do
      # git fetcher likes to make directories, let's stub that for every test
      Dir.stubs(:mktmpdir).yields("test-tmp-dir")
      File.stubs(:directory?).with("fetchpath/.git").returns(false)
      FileUtils.stubs(:mkdir_p)
    end

    def expect_ls_remote(ref)
      Mixlib::ShellOut.expects(:new).with("git ls-remote \"#{git_dep_dir}\" \"#{ref}*\"", {}).returns(git_ls_remote_output)
    end

    def expect_ls_remote_without_ref
      Mixlib::ShellOut.expects(:new).with("git ls-remote \"#{git_dep_dir}\"", {}).returns(git_ls_remote_output)
    end

    def expect_ls_remote_without_ref_with_fetch_path(at = "fetchpath")
      Mixlib::ShellOut.expects(:new).with("git ls-remote \"#{git_dep_dir}\"", { cwd: "fetchpath" }).returns(git_ls_remote_output)
    end

    def expect_checkout(ref, at = "test-tmp-dir")
      Mixlib::ShellOut.expects(:new).with("git checkout #{ref}", { cwd: at }).returns(git_output)
    end

    def expect_checkout_without_ref(at = "test-tmp-dir")
      Mixlib::ShellOut.expects(:new).with("git checkout", { cwd: at }).returns(git_output)
    end

    def expect_clone
      Mixlib::ShellOut.expects(:new).with("git clone #{git_dep_dir} ./", { cwd: "test-tmp-dir" }).returns(git_output)
    end

    def expect_mv_into_place
      FileUtils.expects(:cp_r).with("test-tmp-dir/.", "fetchpath")
    end

    it "it should able to resolve" do
      expect_ls_remote_without_ref
      result = fetcher.resolve({ git: git_dep_dir })
      _(result.resolved_source).must_equal({ git: git_dep_dir })
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
      expect_ls_remote_without_ref.twice
      expect_clone
      expect_checkout_without_ref
      expect_mv_into_place
      result = fetcher.resolve({ git: git_dep_dir })
      result.fetch("fetchpath")
    end

    it "doesn't refetch an already cloned repo" do
      expect_ls_remote_without_ref
      File.expects(:directory?).with("fetchpath/.git").at_least_once.returns(true)
      expect_checkout_without_ref("fetchpath")
      result = fetcher.resolve({ git: git_dep_dir })
      result.fetch("fetchpath")
    end

    it "returns the repo_path that we fetched to as the archive_path" do
      expect_ls_remote_without_ref
      File.expects(:directory?).with("fetchpath/.git").at_least_once.returns(true)
      expect_checkout_without_ref("fetchpath")
      result = fetcher.resolve({ git: git_dep_dir })
      result.fetch("fetchpath")
      _(result.archive_path).must_equal "fetchpath"
    end
  end

  describe "when given a invalid repository" do
    let(:git_dep_dir) { "test-directory" }

    let(:git_ls_remote_output) do
      out = mock
      out.stubs(:stdout).returns("")
      out.stubs(:exitstatus).returns(1)
      out.stubs(:stderr).returns("repository 'test-directory' not found")
      out.stubs(:error!).returns(true)
      out.stubs(:run_command).returns(false)
      out
    end

    def expect_ls_remote
      Mixlib::ShellOut.expects(:new).with("git ls-remote \"#{git_dep_dir}\"", {}).returns(git_ls_remote_output)
    end

    it "it raises error" do
      expect_ls_remote
      result = fetcher.resolve({ git: git_dep_dir })
      _ { result.resolved_source }.must_raise Inspec::FetcherFailure
    end
  end
end
