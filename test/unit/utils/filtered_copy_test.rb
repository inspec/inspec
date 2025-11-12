require "helper"
require "inspec/utils/filtered_copy"
require "inspec/fetcher"

describe Inspec::Utils::FilteredCopy do
  let(:copier) { Inspec::Utils::FilteredCopy }

  describe "initialization" do
    it "uses default exclusions when use_defaults is true" do
      sc = copier.new
      _(sc.exclusions).must_include ".git"
    end

    it "includes custom exclusions along with defaults" do
      sc = copier.new(exclusions: ["node_modules", ".env"])
      _(sc.exclusions).must_include ".git"
      _(sc.exclusions).must_include "node_modules"
      _(sc.exclusions).must_include ".env"
    end

    it "uses only custom exclusions when use_defaults is false" do
      sc = copier.new(exclusions: ["custom_dir"], use_defaults: false)
      _(sc.exclusions).wont_include ".git"
      _(sc.exclusions).must_include "custom_dir"
    end

    it "removes duplicates from exclusion list" do
      sc = copier.new(exclusions: [".git", "temp", ".git"])
      _(sc.exclusions.count(".git")).must_equal 1
    end
  end

  describe "#copy" do
    before do
      FileUtils.stubs(:cp_r)
    end

    it "copies all non-excluded files" do
      Dir.stubs(:children).with("source").returns(["file1.txt", "file2.rb", ".git", "folder"])
      FileUtils.expects(:cp_r).with("source/file1.txt", "dest/file1.txt")
      FileUtils.expects(:cp_r).with("source/file2.rb", "dest/file2.rb")
      FileUtils.expects(:cp_r).with("source/folder", "dest/folder")
      # .git should NOT be copied

      sc = copier.new
      result = sc.copy("source", "dest")
      _(result).must_equal 3
    end

    it "excludes custom files when specified" do
      Dir.stubs(:children).with("source").returns(["file1.txt", "node_modules", ".git", "build"])
      FileUtils.expects(:cp_r).with("source/file1.txt", "dest/file1.txt")
      # node_modules, .git, and build should NOT be copied

      sc = copier.new(exclusions: %w{node_modules build})
      result = sc.copy("source", "dest")
      _(result).must_equal 1
    end

    it "copies all files when no exclusions are set and use_defaults is false" do
      Dir.stubs(:children).with("source").returns([".git", "file.txt"])
      FileUtils.expects(:cp_r).with("source/.git", "dest/.git")
      FileUtils.expects(:cp_r).with("source/file.txt", "dest/file.txt")

      sc = copier.new(use_defaults: false)
      result = sc.copy("source", "dest")
      _(result).must_equal 2
    end

    it "handles empty directory" do
      Dir.stubs(:children).with("source").returns([])

      sc = copier.new
      result = sc.copy("source", "dest")
      _(result).must_equal 0
    end

    it "handles directory with only excluded entries" do
      Dir.stubs(:children).with("source").returns([".git"])

      sc = copier.new
      result = sc.copy("source", "dest")
      _(result).must_equal 0
    end
  end

  describe "#add_exclusions" do
    it "adds new exclusions to the list" do
      sc = copier.new
      initial_count = sc.exclusions.length
      sc.add_exclusions("temp", "cache")
      _(sc.exclusions).must_include "temp"
      _(sc.exclusions).must_include "cache"
      _(sc.exclusions.length).must_equal(initial_count + 2)
    end

    it "prevents duplicates when adding exclusions" do
      sc = copier.new
      sc.add_exclusions("temp", "temp", "cache")
      _(sc.exclusions.count("temp")).must_equal 1
    end

    it "returns updated exclusion list" do
      sc = copier.new
      result = sc.add_exclusions("new_item")
      _(result).must_be_kind_of Array
      _(result).must_include "new_item"
    end
  end

  describe "#remove_exclusions" do
    it "removes specified exclusions from the list" do
      sc = copier.new(exclusions: %w{temp cache})
      sc.remove_exclusions("temp")
      _(sc.exclusions).wont_include "temp"
      _(sc.exclusions).must_include "cache"
    end

    it "can remove default exclusions" do
      sc = copier.new
      _(sc.exclusions).must_include ".git"
      sc.remove_exclusions(".git")
      _(sc.exclusions).wont_include ".git"
    end

    it "handles removing non-existent exclusions gracefully" do
      sc = copier.new
      initial_exclusions = sc.exclusions.dup
      sc.remove_exclusions("nonexistent")
      _(sc.exclusions).must_equal initial_exclusions
    end

    it "returns updated exclusion list" do
      sc = copier.new(exclusions: ["temp"])
      result = sc.remove_exclusions("temp")
      _(result).must_be_kind_of Array
      _(result).wont_include "temp"
    end
  end

  describe "#exclusions" do
    it "returns a copy of the exclusions array" do
      sc = copier.new
      exclusions = sc.exclusions
      exclusions << "should_not_affect_original"
      _(sc.exclusions).wont_include "should_not_affect_original"
    end

    it "returns all current exclusions" do
      sc = copier.new(exclusions: %w{custom1 custom2})
      result = sc.exclusions
      _(result).must_include ".git"
      _(result).must_include "custom1"
      _(result).must_include "custom2"
    end
  end

  describe "integration with copy_profile_content_to_cache" do
    before do
      File.stubs(:exist?).with("https://example.com/repo.git").returns(false)
      FileUtils.stubs(:cp_r)
    end

    it "can be used through the copy_profile_content_to_cache method" do
      Dir.stubs(:children).with("source").returns(["README.md", ".git", "inspec.yml"])
      FileUtils.expects(:cp_r).with("source/README.md", "dest/README.md")
      FileUtils.expects(:cp_r).with("source/inspec.yml", "dest/inspec.yml")

      git_fetcher = Inspec::Fetcher::Git.new("https://example.com/repo.git")
      git_fetcher.send(:copy_profile_content_to_cache, "source", "dest")
    end

    it "supports additional exclusions through copy_profile_content_to_cache" do
      Dir.stubs(:children).with("source").returns(["README.md", ".git", "temp", "inspec.yml"])
      FileUtils.expects(:cp_r).with("source/README.md", "dest/README.md")
      FileUtils.expects(:cp_r).with("source/inspec.yml", "dest/inspec.yml")
      # .git and temp should be excluded

      git_fetcher = Inspec::Fetcher::Git.new("https://example.com/repo.git")
      git_fetcher.send(:copy_profile_content_to_cache, "source", "dest", exclusions: ["temp"])
    end
  end
end
