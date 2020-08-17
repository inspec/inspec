require "functional/helper"

describe "example inheritance profile" do
  include FunctionalHelper
  let(:path) { File.join(examples_path, "inheritance") }
  let(:input_file) { File.join(examples_path, "profile-attribute.yml") } # TODO rename attributes in examples

  it "check succeeds with --profiles-path" do
    out = inspec("check " + path + " --profiles-path " + examples_path)

    _(out.stderr).must_equal ""
    _(out.stdout).must_match(/Valid.*true/)
    assert_exit_code 0, out
  end

  it "check succeeds without --profiles-path using inspec.yml" do
    prepare_examples("inheritance") do |dir|
      inspec("vendor " + dir)
      out = inspec("check " + dir)

      _(out.stderr).must_equal ""
      _(out.stdout).must_match(/Valid.*true/)
      assert_exit_code 0, out
    end
  end

  it "archive is successful with --profiles-path" do
    prepare_examples("inheritance") do |dir|
      out = inspec("archive " + dir + " --output " + dst.path + " --profiles-path " + examples_path)

      _(out.stderr).must_equal ""
      _(out.stdout).must_include "Generate archive " + dst.path
      _(out.stdout).must_include "Finished archive generation."
      _(File.exist?(dst.path)).must_equal true
      assert_exit_code 0, out
    end
  end

  it "archive is successful without --profiles-path using inspec.yml" do
    prepare_examples("inheritance") do |dir|
      out = inspec("archive " + dir + " --output " + dst.path)

      _(out.stderr).must_equal ""
      _(out.stdout).must_include "Generate archive " + dst.path
      _(out.stdout).must_include "Finished archive generation."
      _(File.exist?(dst.path)).must_equal true
      assert_exit_code 0, out
    end
  end

  it "read the profile json with --profiles-path" do
    out = inspec("json " + path + " --profiles-path " + examples_path)

    _(out.stderr).must_equal ""
    s = out.stdout
    hm = JSON.load(s)
    _(hm["name"]).must_equal "inheritance"
    _(hm["controls"].length).must_equal 6
    assert_exit_code 0, out
  end

  it "read the profile json without --profiles-path using inspec.yml" do
    out = inspec("json " + path)

    _(out.stderr).must_equal ""
    s = out.stdout
    hm = JSON.load(s)
    _(hm["name"]).must_equal "inheritance"
    _(hm["controls"].length).must_equal 6
    assert_exit_code 0, out
  end

  it "can execute a profile inheritance" do
    # TODO: the inheritence profile uses here fails on windows.
    skip_windows! # Breakage confirmed
    out = inspec("exec " + path + " --reporter json --no-create-lockfile --input-file " + input_file)

    _(out.stderr).must_equal ""
    _(JSON.load(out.stdout)).must_be_kind_of Hash
    assert_exit_code 0, out
  end
end
