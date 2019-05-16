
require 'helper'

describe Inspec::Reporters::CLI do
  WINDOWS = RUBY_PLATFORM =~ /windows|mswin|msys|mingw|cygwin/
  let(:path) { File.expand_path(File.dirname(__FILE__)) }
  let(:report) do 
    data = JSON.parse(File.read(path + '/../mock/reporters/run_data.json'), symbolize_names: true)
    cli = Inspec::Reporters::CLI
    cli.new({ run_data: data })
  end
  let(:profile) { report.run_data[:profiles].first }
  let(:control) { Inspec::Reporters::CLI::Control }

  before do
    RSpec.configuration.color = true if defined?(RSpec.configuration)
  end

  def windowize(string)
    string.gsub!('✔', '[PASS]')
    string.gsub!('↺', '[SKIP]')
    string.gsub!('×', '[FAIL]')
    string.gsub!("\e[38;5;41m", "\e[0;1;32m")
    string.gsub!("\e[38;5;9m", "\e[0;1;31m")
    string.gsub!("\e[38;5;208m", "\e[0;1;31m")
    string.gsub!("\e[38;5;247m", "\e[0;37m")
  end

  describe '#render' do
    it 'confirm render output' do
      if WINDOWS
        cli_output = File.open(path + '/../mock/reporters/cli_output_windows', 'r:UTF-8').read
      else
        cli_output = File.open(path + '/../mock/reporters/cli_output', 'r:UTF-8').read
      end

      report.render
      report.rendered_output.must_equal cli_output
    end
  end

  describe '#print_profile_header' do
    it 'confirm header output' do
      expected = <<~EOF
      Profile: InSpec Profile (long_commands)
      Version: 0.1.0
      Target:  local://

      EOF
      report.send(:print_profile_header, profile).must_equal expected
    end
  end

  describe '#print_standard_control_results' do
    it 'confirm stand control output' do
      report.instance_variable_set(:@control_count, 0)
      expected = <<~EOF
      \e[38;5;41m  ✔  tmp-1.0: Create /tmp directory\e[0m
      \e[38;5;41m     ✔  File /tmp should be directory\e[0m

      EOF
      windowize(expected) if WINDOWS

      report.send(:print_standard_control_results, profile)
      output = report.instance_variable_get(:@output)
      output.must_equal expected
    end
  end

  describe '#print_anonymous_control_results' do
    it 'confirm anon control output' do
      report.instance_variable_set(:@control_count, 0)
      expected = <<~EOF
        File /tmp
      \e[38;5;41m     ✔  should be directory\e[0m
        gem package rubocop
      \e[38;5;9m     ×  should be installed
           rubocop is not installed\e[0m
        stdout
      \e[38;5;41m     ✔  stdout should eq \"jquick\\n\"\e[0m
      EOF
      windowize(expected) if WINDOWS

      report.send(:print_anonymous_control_results, profile)
      output = report.instance_variable_get(:@output)
      output.must_equal expected
    end
  end

  describe '#format_profile_name' do
    it 'confirm profile name format' do
      expected = "InSpec Profile (long_commands)"

      report.send(:format_profile_name, profile).must_equal expected
    end

    it 'confirm unknown name' do
      profile[:name] = nil
      expected = "InSpec Profile (unknown)"

      report.send(:format_profile_name, profile).must_equal expected
    end

    it 'confirm unknown title' do
      profile[:title] = nil
      expected = "long_commands"

      report.send(:format_profile_name, profile).must_equal expected
    end
  end

  describe '#format_control_header' do
    it 'confirm control header output' do
      expected = "  File /tmp"
      profile_control = control.new(profile[:controls].first)

      report.send(:format_control_header, profile_control).must_equal expected
    end
  end

  describe '#format_result' do
    let(:profile_control) do
      control.new(profile[:controls].first)
    end
    let(:result) { profile_control.data[:results].first }

    it 'confirm standard result' do
      output = report.send(:format_result, profile_control, result, :standard)
      expected = "\e[38;5;41m     ✔  File /tmp should be directory\e[0m"
      windowize(expected) if WINDOWS

      output.must_equal expected
    end

    it 'confirm anonymous result' do
      output = report.send(:format_result, profile_control, result, :anonymous)
      expected = "\e[38;5;41m     ✔  should be directory\e[0m"
      windowize(expected) if WINDOWS

      output.must_equal expected
    end

    it 'confirm skip result' do
      result[:status] = 'skipped'
      output = report.send(:format_result, profile_control, result, :anonymous)
      expected = "\e[38;5;247m     ↺  \e[0m"
      windowize(expected) if WINDOWS

      output.must_equal expected
    end
  end

  describe '#print_profile_summary' do
    let(:control) { profile[:controls].select { |c| c[:id] == 'tmp-1.0' } }
    it 'confirm profile summary' do
      report.send(:print_profile_summary)
      expected = "Profile Summary: \e[38;5;41m1 successful control\e[0m, 0 control failures, 0 controls skipped\n"
      windowize(expected) if WINDOWS

      output = report.instance_variable_get(:@output)
      output.must_equal expected
    end

    it 'confirm profile summary with skip' do
      control.first[:results].first[:status] = 'skipped'
      report.send(:print_profile_summary)
      expected = "Profile Summary: 0 successful controls, 0 control failures, \e[38;5;247m1 control skipped\e[0m\n"
      windowize(expected) if WINDOWS

      output = report.instance_variable_get(:@output)
      output.must_equal expected
    end

    it 'confirm profile summary with fail' do
      control.first[:results].first[:status] = 'failed'
      report.send(:print_profile_summary)
      expected = "Profile Summary: 0 successful controls, \e[38;5;9m1 control failure\e[0m, 0 controls skipped\n"
      windowize(expected) if WINDOWS

      output = report.instance_variable_get(:@output)
      output.must_equal expected
    end
  end

  describe '#print_tests_summary' do
    it 'confirm tests summary' do
      report.send(:print_tests_summary)
      output = report.instance_variable_get(:@output)
      expected = "Test Summary: \e[38;5;41m3 successful\e[0m, \e[38;5;9m1 failure\e[0m, 0 skipped\n"
      windowize(expected) if WINDOWS

      output.must_equal expected
    end

    it 'confirm tests summary skip' do
      profile[:controls].first[:results].first[:status] = 'skipped'
      report.send(:print_tests_summary)
      output = report.instance_variable_get(:@output)
      expected = "Test Summary: \e[38;5;41m2 successful\e[0m, \e[38;5;9m1 failure\e[0m, \e[38;5;247m1 skipped\e[0m\n"
      windowize(expected) if WINDOWS

      output.must_equal expected
    end
  end

  describe '#format_with_color' do
    it 'confirm color format passed' do
      expected = "\e[38;5;41mtest text\e[0m"
      windowize(expected) if WINDOWS
      report.send(:format_with_color, 'passed', 'test text').must_equal expected
    end

    it 'confirm color format failed' do
      expected = "\e[38;5;9mtest text\e[0m"
      windowize(expected) if WINDOWS
      report.send(:format_with_color, 'failed', 'test text').must_equal expected
    end
  end

  describe '#standard_controls_from_profile' do
    it 'confirm controls' do
      result = report.send(:standard_controls_from_profile, profile)
      result.count.must_equal 1
      result.first[:id].must_equal 'tmp-1.0'
    end
  end

  describe '#anonymous_controls_from_profile' do
    it 'confirm controls' do
      result = report.send(:anonymous_controls_from_profile, profile)
      result.count.must_equal 3
      result.first[:id].must_match(/generated/)
    end
  end

  describe '#is_anonymous_control?' do
    it 'confirm anonymous control' do
      controls = profile[:controls].select { |c| c[:id] != 'tmp-1.0' }
      report.send(:is_anonymous_control?, controls.first).must_equal true
    end

    it 'confirm anonymous control false' do
      controls = profile[:controls].select { |c| c[:id] == 'tmp-1.0' }
      report.send(:is_anonymous_control?, controls.first).must_equal false
    end
  end

  describe '#format_message' do
    let(:message_info) do
      {
        indicator: 'passed',
        color: 'passed',
        indentation: 2,
        message: 'this is a test message',
      }
    end

    it 'confirm message format' do
      expected = "\e[38;5;41m  ✔  this is a test message\e[0m"
      windowize(expected) if WINDOWS
      report.send(:format_message, message_info).must_equal expected
    end

    it 'confirm message format failed' do
      message_info[:indicator] = 'failed'
      message_info[:color] = 'failed'
      expected = "\e[38;5;9m  ×  this is a test message\e[0m"
      windowize(expected) if WINDOWS
      report.send(:format_message, message_info).must_equal expected
    end

    it 'confirm message format skipped' do
      message_info[:indicator] = 'skipped'
      message_info[:color] = 'skipped'
      expected = "\e[38;5;247m  ↺  this is a test message\e[0m"
      windowize(expected) if WINDOWS
      report.send(:format_message, message_info).must_equal expected
    end
  end

  describe '#indent_lines' do
    it 'confirm line indent' do
      report.send(:indent_lines, 'test', 2).must_equal '  test'
    end
  end

  describe '#all_unique_controls' do
    it 'return unique controls' do
      report.send(:all_unique_controls).count.must_equal 4
    end
  end

  describe '#profile_summary' do
    it 'correct profile summary' do
      expect = {"total"=>1, "failed"=>0, "skipped"=>0, "passed"=>1}
      report.send(:profile_summary).must_equal expect
    end
  end

  describe '#tests_summary' do
    it 'correct tests summary' do
      expect = {"total"=>0, "failed"=>1, "skipped"=>0, "passed"=>3}
      report.send(:tests_summary).must_equal expect
    end
  end
end
