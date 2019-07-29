require "functional/helper"

describe "command tests" do
  include FunctionalHelper

  describe "version" do
    it "provides the version number on stdout" do
      out = inspec("version")

      out.stdout.must_equal Inspec::VERSION + "\n"
      out.stderr.must_equal ""

      assert_exit_code 0, out
    end

    it "prints the version as JSON when the format is specified as JSON" do
      out = inspec("version --format=json")

      out.stdout.must_equal %({"version":"#{Inspec::VERSION}"}\n)

      out.stderr.must_equal ""

      assert_exit_code 0, out
    end
  end

  describe "check" do
    it "verifies that a profile is ok" do
      out = inspec("check " + example_profile)

      out.stdout.must_match(/Valid.*true/)

      out.stderr.must_equal ""

      assert_exit_code 0, out
    end
  end

  describe "help" do
    let(:outputs) do
      [
        inspec("help").stdout,
        inspec("--help").stdout,
        inspec("").stdout,
      ]
    end

    it "outputs the same message regardless of invocation" do
      outputs.uniq.length.must_equal 1
    end

    it "outputs both core commands and v2 CLI plugins" do
      commands = %w{
        archive
        artifact
        check
        compliance
        detect
        env
        exec
        habitat
        help
        init
        json
        plugin
        shell
        supermarket
        vendor
        version
      }
      outputs.each do |output|
        commands.each do |subcommand|
          output.must_include("inspec " + subcommand)
        end
      end
    end
  end
end
