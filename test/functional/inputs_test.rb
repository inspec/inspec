require "functional/helper"
require "tempfile"

# For tests related to reading inputs from plugins, see plugins_test.rb

describe "inputs" do
  include FunctionalHelper
  let(:inputs_profiles_path) { File.join(profile_path, "inputs") }

  # This tests being able to load complex structures from
  # cli option-specified files.
  %w{
    flat
    nested
  }.each do |input_file|
    it "runs OK on #{input_file} inputs" do
      cmd = "exec "
      cmd += File.join(inputs_profiles_path, "basic")
      cmd += " --no-create-lockfile"
      cmd += " --input-file " + File.join(inputs_profiles_path, "basic", "files", "#{input_file}.yaml")
      cmd += " --controls " + input_file

      result = run_inspec_process(cmd)

      result.stderr.must_equal ""
      assert_exit_code 0, result
    end
  end

  describe "when asking for usage help" do
    it "includes the new --input-file option" do
      result = run_inspec_process("exec help", lock: true) # --no-create-lockfile option breaks usage help

      lines = result.stdout.split("\n")
      line = lines.detect { |l| l.include? "--input-file" }
      line.wont_be_nil
    end

    it "includes the legacy --attrs option" do
      result = run_inspec_process("exec help", lock: true)

      lines = result.stdout.split("\n")
      line = lines.detect { |l| l.include? "--attrs" }
      line.wont_be_nil
    end

    it "includes the --input option" do
      result = run_inspec_process("exec help", lock: true) # --no-create-lockfile option breaks usage help
      assert_match(/--input\s/, result.stdout) # Careful not to match --input-file
    end
  end

  describe "when using a cli-specified file" do
    let(:result) do
      cmd =  "exec "
      cmd += File.join(inputs_profiles_path, "basic") + " "
      cmd += flag + " " + File.join(inputs_profiles_path, "basic", "files", "flat.yaml")
      cmd += " --controls flat"

      run_inspec_process(cmd)
    end
    describe "when the --input-file flag is used" do
      let(:flag) { "--input-file" }
      it "works" do
        assert_exit_code 0, result
      end
    end
    describe "when the --attrs flag is used" do
      let(:flag) { "--attrs" }
      it "works" do
        assert_exit_code 0, result
      end
    end
  end

  describe "when being passed inputs via the Runner API" do
    let(:run_result) { run_runner_api_process(runner_options) }
    let(:common_options) do
      {
        profile: "#{inputs_profiles_path}/via-runner",
        reporter: ["json"],
      }
    end

    # options:
    #   profile: path to profile to run
    #   All other opts passed to InSpec::Runner.new(...)
    # then add.target is called
    def run_runner_api_process(options)
      # Remove profile from options. All other are passed to Runner.
      profile = options.delete(:profile)

      # Make a tmpfile
      Tempfile.open(mode: 0700) do |script| # 0700 - -rwx------

        # Clear and concat - can't just assign, it's readonly
        script.puts <<~EOSCRIPT
          # Ruby load path
          $LOAD_PATH.clear
          $LOAD_PATH.concat(#{$LOAD_PATH})

           # require inspec
          require "inspec"
          require "inspec/runner"

          # inject pretty-printed runner opts
          runner_args = #{options.inspect}
           # Profile to run:
          profile_location = "#{profile}"

          # Run Execution
          runner = Inspec::Runner.new(runner_args)
          runner.add_target profile_location
          runner.run
        EOSCRIPT
        script.flush

        # TODO - portability - this does not have windows compat stuff from the inspec()
        # method in functional/helper.rb - it is not portable to windows at this point yet.
        # https://github.com/inspec/inspec/issues/4416
        CMD.run_command("ruby #{script.path}")

      end
    end

    describe "when using the current :inputs key" do
      let(:runner_options) { common_options.merge({ inputs: { test_input_01: "value_from_api" } }) }

      it "finds the values and does not issue any warnings" do
        output = run_result.stdout
        skip_windows!
        refute_includes output, "DEPRECATION"
        structured_output = JSON.parse(output)
        assert_equal "passed", structured_output["profiles"][0]["controls"][0]["results"][0]["status"]
      end
    end

    describe "when using the legacy :attributes key" do
      let(:runner_options) { common_options.merge({ attributes: { test_input_01: "value_from_api" } }) }
      it "finds the values but issues a DEPRECATION warning" do
        output = run_result.stdout
        skip_windows!
        assert_includes output, "DEPRECATION"
        structured_output = JSON.parse(output.lines.reject { |l| l.include? "DEPRECATION" }.join("\n") )
        assert_equal "passed", structured_output["profiles"][0]["controls"][0]["results"][0]["status"]
      end
    end
  end

  describe "when using the --input inline raw input flag CLI option" do
    let(:result) { run_inspec_process("exec #{inputs_profiles_path}/cli #{input_opt} #{control_opt}", json: true) }
    let(:control_opt) { "" }

    describe "when the --input is used once with one value" do
      let(:input_opt) { "--input test_input_01=value_from_cli_01" }
      let(:control_opt) { "--controls test_control_01" }
      it("correctly reads the input") { result.must_have_all_controls_passing }
    end

    describe "when the --input is used once with two values" do
      let(:input_opt) { "--input test_input_01=value_from_cli_01 test_input_02=value_from_cli_02" }
      it("correctly reads the input") { result.must_have_all_controls_passing }
    end

    describe "when the --input is used once with two values and a comma" do
      let(:input_opt) { "--input test_input_01=value_from_cli_01, test_input_02=value_from_cli_02" }
      it("correctly reads the input") { result.must_have_all_controls_passing }
    end

    describe "when the --input is used twice with one value each" do
      let(:input_opt) { "--input test_input_01=value_from_cli_01 --input test_input_02=value_from_cli_02" }
      let(:control_opt) { "--controls test_control_02" }
      # Expected, though unfortunate, behavior is to only notice the second input
      it("correctly reads the input") { result.must_have_all_controls_passing }
    end

    describe "when the --input is used with no equal sign" do
      let(:input_opt) { "--input value_from_cli_01" }
      it "does not run and provides an error message" do
        output = result.stdout
        assert_includes "ERROR", output
        assert_includes "An '=' is required", output
        assert_includes "input_name_1=input_value_1", output
        assert_equal 1, result.exit_status
      end
    end

    describe "when the --input is used with a .yaml extension" do
      let(:input_opt) { "--input myfile.yaml" }
      it "does not run and provides an error message" do
        output = result.stdout
        assert_includes "ERROR", output
        assert_includes "individual input values", output
        assert_includes "Use --input-file", output
        assert_equal 1, result.exit_status
      end
    end
  end

  describe "when accessing inputs in a variety of scopes using the DSL" do
    it "is able to read the inputs using the input keyword" do
      cmd = "exec #{inputs_profiles_path}/scoping"

      result = run_inspec_process(cmd, json: true)

      result.must_have_all_controls_passing
    end
    it "is able to read the inputs using the legacy attribute keyword" do
      cmd = "exec #{inputs_profiles_path}/legacy-attributes-dsl"

      result = run_inspec_process(cmd, json: true)

      result.must_have_all_controls_passing
    end
  end

  describe "run profile with metadata inputs" do

    it "works when using the new 'inputs' key" do
      cmd = "exec #{inputs_profiles_path}/metadata-basic"

      result = run_inspec_process(cmd, json: true)

      result.must_have_all_controls_passing
      result.stderr.must_be_empty
    end

    it "works when using the legacy 'attributes' key" do
      cmd = "exec #{inputs_profiles_path}/metadata-legacy"

      result = run_inspec_process(cmd, json: true)

      result.must_have_all_controls_passing
      # Will eventually issue deprecation warning
    end

    it "does not error when inputs are empty" do
      cmd = "exec "
      cmd += File.join(inputs_profiles_path, "metadata-empty")

      result = run_inspec_process(cmd, json: true)

      result.stderr.must_include "WARN: Inputs must be defined as an Array in metadata files. Skipping definition from profile-with-empty-attributes."
      assert_exit_code 0, result
    end

    it "errors with invalid input types" do
      cmd = "exec "
      cmd += File.join(inputs_profiles_path, "metadata-invalid")

      result = run_inspec_process(cmd, json: true)

      result.stderr.must_equal "Type 'Color' is not a valid input type.\n"
      assert_exit_code 1, result
    end

    it "errors with required input not defined" do
      cmd = "exec "
      cmd += File.join(inputs_profiles_path, "metadata-required")

      result = run_inspec_process(cmd, json: true)

      result.stderr.must_include "Input 'a_required_input' is required and does not have a value.\n"
      assert_exit_code 1, result
    end

    describe "when profile inheritance is used" do
      it "should correctly assign input values using namespacing" do
        cmd = "exec " + File.join(inputs_profiles_path, "inheritance", "wrapper")

        result = run_inspec_process(cmd, json: true)

        result.must_have_all_controls_passing
      end
    end
  end

  describe "when using a profile with undeclared (valueless) inputs" do
    it "should warn about them and not abort the run" do
      cmd = "exec #{inputs_profiles_path}/undeclared"

      result = run_inspec_process(cmd, json: true)

      result.stderr.must_include "WARN: Input 'undeclared_01'"
      result.stderr.must_include "does not have a value"
      result.must_have_all_controls_passing
    end
  end
end
