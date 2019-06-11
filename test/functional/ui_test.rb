require "functional/helper"

# NOTE: Trailing spaces are intentional and *required* in this file.

# Strategy: use a fixture CLI plugin that has
# various commands that exercise the UI

# The unit tests are very thorough, so we don't test low-level things here

module VisibleSpaces
  def show_spaces(str)
    str.tr!(" ", "S")
    str.tr!("\n", "N")
  end
end

describe "InSpec UI behavior" do
  include PluginFunctionalHelper
  include VisibleSpaces

  before do
    skip_windows!
  end

  let(:plugin_path) { File.join(mock_path, "plugins", "inspec-test-ui", "lib", "inspec-test-ui") }
  let(:run_result) { run_inspec_with_plugin("#{pre_opts} testui #{feature} #{post_opts}", plugin_path: plugin_path) }
  let(:pre_opts) { "" }
  let(:post_opts) { "" }

  describe "with default options" do

    describe "headline" do
      let(:feature) { "headline" }
      it "has correct output" do
        run_result.exit_status.must_equal 0
        expected = <<-EOT

 ───────────────────────────────── \e[1m\e[37mBig News!\e[0m ─────────────────────────────────

        EOT
        show_spaces(run_result.stdout).must_equal show_spaces(expected)
      end
    end

    describe "table" do
      let(:feature) { "table" }
      it "has correct output" do
        run_result.exit_status.must_equal 0
        expected = <<~EOT
          ┌──────────────────────┬──────────┬───────────┐
          │\e[1m\e[37m         Band         \e[0m│\e[1m\e[37m Coolness \e[0m│\e[1m\e[37m Nerd Cred \e[0m│
          ├──────────────────────┼──────────┼───────────┤
          │ They Might Be Giants │ Low      │ Very High │
          │ Led Zep              │ High     │ Low       │
          │ Talking Heads        │ Moderate │ High      │
          └──────────────────────┴──────────┴───────────┘
        EOT
        show_spaces(run_result.stdout).must_equal show_spaces(expected)
      end
    end

    describe "warning" do
      let(:feature) { "warning" }
      it "has correct output" do
        run_result.exit_status.must_equal 0
        expected = <<~EOT
          \e[1m\e[33mWARNING:\e[0m Things will be OK in the end
        EOT
        show_spaces(run_result.stdout).must_equal show_spaces(expected)
      end
    end

    describe "error" do
      let(:feature) { "error" }
      it "has correct output" do
        run_result.exit_status.must_equal 0
        expected = <<~EOT
          \e[1m\e[38;5;9mERROR:\e[0m Burned down, fell over, and then sank into the swamp.
        EOT
        show_spaces(run_result.stdout).must_equal show_spaces(expected)
      end
    end

    describe "list_item" do
      let(:feature) { "list_item" }
      it "has correct output" do
        run_result.exit_status.must_equal 0
        expected = <<-EOT
 \e[1m\e[37m•\e[0m TODO: make more lists
        EOT
        show_spaces(run_result.stdout).must_equal show_spaces(expected)
      end
    end
  end

  describe "with --no-color option" do
    # Note: the pre_opts position does not work for any class_option
    let(:post_opts) { "--no-color" }
    describe "everything" do
      let(:feature) { "everything" }
      it "has correct output" do
        run_result.exit_status.must_equal 0
        expected = <<~EOT

           --------------------------------- Big News! ---------------------------------

          +----------------------+----------+-----------+
          |         Band         | Coolness | Nerd Cred |
          +----------------------+----------+-----------+
          | They Might Be Giants | Low      | Very High |
          | Led Zep              | High     | Low       |
          | Talking Heads        | Moderate | High      |
          +----------------------+----------+-----------+
          WARNING: Things will be OK in the end
          ERROR: Burned down, fell over, and then sank into the swamp.
           * TODO: make more lists
        EOT
        show_spaces(run_result.stdout).must_equal show_spaces(expected)
      end
    end
  end

  describe "exit codes" do
    describe "normal exit" do
      let(:feature) { "exitnormal" }
      it "has correct output" do
        assert_exit_code 0, run_result
        run_result.stderr.must_equal ""
        run_result.stdout.must_equal "test exit normal\n"
      end
    end

    describe "usage exit" do
      let(:feature) { "exitusage" }
      it "has correct output" do
        assert_exit_code 1, run_result
        run_result.stderr.must_equal "" # ie, we intentionally exit-1'd; not a crash
        run_result.stdout.must_equal "test exit usage_error\n"
      end
    end

    describe "plugin exit" do
      let(:feature) { "exitplugin" }
      it "has correct output" do
        assert_exit_code 2, run_result
        run_result.stderr.must_equal ""
        run_result.stdout.must_equal "test exit plugin_error\n"
      end
    end

    describe "skipped exit" do
      let(:feature) { "exitskipped" }
      it "has correct output" do
        assert_exit_code 101, run_result
        run_result.stderr.must_equal ""
        run_result.stdout.must_equal "test exit skipped_tests\n"
      end
    end

    describe "failed exit" do
      let(:feature) { "exitfailed" }
      it "has correct output" do
        assert_exit_code 100, run_result
        run_result.stderr.must_equal ""
        run_result.stdout.must_equal "test exit failed_tests\n"
      end
    end

  end

  describe "interactivity" do
    describe "in interactive mode" do
      let(:post_opts) { "--interactive" }
      describe "the interactive flag" do
        let(:feature) { "interactive" }
        it "should report the interactive flag is on" do
          assert_exit_code 0, run_result
          run_result.stdout.must_include "true"
        end
      end

      # On windows, tty-prompt's prompt() does not support the :timeout option.
      # This appears to be undocumented. If you run the test plugin
      # on windows, you'll see this invocation counts down to 0 then
      # hangs, waiting for an Enter keypress.
      #
      # Since we can't do an (automated) interactive test without
      # a timeout, skip the test on windows.
      unless FunctionalHelper.is_windows?
        describe "prompting" do
          let(:feature) { "prompt" }
          it "should launch apollo" do
            assert_exit_code 0, run_result
            run_result.stdout.must_include "Apollo"
          end
        end
      end
    end
  end

  describe "in non-interactive mode" do
    let(:post_opts) { "--no-interactive" }
    describe "the interactive flag" do
      let(:feature) { "interactive" }
      it "should report the interactive flag is off" do
        assert_exit_code 0, run_result
        run_result.stdout.must_include "false"
      end
    end

    describe "prompting" do
      let(:feature) { "prompt" }
      it "should crash with stacktrace" do
        assert_exit_code 1, run_result
        run_result.stderr.must_include "Inspec::UserInteractionRequired"
      end
    end
  end
end
