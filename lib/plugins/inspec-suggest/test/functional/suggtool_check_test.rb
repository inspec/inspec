require_relative "../helper"

describe "inspec suggtool check" do
  include CorePluginFunctionalHelper

  let(:fixture_path) { File.join(repo_path, "lib", "plugins", "inspec-suggest", "test", "fixtures") }
  let(:config) { File.join(fixture_path, "sugg-conf", "basic.yaml") }

  describe "when run on the test fixtures with no other options" do
    it "should detect a few problems and exit code 1" do
      result = run_inspec_process("suggtool check --suggest-config #{config}")

      _(result.stderr).must_equal ""

      # Should exit with error code
      _(result.exit_status).must_equal 1

      # Should have several warnings and one error
      _(result.stdout.lines.grep(/WARNING/).count).must_equal 3
      _(result.stdout.lines.grep(/ERROR/).count).must_equal 1
    end
  end

  describe "when run on the test fixtures with the exclude-bad config" do
    let(:config) { File.join(fixture_path, "sugg-conf", "exclude-bad.yaml") }
    it "should detect no problems and exit 0" do
      result = run_inspec_process("suggtool check --suggest-config #{config}")

      _(result.stderr).must_equal ""

      # Should exit with normal code
      _(result.exit_status).must_equal 0

      # Should no warnings or error
      _(result.stdout.lines.grep(/WARNING/).count).must_equal 0
      _(result.stdout.lines.grep(/ERROR/).count).must_equal 0
    end
  end

  describe "when run on the test fixtures with the fail-fast option" do
    it "should detect the syntax issue and exit code 1 immediately" do
      result = run_inspec_process("suggtool check --suggest-config #{config} --fail-fast")

      _(result.stderr).must_equal ""

      # Should exit with error code
      _(result.exit_status).must_equal 1

      # Should have several warnings and one error
      _(result.stdout.lines.grep(/ERROR/).count).must_equal 1
      _(result.stdout.lines.grep(/WARNING/).count).must_equal 0
    end
  end

  describe "when run on the test fixtures with the --ignore-errors option" do
    it "should detect errors but exit 0" do
      result = run_inspec_process("suggtool check --suggest-config #{config} --ignore-errors")

      _(result.stderr).must_equal ""

      # Should exit with normal exit
      _(result.exit_status).must_equal 0

      # Should have several warnings and one error
      _(result.stdout.lines.grep(/ERROR/).count).must_equal 1
      _(result.stdout.lines.grep(/WARNING/).count).must_equal 3
    end
  end

  describe "when run on the test fixtures with the after disabling the trailing-newline check" do
    it "should detect 1 error and 2 warnings" do
      result = run_inspec_process("suggtool check --suggest-config #{config} --disable-check trailing-newline ")

      _(result.stderr).must_equal ""

      # Should exit with error exit
      _(result.exit_status).must_equal 1

      # Should have one less warning and one error
      _(result.stdout.lines.grep(/ERROR/).count).must_equal 1
      _(result.stdout.lines.grep(/WARNING/).count).must_equal 2
    end
  end

  describe "when run on the test fixtures with multiple checks disabled" do
    it "should detect 1 error and 0 warnings" do
      result = run_inspec_process("suggtool check --suggest-config #{config} --disable-check trailing-newline resource-type")

      _(result.stderr).must_equal ""

      # Should exit with error exit
      _(result.exit_status).must_equal 1

      # Should have zero warnings and one error
      _(result.stdout.lines.grep(/ERROR/).count).must_equal 1
      _(result.stdout.lines.grep(/WARNING/).count).must_equal 0
    end
  end

  describe "when run on the test fixtures with the disable-checks config" do
    let(:config) { File.join(fixture_path, "sugg-conf", "disable-check.yaml") }
    it "should detect 1 warning and 1 error" do
      result = run_inspec_process("suggtool check --suggest-config #{config}")

      _(result.stderr).must_equal ""

      # Should exit with error code
      _(result.exit_status).must_equal 1

      # Should have one of each
      _(result.stdout.lines.grep(/WARNING/).count).must_equal 1
      _(result.stdout.lines.grep(/ERROR/).count).must_equal 1
    end
  end
end
