require "functional/helper"
require "mixlib/shellout"
require "json_schemer"

describe "inspec export" do
  include FunctionalHelper

  parallelize_me!

  # inspec_json_profile_test covers most of the test as inspec export is alias to inspec json.
  it "exports the profile in default json format" do
    out = inspec("export " + example_profile)
    _(out.stderr).must_equal ""
    assert_exit_code 0, out
    _(JSON.load(out.stdout)).must_be_kind_of Hash
  end

  it "exports the iaf format profile to default json" do
    prepare_examples do |dir|
      skip_windows!

      unique_key_name = SecureRandom.uuid

      # create profile
      profile = File.join(dir, "profile_a")
      run_inspec_process("init profile profile_a", prefix: "cd #{dir};")

      out = run_inspec_process("sign generate-keys --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("sign profile --profile #{profile} --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("export profile_a-0.1.0.iaf", prefix: "cd #{dir};")
      assert_exit_code 0, out

      _(out.stderr).must_equal ""
      _(JSON.load(out.stdout)).must_be_kind_of Hash
      delete_keys(unique_key_name)
    end
  end

  def delete_keys(unique_key_name)
    File.delete("#{Inspec.config_dir}/keys/#{unique_key_name}.pem.key") if File.exist?("#{Inspec.config_dir}/keys/#{unique_key_name}.pem.key")
    File.delete("#{Inspec.config_dir}/keys/#{unique_key_name}.pem.pub") if File.exist?("#{Inspec.config_dir}/keys/#{unique_key_name}.pem.pub")
  end
end
