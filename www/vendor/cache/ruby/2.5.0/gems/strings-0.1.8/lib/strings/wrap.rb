# frozen_string_literal: true

require 'strings-ansi'
require 'unicode/display_width'
require 'unicode_utils/each_grapheme'

require_relative 'fold'

module Strings
  module Wrap
    DEFAULT_WIDTH = 80
    NEWLINE = "\n".freeze
    SPACE = " ".freeze
    LINE_BREAK = %r{\r\n|\r|\n}.freeze
    LINE_BREAKS = "\r\n+|\r+|\n+".freeze

    # Wrap a text into lines no longer than wrap_at length.
    # Preserves existing lines and existing word boundaries.
    #
    # @example
    #   Strings::Wrap.wrap("Some longish text", 8)
    #   # => "Some \nlongish \ntext"
    #
    # @api public
    def wrap(text, wrap_at = DEFAULT_WIDTH, separator: nil)
      if text.scan(/[[:print:]]/).length < wrap_at.to_i || wrap_at.to_i.zero?
        return text
      end
      ansi_stack = []
      sep = separator || text[LINE_BREAK] || NEWLINE
      text.split(%r{#{LINE_BREAKS}}, -1).map do |paragraph|
        format_paragraph(paragraph, wrap_at, ansi_stack)
      end * sep
    end
    module_function :wrap

    # Format paragraph to be maximum of wrap_at length
    #
    # @param [String] paragraph
    #   the paragraph to format
    # @param [Integer] wrap_at
    #   the maximum length to wrap the paragraph
    #
    # @return [Array[String]]
    #   the wrapped lines
    #
    # @api private
    def format_paragraph(paragraph, wrap_at, ansi_stack)
      cleared_para = Fold.fold(paragraph)
      lines = []
      line  = []
      word  = []
      ansi  = []
      ansi_matched = false
      word_length = 0
      line_length = 0
      char_length = 0 # visible char length
      text_length = display_width(cleared_para)
      total_length = 0

      UnicodeUtils.each_grapheme(cleared_para) do |char|
        # we found ansi let's consume
        if char == Strings::ANSI::CSI || ansi.length > 0
          ansi << char
          if Strings::ANSI.only_ansi?(ansi.join)
            ansi_matched = true
          elsif ansi_matched
            ansi_stack << [ansi[0...-1].join, line_length + word_length]
            ansi_matched = false

            if ansi.last == Strings::ANSI::CSI
              ansi = [ansi.last]
            else
              ansi = []
            end
          end
          next if ansi.length > 0
        end

        char_length = display_width(char)
        total_length += char_length
        if line_length + word_length + char_length <= wrap_at
          if char == SPACE || total_length == text_length
            line << word.join + char
            line_length += word_length + char_length
            word = []
            word_length = 0
          else
            word << char
            word_length += char_length
          end
          next
        end

        if char == SPACE # ends with space
          lines << insert_ansi(line.join, ansi_stack)
          line = []
          line_length = 0
          word << char
          word_length += char_length
        elsif word_length + char_length <= wrap_at
          lines << insert_ansi(line.join, ansi_stack)
          line = [word.join + char]
          line_length = word_length + char_length
          word = []
          word_length = 0
        else # hyphenate word - too long to fit a line
          lines << insert_ansi(word.join, ansi_stack)
          line_length = 0
          word = [char]
          word_length = char_length
        end
      end
      lines << insert_ansi(line.join, ansi_stack) unless line.empty?
      lines << insert_ansi(word.join, ansi_stack) unless word.empty?
      lines
    end
    module_function :format_paragraph

    # Insert ANSI code into string
    #
    # Check if there are any ANSI states, if present
    # insert ANSI codes at given positions unwinding the stack.
    #
    # @param [String] string
    #   the string to insert ANSI codes into
    #
    # @param [Array[Array[String, Integer]]] ansi_stack
    #   the ANSI codes to apply
    #
    # @return [String]
    #
    # @api private
    def insert_ansi(string, ansi_stack = [])
      return string if ansi_stack.empty?
      return string if string.empty?

      new_stack = []
      output          = string.dup
      length          = string.size
      matched_reset   = false
      ansi_reset      = Strings::ANSI::RESET

      # Reversed so that string index don't count ansi
      ansi_stack.reverse_each do |ansi|
        if ansi[0] =~ /#{Regexp.quote(ansi_reset)}/
          matched_reset = true
          output.insert(ansi[1], ansi_reset)
          next
        elsif !matched_reset # ansi without reset
          matched_reset = false
          new_stack << ansi # keep the ansi
          next if ansi[1] == length
          output.insert(-1, ansi_reset) # add reset at the end
        end

        output.insert(ansi[1], ansi[0])
      end

      ansi_stack.replace(new_stack)

      output
    end
    module_function :insert_ansi

    # Visible width of a string
    #
    # @api private
    def display_width(string)
      Unicode::DisplayWidth.of(Strings::ANSI.sanitize(string))
    end
    module_function :display_width
  end # Wrap
end # Strings
