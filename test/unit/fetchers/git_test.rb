# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann
require 'helper'

describe Fetchers::Git do
  let(:fetcher) { Fetchers::Git }

  it 'registers with the fetchers registry' do
    reg = Inspec::Fetcher.registry
    _(reg['git']).must_equal fetcher
  end

  it 'handles sources beginning with `git@`' do
    f = fetcher.resolve('git@github.com:foo/bar')
    f.wont_be_nil
    f.must_be_kind_of Fetchers::Git
  end

  it 'handles sources ending with `.git`' do
    f = fetcher.resolve('https://github.com/foo/bar.git')
    f.wont_be_nil
    f.must_be_kind_of Fetchers::Git
  end

  it "handles sources specified by a :git key" do
    f = fetcher.resolve({git: "https://example.com/foo.gi"})
    f.wont_be_nil
    f.must_be_kind_of Fetchers::Git
  end

  describe "when given a valid repository" do
    let(:git_dep_dir) { "test-directory" }
    let(:git_master_ref) { "bf4d5774f02d24155bfc34b5897d22785a304cfa" }
    let(:git_branch_ref) { "b979579e5fc8edb72511fe5d2a1230dede71eff7" }
    let(:git_tag_ref) { "efc85d89ee9d5798ca93ee95db0c711b99061590" }
    let(:git_output) {
      out = mock()
      out.stubs(:stdout).returns("")
      out.stubs(:exitstatus).returns(0)
      out.stubs(:stderr).returns("")
      out.stubs(:status).returns(true)
      out.stubs(:error!).returns(false)
      out.stubs(:run_command).returns(true)
      out
    }

    let(:git_ls_remote_output) {
      out = mock()
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
    }

    before do
      # git fetcher likes to make directories, let's stub that for every test
      Dir.stubs(:mktmpdir).yields("test-tmp-dir")
      File.stubs(:directory?).with("fetchpath/.git").returns(false)
      FileUtils.stubs(:mkdir_p)
    end

    def expect_ls_remote(ref)
      Mixlib::ShellOut.expects(:new).with("git ls-remote \"#{git_dep_dir}\" \"#{ref}*\"", {}).returns(git_ls_remote_output)
    end

    def expect_checkout(ref, at='test-tmp-dir')
      Mixlib::ShellOut.expects(:new).with("git checkout #{ref}", {cwd: at}).returns(git_output)
    end

    def expect_clone
      Mixlib::ShellOut.expects(:new).with("git clone #{git_dep_dir} ./", {cwd: 'test-tmp-dir'}).returns(git_output)
    end

    def expect_mv_into_place
      FileUtils.expects(:cp_r).with('test-tmp-dir/.', 'fetchpath')
    end

    it "resolves to the revision of master by default" do
      expect_ls_remote('master')
      result = fetcher.resolve({git: git_dep_dir})
      result.resolved_source.must_equal({git: git_dep_dir, ref: git_master_ref })
    end

    it "can resolve a tag" do
      expect_ls_remote('antag')
      result = fetcher.resolve({git: git_dep_dir, tag: 'antag'})
      result.resolved_source.must_equal({git: git_dep_dir, ref: git_tag_ref })
    end

    it "can resolve a branch" do
      expect_ls_remote('somebranch')
      result = fetcher.resolve({git: git_dep_dir, branch: 'somebranch'})
      result.resolved_source.must_equal({git: git_dep_dir, ref: git_branch_ref })
    end

    it "assumes the ref you gave it is the thing you want" do
      result = fetcher.resolve({git: git_dep_dir, ref: 'a_test_ref'})
      result.resolved_source.must_equal({git: git_dep_dir, ref: 'a_test_ref' })
    end

    it "fetches to the given location" do
      expect_ls_remote('master')
      expect_clone()
      expect_checkout(git_master_ref)
      expect_mv_into_place()
      result = fetcher.resolve({git: git_dep_dir})
      result.fetch("fetchpath")
    end

    it "doesn't refetch an already cloned repo" do
      File.expects(:directory?).with("fetchpath/.git").at_least_once.returns(true)
      expect_ls_remote('master')
      expect_checkout(git_master_ref, 'fetchpath')
      result = fetcher.resolve({git: git_dep_dir})
      result.fetch("fetchpath")
    end

    it "returns the repo_path that we fetched to as the archive_path" do
      File.expects(:directory?).with("fetchpath/.git").at_least_once.returns(true)
      expect_ls_remote('master')
      expect_checkout(git_master_ref, 'fetchpath')
      result = fetcher.resolve({git: git_dep_dir})
      result.fetch("fetchpath")
      result.archive_path.must_equal 'fetchpath'
    end
  end
end
