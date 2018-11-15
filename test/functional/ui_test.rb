require 'functional/helper'

# NOTE: Trailing spaces are intentional and *required* in this file.

# Strategy: use a fixture CLI plugin that has
# various commands that exercise the UI

# The unit tests are very thorough, so we don't test low-level things here

module VisibleSpaces
  def show_spaces(str)
    str.tr!(' ', 'S')
    str.tr!("\n", 'N')
  end
end

describe 'InSpec UI behavior' do
  include PluginFunctionalHelper
  include VisibleSpaces

  let(:plugin_path) { File.join(mock_path, 'plugins', 'inspec-test-ui', 'lib', 'inspec-test-ui') }
  let(:run_result) { run_inspec_with_plugin("#{pre_opts} testui #{feature} #{post_opts}", plugin_path: plugin_path) }
  let(:pre_opts) { '' }
  let(:post_opts) { '' }

  describe 'with default options' do

    describe 'headline' do
      let(:feature) { 'headline' }
      it 'has correct output' do
        run_result.exit_status.must_equal 0
         expected = <<-EOT

 ───────────────────────────────── \e[1m\e[37mBig News!\e[0m ───────────────────────────────── 

EOT
        show_spaces(run_result.stdout).must_equal show_spaces(expected)
      end
    end

    describe 'table' do
      let(:feature) { 'table' }
      it 'has correct output' do
        run_result.exit_status.must_equal 0
         expected = <<-EOT
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

    describe 'warning' do
      let(:feature) { 'warning' }
      it 'has correct output' do
        run_result.exit_status.must_equal 0
         expected = <<-EOT
\e[1m\e[33mWARNING:\e[0m Things will be OK in the end
EOT
        show_spaces(run_result.stdout).must_equal show_spaces(expected)
      end
    end

    describe 'error' do
      let(:feature) { 'error' }
      it 'has correct output' do
        run_result.exit_status.must_equal 0
         expected = <<-EOT
\e[1m\e[38;5;9mERROR:\e[0m Burned down, fell over, and then sank into the swamp.
EOT
        show_spaces(run_result.stdout).must_equal show_spaces(expected)
      end
    end

    describe 'list_item' do
      let(:feature) { 'list_item' }
      it 'has correct output' do
        run_result.exit_status.must_equal 0
         expected = <<-EOT
 \e[1m\e[37m•\e[0m TODO: make more lists
EOT
        show_spaces(run_result.stdout).must_equal show_spaces(expected)
      end
    end

  end
end