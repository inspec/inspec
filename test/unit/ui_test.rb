# require 'helper'

require 'minitest'
require 'minitest/spec'
require 'inspec/ui'
require 'inspec/cli'
require 'stringio'
require 'byebug'

# https://gist.github.com/chrisopedia/8754917
# http://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html#256-colors
ANSI_CODES = {
  reset: "\e[0m",
  bold: "\e[1m",
  color: {
    red: "\e[38;5;9m",      # 256-color light red
    green: "\e[38;5;41m",  # 256-color light green
    yellow: "\e[33m",
    cyan: "\e[36m",
    white: "\e[37m",
    grey: "\e[38;5;247m",  # 256-color medium grey
  },
}.freeze

GLYPHS = {
  bullet: '•', # BULLET, Unicode: U+2022, UTF-8: E2 80 A2
  check: '✔', #  HEAVY CHECK MARK, Unicode: U+2714, UTF-8: E2 9C 94
  swirl: '↺', # ANTICLOCKWISE OPEN CIRCLE ARROW, Unicode U+21BA, UTF-8: E2 86 BA
  script_x: '×', # MULTIPLICATION SIGN, Unicode: U+00D7, UTF-8: C3 97
  question: '?', # normal ASCII question mark
  em_dash: '—', # EM DASH Unicode: U+2014, UTF-8: E2 80 94'
  heavy_dash: '≖', # RING IN EQUAL TO, Unicode: U+2256, UTF-8: E2 89 96
  vertical_dash: '|', # VERTICAL LINE, Unicode: U+007C, UTF-8: 7C
  table_corner: '⨀', # N-ARY CIRCLED DOT OPERATOR, Unicode: U+2A00, UTF-8: E2 A8 80
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
      [:red, :green, :cyan, :yellow, :white, :grey].each do |color|
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

    describe 'emphasis' do
      it 'uses ANSI escapes' do
        ui.emphasis('test')
        output.must_equal(ANSI_CODES[:color][:cyan] + 'test' + ANSI_CODES[:reset])
      end
    end

    describe 'headline' do
      it 'formats the headline when short' do
        ui.headline('test')
        output.must_match(/^\n/) # Start with one newlines
        expected = ''
        expected += ' ' + GLYPHS[:em_dash] * 36 + ' '
        expected += ANSI_CODES[:bold] + ANSI_CODES[:color][:white] + 'test' + ANSI_CODES[:reset]
        expected += ' ' + GLYPHS[:em_dash] * 36 + ' '
        output.must_include(expected)
        output.must_match(/\n\n$/) # End with two newline
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

    describe 'emphasis' do
      it 'does not use ANSI escapes' do
        ui.emphasis('test')
        output.wont_include('\e[') # No ANSI escapes
        output.wont_match(/[^[:ascii:]]/) # No non-ASCII chars (such as UTF-8 glyphs)
        output.must_equal('test')
      end
    end

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
describe 'Inspec::UI Tables and Lists' do
  let(:fixture_io) { StringIO.new() }
  let(:output) { fixture_io.string }

  describe 'when color is enabled' do
    let(:ui) { Inspec::UI.new(color: true, io: fixture_io) }

    describe('line') do
      it 'draws a line' do
        ui.line
        expected = ANSI_CODES[:bold] + GLYPHS[:heavy_dash]*80 + ANSI_CODES[:reset] + "\n"
        output.must_equal(expected)
      end
    end

    describe('list_item') do
      it 'makes a bullet point' do
        ui.list_item('test')
        expected = ' '
        expected += ANSI_CODES[:bold] + ANSI_CODES[:color][:white]
        expected += GLYPHS[:bullet]
        expected += ANSI_CODES[:reset]
        expected += ' ' + 'test' + "\n"
        output.must_equal(expected)
      end
    end

    describe('tables') do
      it 'makes a table' do
        ui.table do |t|
          t.head = ['Fruit', 'Tartness', 'Succulence']
          t.rows << ['Dragonfruit', 'Very Low', 'High']
          t.rows << ["The Exquisite Lime, Scurvy's Bane", 'High', 'Medium']
        end
        lines = output.split("\n")

        # First, third, and last lines should be horizontal dividors
        [0, 2, -1].each do |idx|
          lines[idx].must_match(/^#{GLYPHS[:table_corner]}/) # Start with a corner
          lines[idx].must_match(/#{GLYPHS[:table_corner]}$/) # End with a corner
          lines[idx].must_match(/#{GLYPHS[:em_dash]}#{GLYPHS[:table_corner]}#{GLYPHS[:em_dash]}/) # Have internal corners
          lines[idx].wont_include(' ')
        end

        # Second, fourth, and fifth lines should have custom vertical dividors
        [1, 3, 4].each do |idx|
          lines[idx].must_match(/^#{GLYPHS[:vertical_dash]}/) # Start with a vertical line
          lines[idx].must_match(/#{GLYPHS[:vertical_dash]}$/) # End with a vertical line
          lines[idx].must_match(/\s#{GLYPHS[:vertical_dash]}\s/) # Have vertical line
          lines[idx].wont_include(GLYPHS[:table_corner])
        end

        # Second (header) line should have bold and white on each header label
        lines[1].split(GLYPHS[:vertical_dash]).map(&:strip).reject{ |e| e == ""}.each do |header_label|
          header_label.must_include ANSI_CODES[:bold] + ANSI_CODES[:color][:white]
          header_label.must_include ANSI_CODES[:reset]
        end
      end
    end
  end

  describe 'when color is disabled' do
    let(:ui) { Inspec::UI.new(color: false, io: fixture_io) }

    describe('line') do
      it 'draws a line without ANSI codes or special glyphs' do
        ui.line
        output.wont_include('\e[') # No ANSI escapes
        output.wont_match(/[^[:ascii:]]/) # No non-ASCII chars (such as UTF-8 glyphs)
        expected = '-' * 80 + "\n"
        output.must_equal(expected)
      end
    end

    describe('list_item') do
      it 'makes a bullet point without ANSI codes or special glyphs' do
        ui.list_item('test')
        output.wont_include('\e[') # No ANSI escapes
        output.wont_match(/[^[:ascii:]]/) # No non-ASCII chars (such as UTF-8 glyphs)
        expected = ' ' + '*' + ' ' + 'test' + "\n"
        output.must_equal(expected)
      end
    end

    describe('tables') do
      it 'makes a table ANSI codes or special glyphs' do
        ui.table do |t|
          t.head = ['Fruit', 'Tartness', 'Succulence']
          t.rows << ['Dragonfruit', 'Very Low', 'High']
          t.rows << ["The Exquisite Lime, Scurvy's Bane", 'High', 'Medium']
        end

        output.wont_include('\e[') # No ANSI escapes
        output.wont_match(/[^[:ascii:]]/) # No non-ASCII chars (such as UTF-8 glyphs)

        lines = output.split("\n")

        # First, third, and last lines should be horizontal dividors
        [0, 2, -1].each do |idx|
          lines[idx].must_match(/^\+/) # Start with a corner
          lines[idx].must_match(/\+$/) # End with a corner
          lines[idx].must_match(/\-\+\-/) # Have internal corners
          lines[idx].wont_include(' ')
        end

        # Second, fourth, and fifth lines should have stock vertical dividors
        [1, 3, 4].each do |idx|
          lines[idx].must_match(/^\|/) # Start with a vertical line
          lines[idx].must_match(/\|$/) # End with a vertical line
          lines[idx].must_match(/\s\|\s/) # Have vertical line
          lines[idx].wont_include('+')
        end
      end
    end
  end
end

#=============================================================================#
#                       CLI Integration
#=============================================================================#
describe 'Inspec::UI CLI integration' do
  let(:fixture_io) { StringIO.new() }
  let(:output) { fixture_io.string }
  let(:cli) { Inspec::InspecCLI.new }

  describe 'ui method' do
    it 'should respond to ui' do
      cli.must_respond_to(:ui)
      cli.must_respond_to(:'ui=')
    end
  end

  describe 'backwards compatibility' do
    it 'should support plain_text' do
      cli.ui = Inspec::UI.new(io: fixture_io)
      cli.plain_text('test')
      output.must_equal "test\n"
    end
    it 'should support mark_text' do
      cli.ui = Inspec::UI.new(io: fixture_io)
      cli.mark_text('test')
      output.must_equal ANSI_CODES[:color][:cyan] + 'test' + ANSI_CODES[:reset]
    end
    it 'should support headline' do
      cli.ui = Inspec::UI.new(io: fixture_io)
      cli.headline('test')
      output.must_match(/^\n/) # Start with one newlines
      expected = ''
      expected += ' ' + GLYPHS[:em_dash] * 36 + ' '
      expected += ANSI_CODES[:bold] + ANSI_CODES[:color][:white] + 'test' + ANSI_CODES[:reset]
      expected += ' ' + GLYPHS[:em_dash] * 36 + ' '
      output.must_include(expected)
      output.must_match(/\n\n$/) # End with two newline
    end
    it 'should support li' do
      cli.ui = Inspec::UI.new(io: fixture_io)
      cli.li('test')
      expected = ' '
      expected += ANSI_CODES[:bold] + ANSI_CODES[:color][:white]
      expected += GLYPHS[:bullet]
      expected += ANSI_CODES[:reset]
      expected += ' ' + 'test' + "\n"
      output.must_equal(expected)
    end
  end
end

#=============================================================================#
#                           Interactivity
#=============================================================================#
# prompt inline
# prompt menu

#=============================================================================#
#                             Exit Codes
#=============================================================================#
# These are tested in functional tests
# exit(code) => Kernel.exit code