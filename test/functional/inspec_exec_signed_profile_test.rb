require "functional/helper"

describe "inspec exec" do
  include FunctionalHelper
  parallelize_me!

  def test_inspec_exec_signed_profile
    prepare_examples do |dir|
      skip_windows!

      unique_key_name = SecureRandom.uuid

      # create profile
      profile = File.join(dir, "profile_a")
      run_inspec_process("init profile profile_a", prefix: "cd #{dir};")

      out = run_inspec_process("sign generate-keys --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("sign profile #{profile} --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("exec profile_a-0.1.0.iaf --no-create-lockfile", prefix: "cd #{dir};")
      assert_exit_code 0, out

      delete_keys(unique_key_name)
    end
  end

  def test_inspec_exec_signed_profile_without_validation_key
    prepare_examples do |dir|
      skip_windows!

      unique_key_name = SecureRandom.uuid

      # create profile
      profile = File.join(dir, "profile_a")
      run_inspec_process("init profile profile_a", prefix: "cd #{dir};")

      out = run_inspec_process("sign generate-keys --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("sign profile #{profile} --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      delete_keys(unique_key_name)

      out = run_inspec_process("exec profile_a-0.1.0.iaf --no-create-lockfile", prefix: "cd #{dir};")
      assert_exit_code 1, out

      assert_includes out.stderr.force_encoding(Encoding::UTF_8), "Validation key #{unique_key_name} not found"
    end
  end

  def test_inspec_exec_signed_profile_with_dependency
    prepare_examples do |dir|
      skip_windows!

      unique_key_name = SecureRandom.uuid

      profile = "#{profile_path}/dependencies/profile_a"

      out = run_inspec_process("sign generate-keys --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("sign profile #{profile} --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("exec profile_a-0.1.0.iaf --no-create-lockfile", prefix: "cd #{dir};")
      assert_exit_code 0, out

      assert_includes out.stdout.force_encoding(Encoding::UTF_8), "InSpec Profile (profile_c)"

      delete_keys(unique_key_name)

      # Removing vendors directory from the profile once the test is performed.
      FileUtils.rm_rf("#{profile}/vendor/")
    end
  end

  def delete_keys(unique_key_name)
    File.delete("#{Inspec.config_dir}/keys/#{unique_key_name}.pem.key") if File.exist?("#{Inspec.config_dir}/keys/#{unique_key_name}.pem.key")
    File.delete("#{Inspec.config_dir}/keys/#{unique_key_name}.pem.pub") if File.exist?("#{Inspec.config_dir}/keys/#{unique_key_name}.pem.pub")
  end
end
