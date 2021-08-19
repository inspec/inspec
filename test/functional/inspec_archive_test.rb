require "functional/helper"
require "tmpdir"
require "zip"
require "rubygems/package"

describe "inspec archive" do
  include FunctionalHelper
  let(:auto_dst) { File.expand_path(File.join(repo_path, "profile-1.0.0.tar.gz")) }

  parallelize_me!

  it "archive is successful" do
    prepare_examples("profile") do |dir|
      out = inspec("archive " + dir + " --overwrite")

      _(out.stdout).must_match(/Generate archive [^ ]*profile-1.0.0.tar.gz/)
      _(out.stdout).must_include "Finished archive generation."
      assert_exit_code 0, out
    end
  end

  it "archives to output file" do
    prepare_examples("profile") do |dir|
      out = inspec("archive " + dir + " --output " + dst.path)

      _(out.stderr).must_equal ""
      _(out.stdout).must_include "Generate archive " + dst.path
      _(out.stdout).must_include "Finished archive generation."
      _(File.exist?(dst.path)).must_equal true
      assert_exit_code 0, out
    end
  end

  it "archives an inspec.json file" do
    prepare_examples("profile") do |dir|
      out = inspec("archive " + dir + " --overwrite")

      _(out.stderr).must_equal ""
      t = Zlib::GzipReader.open(auto_dst)
      _(Gem::Package::TarReader.new(t).entries.map(&:header).map(&:name)).must_include "inspec.json"
      assert_exit_code 0, out
    end
  end

  it "auto-archives when no --output is given" do
    prepare_examples("profile") do |dir|
      out = inspec("archive " + dir + " --overwrite")

      _(out.stderr).must_equal ""
      _(out.stdout).must_include "Generate archive " + auto_dst
      _(out.stdout).must_include "Finished archive generation."
      _(File.exist?(auto_dst)).must_equal true
      assert_exit_code 0, out
    end
  end

  it "archive on invalid archive" do
    Dir.tmpdir do |target_dir|
      out = inspec("archive #{target_dir} --output " + dst.path)

      _(out.stderr).must_include "Don't understand inspec profile in \"#{target_dir}\""
      _(File.exist?(dst.path)).must_equal false
      assert_exit_code 1, out
    end
  end

  it "archive will overwrite existing files even without --overwrite" do
    prepare_examples("profile") do |dir|
      x = rand.to_s
      File.write(dst.path, x)

      out = inspec("archive " + dir + " --output " + dst.path)

      _(out.stderr).must_equal ""
      _(out.stdout).must_include "Generate archive " + dst.path
      _(File.read(dst.path)).wont_equal x
      assert_exit_code 0, out
    end
  end

  it "creates valid tar.gz archives" do
    prepare_examples("profile") do |dir|
      out = inspec("archive " + dir + " --output " + dst.path + " --tar")

      _(out.stderr).must_equal ""
      _(out.stdout).must_include "Generate archive " + dst.path
      t = Zlib::GzipReader.open(dst.path)
      _(Gem::Package::TarReader.new(t).entries.map(&:header).map(&:name)).must_include "inspec.yml"
      assert_exit_code 0, out
    end
  end

  it "creates valid zip archives" do
    prepare_examples("profile") do |dir|
      out = inspec("archive " + dir + " --output " + dst.path + " --zip")

      _(out.stderr).must_equal ""
      _(out.stdout).must_include "Generate archive " + dst.path
      _(Zip::File.new(dst.path).entries.map(&:name)).must_include "inspec.yml"
      assert_exit_code 0, out
    end
  end

  it "vendors dependencies by default" do
    prepare_profiles("dependencies/inheritance") do |dir|
      out = inspec("archive " + dir + " --output " + dst.path)

      _(out.stderr).must_equal ""
      _(out.stdout).must_include "Generate archive " + dst.path
      t = Zlib::GzipReader.open(dst.path)
      files = Gem::Package::TarReader.new(t).entries.map(&:header).map(&:name)
      _(files).must_include "inspec.lock"
      _(files.select { |f| f =~ /vendor/ }.count).must_be :>, 1
      assert_exit_code 0, out
    end
  end

  it "can archive a profile with required inputs" do
    archive_depends_path = File.join(profile_path, "profile-with-required-inputs")

    Dir.mktmpdir do |tmpdir|
      FileUtils.cp_r(archive_depends_path + "/.", tmpdir)

      out = inspec("archive " + tmpdir + " --output " + dst.path)

      _(out.stderr).must_equal ""
      assert_exit_code 0, out
    end
  end
end
