require "functional/helper"

describe "inspec shell tests" do
  include FunctionalHelper
  let(:input_file_from_basic_input_profile) { File.join(profile_path, "inputs", "basic", "files", "flat.yaml") }

  parallelize_me!

  describe "cmd" do
    def assert_shell_c(code, exit_status, json = false, stderr = "")
      json_suffix = " --reporter 'json'" if json
      command = "shell -c '#{code.tr("'", '\\\'')}'#{json_suffix}"
      # On darwin this value is:
      # shell -c 'describe file(\"/Users/nickschwaderer/Documents/inspec/inspec/test/functional/inspec_shell_test.rb\") do it { should exist } end' --reporter 'json'"
      # appears to break in windows.
      out = inspec(command)

      actual = out.stderr.gsub(/\e\[(\d+)(;\d+)*m/, "") # strip ANSI color codes
      _(actual).must_equal stderr

      assert_exit_code exit_status, out

      out
    end

    def assert_shell_c_with_inputs(code, input_cmd, input, exit_status, json = false, stderr = "")
      json_suffix = " --reporter 'json'" if json
      command = "shell -c '#{code.tr("'", '\\\'')}'#{input_cmd} #{input}#{json_suffix}"
      # On darwin this value is:
      # shell -c 'describe file(\"/Users/nickschwaderer/Documents/inspec/inspec/test/functional/inspec_shell_test.rb\") do it { should exist } end' --reporter 'json'"
      # appears to break in windows.
      out = inspec(command)

      actual = out.stderr.gsub(/\e\[(\d+)(;\d+)*m/, "") # strip ANSI color codes
      _(actual).must_equal stderr

      assert_exit_code exit_status, out

      out
    end

    it "loads a dependency" do
      res = inspec("shell -c 'example_config' --depends #{example_profile}")

      _(res.stdout.chop).must_equal "example_config"

      _(res.stderr).must_equal ""

      assert_exit_code 0, res
    end

    it "confirm file caching is disabled" do
      out = assert_shell_c("inspec.backend.cache_enabled?(:file)", 0)

      _(out.stdout.chop).must_equal "false"
    end

    it "confirm command caching is disabled" do
      out = assert_shell_c("inspec.backend.cache_enabled?(:command)", 0)

      _(out.stdout.chop).must_equal "false"
    end

    it "can run ruby expressions (json output)" do
      x = rand
      y = rand
      out = assert_shell_c("#{x} + #{y}", 0, true)

      j = JSON.load(out.stdout)
      _(j).must_equal x + y
    end

    it "can run ruby expressions" do
      x = rand
      y = rand
      out = assert_shell_c("#{x} + #{y}", 0)

      _(out.stdout).must_equal "#{x + y}\n"
    end

    it "can run arbitrary ruby (json output)" do
      # You cannot have a pipe in a windows command line
      return if is_windows?

      out = assert_shell_c("x = [1,2,3].inject(0) {|a,v| a + v*v}; x+10", 0, true)

      j = JSON.load(out.stdout)
      _(j).must_equal 24 # 1^2 + 2^2 + 3^2 + 10
    end

    it "can run arbitrary ruby" do
      # You cannot have a pipe in a windows command line
      return if is_windows?

      out = assert_shell_c("x = [1,2,3].inject(0) {|a,v| a + v*v}; x+10", 0)
      _(out.stdout).must_equal "24\n"
    end

    it "retrieves resources (json output)" do
      out = assert_shell_c("platform.params", 0, true)
      j = JSON.load(out.stdout)
      _(j.keys).must_include "name"
      _(j.keys).must_include "families"
      _(j.keys).must_include "arch"
      _(j.keys).must_include "release"
    end

    it "retrieves resources" do
      out = assert_shell_c("os.params", 0)
      _(out.stdout).must_include "name"
      _(out.stdout).must_include "families"
      _(out.stdout).must_include "arch"
      _(out.stdout).must_include "release"
    end

    it "runs anonymous tests that succeed (json output)" do
      skip_windows! # Breakage confirmed
      # All skip_windows breakages have this output:
      # Expected: ""
      # C:/Users/some/path/inspec/inspec/lib/inspec/profile_context.rb:168:in `instance_eval': (eval):1: syntax error, unexpected tIDENTIFIER, expecting ')' (SyntaxError)
      #   describe file(" "foo/bar/baz) do it { should exis...
      #                    ^~~
      #   (eval):1: syntax error, unexpected ')', expecting end-of-input
      #   describe file(" "foo/bar/baz) do it { should exist } end
      #                               ^
      # from C:/Users/some/path/inspec/inspec/lib/inspec/profile_context.rb:168:in `load_with_context'
      # from C:/Users/some/path/inspec/inspec/lib/inspec/profile_context.rb:154:in `load_control_file'
      # from C:/Users/some/path/inspec/inspec/lib/inspec/runner.rb:250:in `eval_with_virtual_profile'
      # from C:/Users/some/path/inspec/inspec/lib/inspec/cli.rb:400:in `run_command'
      # from C:/Users/some/path/inspec/inspec/lib/inspec/cli.rb:339:in `shell_func'
      # from C:/Ruby/lib/ruby/gems/2.6.0/gems/thor-1.0.1/lib/thor/command.rb:27:in `run'
      # from C:/Ruby/lib/ruby/gems/2.6.0/gems/thor-1.0.1/lib/thor/invocation.rb:127:in `invoke_command'
      # from C:/Ruby/lib/ruby/gems/2.6.0/gems/thor-1.0.1/lib/thor.rb:392:in `dispatch'
      # from C:/Ruby/lib/ruby/gems/2.6.0/gems/thor-1.0.1/lib/thor/base.rb:485:in `start'
      # from C:/Users/some/path/inspec/inspec/lib/inspec/base_cli.rb:35:in `start'
      # from C:/Users/some/path/inspec/inspec/inspec-bin/bin/inspec:11:in `<main>'
      out = assert_shell_c("describe file(\"#{__FILE__}\") do it { should exist } end", 0, true)
      j = JSON.load(out.stdout)
      _(j.keys).must_include "version"
      _(j.keys).must_include "profiles"
      _(j.keys).must_include "statistics"
    end

    it "runs anonymous tests that succeed" do
      skip_windows! # Breakage confirmed
      out = assert_shell_c("describe file(\"#{__FILE__}\") do it { should exist } end", 0)
      _(out.stdout).must_include "1 successful"
      _(out.stdout).must_include "0 failures"
    end

    it "runs anonymous tests that fail (json output)" do
      skip_windows! # Breakage confirmed
      out = assert_shell_c("describe file(\"foo/bar/baz\") do it { should exist } end", 100, true)
      j = JSON.load(out.stdout)
      _(j.keys).must_include "version"
      _(j.keys).must_include "profiles"
      _(j.keys).must_include "statistics"
    end

    it "runs anonymous tests that fail" do
      skip_windows! # Breakage confirmed
      out = assert_shell_c("describe file(\"foo/bar/baz\") do it { should exist } end", 100)
      _(out.stdout).must_include "0 successful"
      _(out.stdout).must_include "1 failure"
    end

    it "runs controls with tests (json output)" do
      skip_windows! # Breakage confirmed
      out = assert_shell_c("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end end", 0, true)
      j = JSON.load(out.stdout)
      _(j.keys).must_include "version"
      _(j.keys).must_include "profiles"
      _(j.keys).must_include "statistics"
    end

    it "runs controls with tests" do
      skip_windows! # Breakage confirmed
      out = assert_shell_c("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end end", 0)
      _(out.stdout).must_include "1 successful"
      _(out.stdout).must_include "0 failures"
    end

    it "runs controls with multiple tests (json output)" do
      skip_windows! # Breakage confirmed
      out = assert_shell_c("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end; describe file(\"foo/bar/baz\") do it { should exist } end end", 100, true)
      j = JSON.load(out.stdout)
      _(j.keys).must_include "version"
      _(j.keys).must_include "profiles"
      _(j.keys).must_include "statistics"
    end

    it "runs controls with multiple tests" do
      skip_windows! # Breakage confirmed
      out = assert_shell_c("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end; describe file(\"foo/bar/baz\") do it { should exist } end end", 100)
      _(out.stdout).must_include "0 successful"
      _(out.stdout).must_include "1 failure"
    end

    it "loads input from external input file" do
      skip_windows! # Breakage confirmed
      out = assert_shell_c_with_inputs("describe input(\"a_quoted_string\") do it { should cmp \"Should not have quotes\" } end", " --input-file", input_file_from_basic_input_profile, 0)
      _(out.stdout).must_include "1 successful"
      _(out.stdout).must_include "0 failures"
    end

    it "loads input from input cli" do
      skip_windows! # Breakage confirmed
      out = assert_shell_c_with_inputs("describe input(\"test_input_01\") do it { should cmp \"value_from_cli_01\" } end", " --input", "test_input_01='value_from_cli_01'", 0)
      _(out.stdout).must_include "1 successful"
      _(out.stdout).must_include "0 failures"
    end
  end

  # Pry does not support STDIN from windows currently. Skipping these for now.
  unless FunctionalHelper.is_windows?

    describe "shell" do
      attr_accessor :out

      def stdout
        out.stdout.gsub(/\e\[(\d+)(;\d+)*m/, "") # strip ANSI color codes
      end

      def stderr
        out.stderr.gsub(/\e\[(\d+)(;\d+)*m/, "") # strip ANSI color codes
      end

      def do_shell(code, exit_status = 0, stderr = "")
        cmd = "echo '#{code.tr("'", '\\\'')}' | #{exec_inspec} shell"
        self.out = CMD.run_command(cmd)

        assert_exit_code exit_status, out

        out
      end

      it "loads a dependency" do
        cmd = "echo 'example_config' | #{exec_inspec} shell --depends #{example_profile}"
        res = CMD.run_command(cmd)

        _(res.stdout).must_include "=> example_config"

        assert_exit_code 0, res
      end

      it "displays the target device information for the user without requiring the help command" do
        out = do_shell("1+1")
        _(out.stdout).must_include "You are currently running on:"
      end

      it "provides a help command" do
        out = do_shell("help")
        _(out.stdout).must_include "Available commands:"
        _(out.stdout).must_include "You are currently running on:"
      end

      it "provides resource help" do
        out = do_shell("help file")
        _(out.stdout).must_include "Use the file InSpec audit resource"
      end

      it "provides helpful feedback if an invalid resource is provided" do
        out = do_shell("help not_a_valid_resource")
        _(out.stdout).must_include "The resource not_a_valid_resource does not exist."
      end

      it "provides a list of resources" do
        out = do_shell("help resources")
        _(out.stdout).must_include " - command"
        _(out.stdout).must_include " - file"
        _(out.stdout).must_include " - sshd_config"
      end

      it "provides matchers help" do
        out = do_shell("help matchers")
        _(out.stdout).must_include "For more examples, see: https://docs.chef.io/inspec/matchers/"
      end

      it "provides empty example help" do
        out = do_shell("help file")
        _(out.stdout).must_include "Name"
        _(out.stdout).must_include "Description"
        _(out.stdout).must_include "Example"
        _(out.stdout).must_include "Web Reference"
      end

      it "exposes all resources" do
        out = do_shell("os")
        _(out.stdout).must_match(/\=> .*Operating.* .*System.* .*Detection/)
      end

      it "can run ruby expressions" do
        x = rand
        y = rand
        out = do_shell("#{x} + #{y}")
        _(out.stdout).must_include "#{x + y}"
      end

      it "can run arbitrary ruby" do
        out = do_shell("x = [1,2,3].inject(0) {|a,v| a + v*v}; x+10")
        _(out.stdout).must_include "24"
      end

      it "runs anonymous tests that succeed" do
        out = do_shell("describe file(\"#{__FILE__}\") do it { should exist } end")
        _(out.stdout).must_include "1 successful"
        _(out.stdout).must_include "0 failures"
      end

      it "runs anonymous tests that fail" do
        out = do_shell("describe file(\"foo/bar/baz\") do it { should exist } end")
        _(out.stdout).must_include "0 successful"
        _(out.stdout).must_include "1 failure"
      end

      it "runs controls with tests" do
        out = do_shell("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end end")
        _(out.stdout).must_include "1 successful"
        _(out.stdout).must_include "0 failures"
      end

      it "runs controls with multiple tests" do
        out = do_shell("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end; describe file(\"foo/bar/baz\") do it { should exist } end end")
        _(out.stdout).must_include "0 successful"
        _(out.stdout).must_include "1 failure"
      end

      it "reruns controls when redefined" do
        out = do_shell("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end end\ncontrol \"test\" do describe file(\"foo/bar/baz\") do it { should exist } end end")
        _(out.stdout).must_include "1 successful"
        _(out.stdout).must_include "1 failure"
      end
    end
  end
end
