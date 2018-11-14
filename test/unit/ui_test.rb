# require 'helper'

require 'minitest'
require 'minitest/spec'
require 'inspec/ui'

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
}.freeze


#=============================================================================#
#                        Low-Level Formatting
#=============================================================================#
describe 'Inspec::UI low-level Formatting' do
  let(:ui) { Inspec::UI.new() }
  describe 'plain' do
    it 'uses no ANSI markers' do
      ->{ ui.plain('test') }.must_output('test')
    end
  end

  describe 'when color is enabled' do
    let(:ui) { Inspec::UI.new(color: true) }
    describe 'bold' do
      it 'uses ANSI bold markers' do
        ->{ ui.bold('test') }.must_output(ANSI_CODES[:bold] + 'test' + ANSI_CODES[:reset])
      end
    end
    describe 'colors' do
      [:red, :green, :yellow, :white, :grey].each do |color|
        it ('uses the color code for ' + color.to_s) do
          ->{ ui.send(color, 'test') }.must_output(ANSI_CODES[:color][color] + 'test' + ANSI_CODES[:reset])
        end
      end
    end
  end

  describe 'when color is disabled' do
    let(:ui) { Inspec::UI.new(color: false) }
    describe 'bold' do
      it 'uses no ANSI codes' do
        ->{ ui.bold('test') }.must_output('test')
      end
    end
    describe 'colors' do
      [:red, :green, :yellow, :white, :grey].each do |color|
        it ('uses no ANSI codes for ' + color.to_s) do
          ->{ ui.send(color, 'test') }.must_output('test')
        end
      end
    end
  end
end

#=============================================================================#
#                        High-Level Formatting
#=============================================================================#
# headline
# format error
# format warning

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
