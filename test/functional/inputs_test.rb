require "functional/helper"
require "tempfile"

# For tests related to reading inputs from plugins, see plugins_test.rb

describe "inputs" do
  include FunctionalHelper
  let(:inputs_profiles_path) { File.join(profile_path, "inputs") }
  let(:external_attributes_file_path) { "#{inputs_profiles_path}/hashmap/files/inputs.yml" }

  parallelize_me!

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

      _(result.stderr).must_equal ""
      assert_exit_code 0, result
    end
  end

  describe "when asking for usage help" do
    it "includes the new --input-file option" do
      result = run_inspec_process("exec help", lock: true) # --no-create-lockfile option breaks usage help

      lines = result.stdout.split("\n")
      line = lines.detect { |l| l.include? "--input-file" }
      _(line).wont_be_nil
    end

    it "includes the legacy --attrs option" do
      result = run_inspec_process("exec help", lock: true)

      lines = result.stdout.split("\n")
      line = lines.detect { |l| l.include? "--attrs" }
      _(line).wont_be_nil
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
      Tempfile.open do |script|

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

        run_cmd("ruby #{script.path}")
      end
    end

    describe "when using the current :inputs key" do
      let(:runner_options) { common_options.merge({ inputs: { test_input_01: "value_from_api" } }) }
      it "finds the values and does not issue any warnings" do
        output = run_result.stdout
        refute_includes output, "DEPRECATION"
        structured_output = JSON.parse(output)
        assert_equal "passed", structured_output["profiles"][0]["controls"][0]["results"][0]["status"]
      end
    end

    describe "when using the current :inputs key with both string and symbol key in hashes" do
      let(:runner_options) { common_options.merge({ inputs: { test_input_01: "value_from_api", test_input_hash_string: { "string_key": "string_value" }, test_input_hash_symbol: { symbol_key: :symbol_value } } }) }

      it "finds the values and runs successfully" do
        output = run_result.stdout
        structured_output = JSON.parse(output)
        assert_equal "passed", structured_output["profiles"][0]["controls"][0]["results"][0]["status"]
        assert_equal "passed", structured_output["profiles"][0]["controls"][0]["results"][1]["status"]
        assert_equal "passed", structured_output["profiles"][0]["controls"][0]["results"][2]["status"]
      end
    end

    describe "when using the legacy :attributes key" do
      let(:runner_options) { common_options.merge({ attributes: { test_input_01: "value_from_api" } }) }
      it "finds the values but issues a DEPRECATION warning" do
        run = run_result
        output = run.stdout

        assert_empty run.stderr
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
      it("correctly reads the input") { assert_json_controls_passing(result) }
    end

    describe "when the --input is used once with two values" do
      let(:input_opt) { "--input test_input_01=value_from_cli_01 test_input_02=value_from_cli_02" }
      let(:control_opt) { "--controls test_control_01 test_control_02" }
      it("correctly reads both inputs") { assert_json_controls_passing(result) }
    end

    describe "when the --input is used once with two values and a comma" do
      let(:input_opt) { "--input test_input_01=value_from_cli_01, test_input_02=value_from_cli_02" }
      let(:control_opt) { "--controls test_control_01 test_control_02" }
      it("correctly reads both inputs ignoring the comma") { assert_json_controls_passing(result) }
    end

    # See https://github.com/inspec/inspec/issues/4977
    describe "when the --input is used with a numeric value" do
      describe "when the --input is used with an integer value" do
        let(:input_opt) { "--input test_input_03=11" }
        let(:control_opt) { "--controls test_control_numeric_implicit" }
        it("correctly reads the input as numeric") { assert_json_controls_passing(result) }
      end
      describe "when the --input is used with a integer value and is declared as a numeric type in metadata" do
        let(:input_opt) { "--input test_input_04=11" }
        let(:control_opt) { "--controls test_control_numeric_type" }
        it("correctly reads the input as numeric") { assert_json_controls_passing(result) }
      end
      describe "when the --input is used with a float value" do
        let(:input_opt) { "--input test_input_05=-11.0" }
        let(:control_opt) { "--controls test_control_numeric_float" }
        it("correctly reads the input as numeric") { assert_json_controls_passing(result) }
      end
    end

    # See https://github.com/inspec/inspec/issues/4799
    describe "when the --input is used with a boolean value" do
      describe "when the --input is passed true" do
        let(:input_opt) { "--input test_input_13=true" }
        let(:control_opt) { "--controls test_control_bool_true" }
        it("correctly reads the input as TrueClass") { assert_json_controls_passing(result) }
      end
      describe "when the --input is passed false" do
        let(:input_opt) { "--input test_input_14=false" }
        let(:control_opt) { "--controls test_control_bool_false" }
        it("correctly reads the input as FalseClass") { assert_json_controls_passing(result) }
      end
      describe "when the --input is passed TRUE" do
        let(:input_opt) { "--input test_input_15=TRUE" }
        let(:control_opt) { "--controls test_control_bool_true_caps" }
        it("correctly reads the input as a TrueClass even when capitalized") { assert_json_controls_passing(result) }
      end
    end

    describe "when the --input is a complex structure" do

      # Garbage
      describe "when the --input is malformed YAML " do
        let(:input_opt) { "--input test_input_08='[a, b, }]'" }
        it "runs with failed tests and provides a YAML warning message" do
          output = result.stderr
          assert_includes output, "WARN"
          assert_includes output, "treated as YAML"
          assert_includes output, "test_input_08"
          assert_exit_code(100, result)
        end
      end

      # YAML
      describe "when the --input is a YAML array" do
        let(:input_opt) { "--input test_input_06='[a,b,c]'" }
        let(:control_opt) { "--controls test_control_yaml_array" }
        it("correctly reads the input as a yaml array") { assert_json_controls_passing(result) }
      end
      describe "when the --input is a YAML hash" do
        # Note: this produces a String-keyed Hash
        let(:input_opt) { "--input test_input_07='{a: apples, b: bananas, c: cantelopes}'" }
        let(:control_opt) { "--controls test_control_yaml_hash" }
        it("correctly reads the input as a yaml hash") { assert_json_controls_passing(result) }
      end
      describe "when the --input is a YAML deep structure" do
        # Note: this produces a String-keyed Hash
        let(:input_opt) { "--input test_input_09='{a: apples, g: [grape01, grape02] }'" }
        let(:control_opt) { "--controls test_control_yaml_deep" }
        it("correctly reads the input as a yaml struct") { assert_json_controls_passing(result) }
      end

      # JSON mode
      # These three were tested manually on 2020-05-05 on win2016 and passed
      # Under CI however, we have multiple layers of quoting and dequoting
      # and it breaks badly. https://github.com/inspec/inspec/issues/5015
      unless windows?
        describe "when the --input is a JSON array" do
          let(:input_opt) { %q{--input test_input_10='["a","b","c"]'} }
          let(:control_opt) { "--controls test_control_json_array" }
          it("correctly reads the input as a json array") {
            assert_empty result.stderr
            assert_json_controls_passing(result)
          }
        end
        describe "when the --input is a JSON hash" do
          # Note: this produces a String-keyed Hash
          let(:input_opt) { %q{--input test_input_11='{"a": "apples", "b": "bananas", "c": "cantelopes"}'} }
          let(:control_opt) { "--controls test_control_json_hash" }
          it("correctly reads the input as a json hash") { assert_json_controls_passing(result) }
        end
        describe "when the --input is a JSON deep structure" do
          # Note: this produces a String-keyed Hash
          let(:input_opt) { %q{--input test_input_12='{"a": "apples", "g": ["grape01", "grape02"] }'} }
          let(:control_opt) { "--controls test_control_json_deep" }
          it("correctly reads the input as a json struct") { assert_json_controls_passing(result) }
        end
      end
    end

    describe "when the --input is used twice with one value each" do
      let(:input_opt) { "--input test_input_01=value_from_cli_01 --input test_input_02=value_from_cli_02" }
      let(:control_opt) { "--controls test_control_02" }
      # Expected, though unfortunate, behavior is to only notice the second input
      it("correctly reads the second input") { assert_json_controls_passing(result) }
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

      assert_json_controls_passing(result)
    end
    it "is able to read the inputs using the legacy attribute keyword" do
      cmd = "exec #{inputs_profiles_path}/legacy-attributes-dsl"

      result = run_inspec_process(cmd, json: true)

      assert_json_controls_passing(result)
    end

    it "is able to read the inputs in describe.one blocks" do
      cmd = "exec #{inputs_profiles_path}/describe-one"

      result = run_inspec_process(cmd, json: true)

      assert_json_controls_passing(result)
    end
  end

  describe "run profile with metadata inputs" do

    it "works when using the new 'inputs' key" do
      cmd = "exec #{inputs_profiles_path}/metadata-basic"

      result = run_inspec_process(cmd, json: true)

      assert_json_controls_passing(result)
      _(result.stderr).must_be_empty
    end

    it "works when using the legacy 'attributes' key" do
      cmd = "exec #{inputs_profiles_path}/metadata-legacy"

      result = run_inspec_process(cmd, json: true)

      assert_json_controls_passing(result)
      # Will eventually issue deprecation warning
    end

    it "does not error when inputs are empty" do
      cmd = "exec "
      cmd += File.join(inputs_profiles_path, "metadata-empty")

      result = run_inspec_process(cmd, json: true)

      _(result.stderr).must_include "WARN: Inputs must be defined as an Array in metadata files. Skipping definition from profile-with-empty-attributes."
      assert_exit_code 0, result
    end

    it "errors with invalid input types" do
      cmd = "exec "
      cmd += File.join(inputs_profiles_path, "metadata-invalid")

      result = run_inspec_process(cmd, json: true)

      _(result.stderr).must_equal "Type 'Color' is not a valid input type.\n"
      assert_exit_code 1, result
    end

    it "errors with required input not defined" do
      cmd = "exec "
      cmd += File.join(inputs_profiles_path, "metadata-required")

      result = run_inspec_process(cmd, json: true)

      _(result.stderr).must_include "Input 'a_required_input' is required and does not have a value.\n"
      assert_exit_code 1, result
    end

    describe "when profile inheritance is used" do
      it "should correctly assign input values using namespacing" do
        cmd = "exec " + File.join(inputs_profiles_path, "inheritance", "wrapper")

        result = run_inspec_process(cmd, json: true)

        assert_json_controls_passing(result)
      end
    end
  end

  describe "when using a profile with undeclared (valueless) inputs" do
    it "should warn about them and not abort the run" do
      cmd = "exec #{inputs_profiles_path}/undeclared"

      result = run_inspec_process(cmd, json: true)

      _(result.stderr).must_include "WARN: Input 'undeclared_01'"
      _(result.stderr).must_include "does not have a value"
      assert_json_controls_passing(result)
    end
  end

  # Addresses https://github.com/inspec/inspec/issues/4769
  describe "when using a profile with required inputs" do
    describe "when the values are not provided" do
      it "should emit an error and exit code 1" do
        cmd = "exec #{inputs_profiles_path}/required"

        result = run_inspec_process(cmd, json: true)

        _(result.stderr).must_include "Input 'required_01'"
        _(result.stderr).must_include "does not have a value"
        assert_exit_code 1, result
      end
    end
    describe "when the values are provided by an input file" do
      it "should not warn and run normally" do
        cmd = "exec #{inputs_profiles_path}/required --input-file #{inputs_profiles_path}/required/files/inputs.yaml"

        result = run_inspec_process(cmd, json: true)

        _(result.stderr).must_be_empty
        assert_json_controls_passing(result)
      end
    end
    describe "when the values are provided by a CLI flag" do
      it "should not warn and run normally" do
        cmd = "exec #{inputs_profiles_path}/required --input required_01=anything"

        result = run_inspec_process(cmd, json: true)

        _(result.stderr).must_be_empty
        assert_json_controls_passing(result)
      end
    end
  end

  describe "when a profile is used with sensitive inputs" do
    it "should access the values but hide them in the reporter data" do
      result = run_inspec_process("exec #{inputs_profiles_path}/metadata-sensitive", json: true)
      _(result.stderr).must_be_empty
      assert_json_controls_passing(result)
      # Inspect the JSON result to find the inputs hash and verify they are redacted as needed
      inputs = @json["profiles"][0]["attributes"] # TODO rename to inputs, break automate
      _(inputs[1]["options"]["value"]).wont_include "secret"
      _(inputs[1]["options"]["value"]).must_include "***"
      _(inputs[2]["options"]["value"]).wont_include "***" # Explicit sensitive = false
    end
  end

  describe "when a profile is executed with inputs through external file, metadata file and profile DSL" do
    it "should access the values successfully from all input ways" do
      result = run_inspec_process("exec #{inputs_profiles_path}/hashmap --input-file #{external_attributes_file_path}", json: true)
      _(result.stderr).must_be_empty
      assert_json_controls_passing(result)
    end
  end

  describe "when a profile is used with input options" do
    it "should be a success for valid values when pattern flag is passed through metadata file" do
      result = run_inspec_process("exec #{inputs_profiles_path}/metadata-pattern", json: true)
      _(result.stderr).must_be_empty
      assert_json_controls_passing(result)
    end

    it "should be a success for valid values when required, type and pattern flag is passed through dsl" do
      result = run_inspec_process("exec #{inputs_profiles_path}/dsl --controls pattern_flag_success_check required_flag_success_check type_flag_success_check", json: true)
      _(result.stderr).must_be_empty
      assert_json_controls_passing(result)
    end

    it "should be a failure for invalid value when required flag is passed through dsl" do
      result = run_inspec_process("exec #{inputs_profiles_path}/dsl --controls required_flag_failure_check", json: true)
      _(result.stderr).must_include "Input 'input_value_04' is required and does not have a value.\n"
      assert_exit_code 1, result
    end

    it "should be a failure for invalid value when type flag is passed through dsl" do
      result = run_inspec_process("exec #{inputs_profiles_path}/dsl --controls type_flag_failure_check", json: true)
      _(result.stderr).must_be_empty
      output = JSON.parse(result[0])
      assert_equal "failed", output["profiles"][0]["controls"][0]["results"][0]["status"]
      assert_exit_code(100, result)
    end

    it "should be a failure for invalid value when pattern flag is passed through dsl" do
      result = run_inspec_process("exec #{inputs_profiles_path}/dsl --controls pattern_flag_failure_check", json: true)
      _(result.stderr).must_be_empty
      output = JSON.parse(result[0])
      assert_equal "failed", output["profiles"][0]["controls"][0]["results"][0]["status"]
      assert_exit_code(100, result)
    end
  end
end
