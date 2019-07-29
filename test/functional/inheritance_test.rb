require "functional/helper"

describe "example inheritance profile" do
  include FunctionalHelper
  let(:path) { File.join(examples_path, "inheritance") }
  let(:input_file) { File.join(examples_path, "profile-attribute.yml") } # TODO rename attributes in examples

  it "check succeeds with --profiles-path" do
    out = inspec("check " + path + " --profiles-path " + examples_path)

    out.stderr.must_equal ""
    out.stdout.must_match(/Valid.*true/)
    assert_exit_code 0, out
  end

  it "check succeeds without --profiles-path using inspec.yml" do
    prepare_examples("inheritance") do |dir|
      inspec("vendor " + dir)
      out = inspec("check " + dir)

      out.stderr.must_equal ""
      out.stdout.must_match(/Valid.*true/)
      assert_exit_code 0, out
    end
  end

  it "archive is successful with --profiles-path" do
    prepare_examples("inheritance") do |dir|
      out = inspec("archive " + dir + " --output " + dst.path + " --profiles-path " + examples_path)

      out.stderr.must_equal ""
      out.stdout.must_include "Generate archive " + dst.path
      out.stdout.must_include "Finished archive generation."
      File.exist?(dst.path).must_equal true
      assert_exit_code 0, out
    end
  end

  it "archive is successful without --profiles-path using inspec.yml" do
    prepare_examples("inheritance") do |dir|
      out = inspec("archive " + dir + " --output " + dst.path)

      out.stderr.must_equal ""
      out.stdout.must_include "Generate archive " + dst.path
      out.stdout.must_include "Finished archive generation."
      File.exist?(dst.path).must_equal true
      assert_exit_code 0, out
    end
  end

  it "read the profile json with --profiles-path" do
    out = inspec("json " + path + " --profiles-path " + examples_path)

    out.stderr.must_equal ""
    s = out.stdout
    hm = JSON.load(s)
    hm["name"].must_equal "inheritance"
    hm["controls"].length.must_equal 5
    assert_exit_code 0, out
  end

  it "read the profile json without --profiles-path using inspec.yml" do
    out = inspec("json " + path)

    out.stderr.must_equal ""
    s = out.stdout
    hm = JSON.load(s)
    hm["name"].must_equal "inheritance"
    hm["controls"].length.must_equal 5
    assert_exit_code 0, out
  end

  it "can execute a profile inheritance" do
    out = inspec("exec " + path + " --reporter json --no-create-lockfile --input-file " + input_file)

    out.stderr.must_equal ""
    JSON.load(out.stdout).must_be_kind_of Hash
    assert_exit_code 101, out
  end
end
