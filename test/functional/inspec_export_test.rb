require "functional/helper"

def test_export_and_compare(file_path, control_key)
  legacy_export_data = inspec("export #{file_path} --legacy-export")
  latest_export_data = inspec("export #{file_path}")

  # Both options should work with no errors
  _(legacy_export_data.stderr).must_equal ""
  _(latest_export_data.stderr).must_equal ""

  assert_exit_code 0, legacy_export_data
  assert_exit_code 0, latest_export_data

  # Compare data against legacy and latest export
  legacy_export_data_hash = YAML.load(legacy_export_data.stdout)
  latest_export_data_hash = YAML.load(latest_export_data.stdout)

  legacy_export_data_hash[:controls].each_with_index do |legacy_control_data, index|
    assert_equal legacy_control_data[control_key], latest_export_data_hash[:controls][index][control_key], "Both #{control_key} are equal"
  end
end

describe "inspec export" do
  include FunctionalHelper

  parallelize_me!

  # inspec_json_profile_test covers most of the test as inspec export is alias to inspec json.

  let(:iaf) { "#{profile_path}/signed/profile-1.0.0.iaf" }

  let(:evalprobe) { "#{profile_path}/eval-markers" }
  let(:profile_with_diff_control_tag_styles) { "#{profile_path}/control-tags" }


  # Control fields validation
  let(:control_fields_example) { "#{profile_path}/control-fields-examples" }
  let(:desc_example) { "#{control_fields_example}/controls/desc.rb" }
  let(:title_example) { "#{control_fields_example}/controls/title.rb" }
  let(:refs_example) { "#{control_fields_example}/controls/refs.rb" }
  let(:impact_example) { "#{control_fields_example}/controls/impact.rb" }

  it "does not evaluate a profile " do
    out = inspec("export " + evalprobe)
    # This profile has special code in it that emits messages to
    # STDERR at various points in evaluation
    _(out.stderr).wont_include "EVALUATION_MARKER"
    _(out.stderr).wont_include "METADATA_MARKER"
    assert_exit_code 0, out
  end

  it "exports the profile in default yaml format" do
    out = inspec("export " + example_profile)
    _(out.stderr).must_equal ""
    assert_exit_code 0, out
    _(YAML.load(out.stdout)).must_be_kind_of Hash
  end

  it "parses variations of tags & exports the equivalent data with --legacy-export and current export" do
    test_export_and_compare(profile_with_diff_control_tag_styles, :tags)
  end

  it "parses variations of description & exports the equivalent data with --legacy-export and current export" do
    test_export_and_compare(desc_example, :desc)
  end

  it "parses variations of title & exports the equivalent data with --legacy-export and current export" do
    test_export_and_compare(title_example, :title)
  end

  it "parses variations of refs & exports the equivalent data with --legacy-export and current export" do
    # TODO: Currently, refs are duplicated in latest export. Fix it!
    # test_export_and_compare(refs_example, :refs)
  end

  it "parses variations of impact & exports the equivalent data with --legacy-export and current export" do
    test_export_and_compare(impact_example, :impact)
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
