control "inspec-habitat-create" do
  title "Create command"

  output_hart_dir = "/home/vagrant/output"
  find_hart_output = command("find #{output_hart_dir} -name '*.hart'").stdout
  hart_files = find_hart_output.split("\n")

  hab_profile_path = "/home/vagrant/hab_test_profile"
  find_profile_files_command = "find #{hab_profile_path} -type f -printf '%f\n'"
  profile_files = command(find_profile_files_command).stdout.split("\n").sort
  expected_files = %w{
    .gitkeep
    README.md
    example.rb
    inspec.yml
  }

  describe "`inspec habitat profile create`" do
    it "should create exactly 1 hart file" do
      expect(hart_files.length).to eq(1)
    end
    it "does not add any extra files to a default generated profile" do
      expect(profile_files).to eq(expected_files)
    end
  end
end

control "inspec-habitat-service" do
  title "inspec-profile-hab_test_profile service"
  describe "The running service" do
    it "should create a log file" do
      log = "/hab/svc/inspec-profile-hab_test_profile/logs/inspec_log.txt"
      expect(file(log).exist?).to be(true)
    end
    it "should create a JSON file for the last run" do
      log = "/hab/svc/inspec-profile-hab_test_profile/logs/inspec_last_run.json"
      JSON.parse(file(log).content)
    end
  end
end
