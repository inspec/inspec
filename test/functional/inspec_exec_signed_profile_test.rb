require "functional/helper"

describe "inspec exec" do
  include FunctionalHelper

  def test_inspec_exec_signed_profile
    prepare_examples do |dir|
      skip_windows!

      unique_key_name = SecureRandom.uuid
      install_dir = File.join(dir, SecureRandom.uuid)
      FileUtils.mkdir(install_dir)

      # create profile
      profile = File.join(dir, "profile_a")
      run_inspec_process("init profile profile_a", prefix: "cd #{dir};")

      out = run_inspec_process("sign generate-keys --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("sign profile --profile #{profile} --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      return if is_windows?

      out = run_inspec_process("exec profile_a-0.1.0.iaf --no-create-lockfile", prefix: "cd #{dir};")
      assert_exit_code 0, out
    end
  end

  def test_inspec_exec_signed_profile_without_validation_key
    prepare_examples do |dir|
      skip_windows!

      unique_key_name = SecureRandom.uuid
      install_dir = File.join(dir, SecureRandom.uuid)
      FileUtils.mkdir(install_dir)

      # create profile
      profile = File.join(dir, "profile_a")
      run_inspec_process("init profile profile_a", prefix: "cd #{dir};")

      out = run_inspec_process("sign generate-keys --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      out = run_inspec_process("sign profile --profile #{profile} --keyname #{unique_key_name}", prefix: "cd #{dir};")
      assert_exit_code 0, out

      return if is_windows?

      File.delete("#{dir}/#{unique_key_name}.pem.pub")

      out = run_inspec_process("exec profile_a-0.1.0.iaf --no-create-lockfile", prefix: "cd #{dir};")
      assert_exit_code 1, out

      assert_includes out.stderr.force_encoding(Encoding::UTF_8), "Profile validation key not found."
    end
  end
end
