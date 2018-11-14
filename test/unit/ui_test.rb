# require 'helper'

require 'minitest'
require 'minitest/spec'
require 'inspec/ui'
require 'stringio'
require 'byebug'

# https://gist.github.com/chrisopedia/8754917
# http://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html#256-colors
ANSI_CODES = {
  reset: '\e[0m',
  bold: '\e[1m',
  color: {
    red: '\e[38;5;9m',      # 256-color light red
    green: '\e[38;5;41m',  # 256-color light green
    yellow: '\e[33m',
    white: '\e[37m',
    grey: '\e[38;5;247m',  # 256-color medium grey
  },
}.freeze

GLYPHS = {
  list_item: '•', # BULLET, Unicode: U+2022, UTF-8: E2 80 A2
  check: '✔', #  HEAVY CHECK MARK, Unicode: U+2714, UTF-8: E2 9C 94
  swirl: '↺', # ANTICLOCKWISE OPEN CIRCLE ARROW, Unicode U+21BA, UTF-8: E2 86 BA
  script_x: '×', # MULTIPLICATION SIGN, Unicode: U+00D7, UTF-8: C3 97
  question: '?', # normal ASCII question mark
  em_dash: '—', # EM DASH Unicode: U+2014, UTF-8: E2 80 94'
}.freeze


#=============================================================================#
#                        Low-Level Formatting
#=============================================================================#
describe 'Inspec::UI low-level Formatting' do
  let(:fixture_io) { StringIO.new() }
  let(:output) { fixture_io.string }
  let(:ui) { Inspec::UI.new(io: fixture_io) }

  describe 'plain' do
    it 'uses no ANSI markers' do
      ui.plain('test')
      output.must_include('test')
      output.wont_include('\e[')
    end
  end

  describe 'when color is enabled' do
    let(:ui) { Inspec::UI.new(color: true, io: fixture_io) }
    describe 'bold' do
      it 'uses ANSI bold markers' do
        ui.bold('test')
        output.must_equal(ANSI_CODES[:bold] + 'test' + ANSI_CODES[:reset])
      end
    end
    describe 'colors' do
      [:red, :green, :yellow, :white, :grey].each do |color|
        it ('uses the color code for ' + color.to_s) do
          ui.send(color, 'test')
          output.must_equal(ANSI_CODES[:color][color] + 'test' + ANSI_CODES[:reset])
        end
      end
    end
  end

  describe 'when color is disabled' do
    let(:ui) { Inspec::UI.new(color: false, io: fixture_io) }
    describe 'bold' do
      it 'uses no ANSI codes' do
        ui.bold('test')
        output.wont_include('\e[')
        output.must_equal('test')
      end
    end
    describe 'colors' do
      [:red, :green, :yellow, :white, :grey].each do |color|
        it ('uses no ANSI codes for ' + color.to_s) do
          ui.send(color, 'test')
          output.wont_include('\e[')
          output.must_equal('test')
        end
      end
    end
  end
end

#=============================================================================#
#                        High-Level Formatting
#=============================================================================#
describe 'Inspec::UI High-Level Formatting' do
  let(:fixture_io) { StringIO.new() }
  let(:output) { fixture_io.string }

  describe 'when color is enabled' do
    let(:ui) { Inspec::UI.new(color: true, io: fixture_io) }

    describe 'headline' do
      it 'formats the headline when short' do
        ui.headline('test')
        output.must_match(/^\n\n/) # Start with two newlines
        expected = ''
        expected += ' ' + GLYPHS[:em_dash] * 36 + ' '
        expected += ANSI_CODES[:bold] + ANSI_CODES[:color][:white] + 'test' + ANSI_CODES[:reset]
        expected += ' ' + GLYPHS[:em_dash] * 36 + ' '
        output.must_include(expected)
        output.must_match(/^\n$/) # End with a newline
      end
      it 'formats the headline when longer' do
        ui.headline('Testing is Such a Pleasure!')
        expected = ''
        expected += ' ' + GLYPHS[:em_dash] * 24 + ' '
        expected += ANSI_CODES[:bold] + ANSI_CODES[:color][:white] + 'Testing is Such a Pleasure!' + ANSI_CODES[:reset]
        expected += ' ' + GLYPHS[:em_dash] * 24 + ' '
        output.must_include(expected)
      end
    end

    describe 'error' do
      it 'formats the message' do
        ui.error('Everything has gone terribly wrong')
        expected = ''
        expected += ANSI_CODES[:bold] + ANSI_CODES[:color][:red]
        expected += 'ERROR:'
        expected += ANSI_CODES[:reset]
        expected += ' '
        expected += 'Everything has gone terribly wrong'
        output.must_include(expected)
        output.must_match(/\n$/) # End with a newline
      end
    end

    describe 'warning' do
      it 'formats the message' do
        ui.warning('Maybe we can still pull through this')
        expected = ''
        expected += ANSI_CODES[:bold] + ANSI_CODES[:color][:yellow]
        expected += 'WARNING:'
        expected += ANSI_CODES[:reset]
        expected += ' '
        expected += 'Maybe we can still pull through this'
        output.must_include(expected)
        output.must_match(/\n$/) # End with a newline
      end
    end

  end

  describe 'when color is disabled' do
    let(:ui) { Inspec::UI.new(color: false, io: fixture_io) }

    describe 'headline' do
      it 'formats the headline when short' do
        ui.headline('test')
        output.wont_include('\e[') # No ANSI escapes
        output.wont_match(/[^[:ascii:]]/) # No non-ASCII chars (such as UTF-8 glyphs)
        expected = ''
        expected += ' ' + '-' * 36 + ' '
        expected += 'test'
        expected += ' ' + '-' * 36 + ' '
        output.must_include(expected)
      end
    end

    describe 'error' do
      it 'formats the message without color' do
        ui.error('Everything has gone terribly wrong')
        output.wont_include('\e[') # No ANSI escapes
        output.wont_match(/[^[:ascii:]]/) # No non-ASCII chars (such as UTF-8 glyphs)
        expected = ''
        expected += 'ERROR:'
        expected += ' '
        expected += 'Everything has gone terribly wrong'
        output.must_include(expected)
        output.must_match(/\n$/) # End with a newline
      end
    end

    describe 'warning' do
      it 'formats the message' do
        ui.warning('Maybe we can still pull through this')
        output.wont_include('\e[') # No ANSI escapes
        output.wont_match(/[^[:ascii:]]/) # No non-ASCII chars (such as UTF-8 glyphs)
        expected = ''
        expected += 'WARNING:'
        expected += ' '
        expected += 'Maybe we can still pull through this'
        output.must_include(expected)
        output.must_match(/\n$/) # End with a newline
      end
    end
  end
end

#=============================================================================#
#                          Tables and Lists
#=============================================================================#
# table header
# table row
# horizontal line
# list item

#=============================================================================#
#                             Exit Codes
#=============================================================================#
# exit(code) => Kernel.exit code

#=============================================================================#
#                       Backwards Compatibility
#=============================================================================#
# mark_text(text) => "\e[0;36m#{text}\e[0m"
# headline(title) => "\n== #{title}\n\n"
# plain_text(msg) => msg
# li(entry) => " #{mark_text('*')} #{entry}"

#=============================================================================#
#                           Interactivity
#=============================================================================#
# prompt inline
# prompt menu
