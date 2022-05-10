require "functional/helper"

describe "inspec export" do
  include FunctionalHelper

  parallelize_me!

  # inspec_json_profile_test covers most of the test as inspec export is alias to inspec json.

  let(:iaf) { "#{profile_path}/signed/profile-1.0.0.iaf" }

  it "exports the profile in default yaml format" do
    out = inspec("export " + example_profile)
    _(out.stderr).must_equal ""
    assert_exit_code 0, out
    _(YAML.load(out.stdout)).must_be_kind_of Hash
  end

  it "exports the iaf format profile to default yaml" do
    out = run_inspec_process("export #{iaf}")
    assert_exit_code 0, out

    _(out.stderr).must_equal ""
    _(YAML.load(out.stdout)).must_be_kind_of Hash
  end

  it "exports the iaf format profile to explicit yaml" do
    out = run_inspec_process("export --what profile --format yaml #{iaf}")
    assert_exit_code 0, out

    _(out.stderr).must_equal ""
    _(YAML.load(out.stdout)).must_be_kind_of Hash
  end

  it "exports the iaf format profile to explicit json" do
    out = run_inspec_process("export --what profile --format json #{iaf}")
    assert_exit_code 0, out

    _(out.stderr).must_equal ""
    _(JSON.load(out.stdout)).must_be_kind_of Hash
  end

  it "rejects the iaf format profile to explicit raw" do
    out = run_inspec_process("export --what profile --format raw #{iaf}")
    assert_exit_code 1, out
    _(out.stderr).must_include "Invalid option"
  end

  it "rejects metadata export to json" do
    out = run_inspec_process("export --what metadata --format json #{iaf}")
    assert_exit_code 1, out
    _(out.stderr).must_include "Invalid option"
  end

  it "rejects README export to json" do
    out = run_inspec_process("export --what readme --format json #{iaf}")
    assert_exit_code 1, out
    _(out.stderr).must_include "Invalid option"
  end

  it "rejects README export to yaml" do
    out = run_inspec_process("export --what readme --format yaml #{iaf}")
    assert_exit_code 1, out
    _(out.stderr).must_include "Invalid option"
  end

  it "exports metadata in yaml" do
    out = run_inspec_process("export --what metadata --format yaml #{iaf}")
    assert_exit_code 0, out

    _(out.stderr).must_equal ""
    _(YAML.load(out.stdout)).must_be_kind_of Hash

    _(out.stdout).must_equal File.read("#{profile_path}/old-examples/profile/inspec.yml")
  end

  it "exports metadata in raw" do
    # Same as previous
    out = run_inspec_process("export --what metadata --format raw #{iaf}")
    assert_exit_code 0, out

    _(out.stderr).must_equal ""
    _(YAML.load(out.stdout)).must_be_kind_of Hash

    _(out.stdout).must_equal File.read("#{profile_path}/old-examples/profile/inspec.yml")
  end

  it "exports readme in raw" do
    out = run_inspec_process("export --what readme --format raw #{iaf}")
    assert_exit_code 0, out

    _(out.stderr).must_equal ""
    _(out.stdout).must_equal File.read("#{profile_path}/old-examples/profile/README.md")
  end

  it "exports missing readme as blank" do
    out = run_inspec_process("export --what readme #{profile_path}/git-fetcher/basic")
    assert_exit_code 0, out

    _(out.stderr).must_equal ""
    _(out.stdout).must_equal ""
  end
end
