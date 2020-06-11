# frozen_string_literal: true

require 'strings'
require 'pastel'
require 'tty-cursor'

require_relative 'box/border'
require_relative 'box/version'

module TTY
  module Box
    module_function

    NEWLINE = "\n"

    LINE_BREAK = %r{\r\n|\r|\n}.freeze

    BOX_CHARS = {
      ascii: %w[+ + + + + + + + - | +],
      light: %w[┘ ┐ ┌ └ ┤ ┴ ┬ ├ ─ │ ┼],
      thick: %w[╝ ╗ ╔ ╚ ╣ ╩ ╦ ╠ ═ ║ ╬]
    }.freeze

    def corner_bottom_right_char(border = :light)
      BOX_CHARS[border][0]
    end

    def corner_top_right_char(border = :light)
      BOX_CHARS[border][1]
    end

    def corner_top_left_char(border = :light)
      BOX_CHARS[border][2]
    end

    def corner_bottom_left_char(border = :light)
      BOX_CHARS[border][3]
    end

    def divider_left_char(border = :light)
      BOX_CHARS[border][4]
    end

    def divider_up_char(border = :light)
      BOX_CHARS[border][5]
    end

    def divider_down_char(border = :light)
      BOX_CHARS[border][6]
    end

    def divider_right_char(border = :light)
      BOX_CHARS[border][7]
    end

    def line_char(border = :light)
      BOX_CHARS[border][8]
    end

    def pipe_char(border = :light)
      BOX_CHARS[border][9]
    end

    def cross_char(border = :light)
      BOX_CHARS[border][10]
    end

    def cursor
      TTY::Cursor
    end

    def color
      @color ||= Pastel.new
    end

    # A frame for info type message
    #
    # @param [String] message
    #   the message to display
    #
    # @api public
    def info(message, **opts)
      new_opts = {
        title: { top_left: " ℹ INFO " },
        border: { type: :thick },
        padding: 1,
        style: {
          fg: :black,
          bg: :bright_blue,
          border: {
            fg: :black,
            bg: :bright_blue
          }
        }
      }.merge(opts)
      frame(**new_opts) { message }
    end

    # A frame for warning type message
    #
    # @param [String] message
    #   the message to display
    #
    # @api public
    def warn(message, **opts)
      new_opts = {
        title: { top_left: " ⚠ WARNING " },
        border: { type: :thick },
        padding: 1,
        style: {
          fg: :black,
          bg: :bright_yellow,
          border: {
            fg: :black,
            bg: :bright_yellow
          }
        }
      }.merge(opts)
      frame(**new_opts) { message }
    end

    # A frame for for success type message
    #
    # @param [String] message
    #   the message to display
    #
    # @api public
    def success(message, **opts)
      new_opts = {
        title: { top_left: " ✔ OK " },
        border: { type: :thick },
        padding: 1,
        style: {
          fg: :black,
          bg: :bright_green,
          border: {
            fg: :black,
            bg: :bright_green,
          }
        }
      }.merge(opts)
      frame(**new_opts) { message }
    end

    # A frame for error type message
    #
    # @param [String] message
    #   the message to display
    #
    # @api public
    def error(message, **opts)
      new_opts = {
        title: { top_left: " ⨯ ERROR " },
        border: { type: :thick },
        padding: 1,
        style: {
          fg: :bright_white,
          bg: :red,
          border: {
            fg: :bright_white,
            bg: :red
          }
        }
      }.merge(opts)
      frame(**new_opts) { message }
    end

    # Create a frame
    #
    # @param [Integer] top
    #   the offset from the terminal top
    # @param [Integer] left
    #   the offset from the terminal left
    # @param [Integer] width
    #   the width of the box
    # @param [Integer] height
    #   the height of the box
    # @param [Symbol] align
    #   the content alignment
    # @param [Integer,Array[Integer]] padding
    #   the padding around content
    # @param [Hash] title
    #   the title for top or bottom border
    # @param [Hash, Symbol] border
    #   the border type
    # @param [Hash] style
    #   the styling for the front and background
    #
    # @api public
    def frame(*content, top: nil, left: nil, width: nil, height: nil, align: :left,
              padding: 0, title: {}, border: :light, style: {})
      output = []
      sep = NEWLINE
      position = top && left

      border = Border.parse(border)
      top_size    = border.top? ? 1: 0
      bottom_size = border.bottom? ? 1: 0
      left_size   = border.left? ? 1 : 0
      right_size  = border.right ? 1 : 0

      if block_given?
        str = yield
      else
        str = case content.size
        when 0 then ""
        when 1 then content[0]
        else content.join(NEWLINE)
        end
      end

      sep = str[LINE_BREAK] || NEWLINE # infer line break
      lines = str.split(sep)
      # infer dimensions
      dimensions = infer_dimensions(lines, padding)
      width ||= left_size + dimensions[0] + right_size
      height ||= top_size + dimensions[1] + bottom_size
      content = format(str, width, padding, align) # adjust content
      # infer styling
      fg, bg = *extract_style(style)
      border_fg, border_bg = *extract_style(style[:border] || {})

      if border.top?
        output << cursor.move_to(left, top) if position
        output << top_border(title, width, border, style)
        output << sep unless position
      end

      (height - top_size - bottom_size).times do |i|
        output << cursor.move_to(left, top + i + top_size) if position
        if border.left?
          output << border_bg.(border_fg.(pipe_char(border.type)))
        end

        content_size = width - left_size - right_size
        unless content[i].nil?
          output << bg.(fg.(content[i]))
          size = Strings::ANSI.sanitize(content[i]).scan(/[[:print:]]/).join.size
          content_size -= size
        end
        if style[:fg] || style[:bg] || !position # something to color
          output << bg.(fg.(" " * content_size))
        end

        if border.right?
          if position
            output << cursor.move_to(left + width - right_size, top + i + top_size)
          end
          output << border_bg.(border_fg.(pipe_char(border.type)))
        end
        output << sep unless position
      end

      if border.bottom?
        output << cursor.move_to(left, top + height - bottom_size) if position
        output << bottom_border(title, width, border, style)
        output << sep unless position
      end

      output.join
    end

    # Infer box dimensions based on content lines and padding
    #
    # @param [Array[String]] lines
    # @param [Array[Integer]|Integer] padding
    #
    # @return [Array[Integer]]
    #
    # @api private
    def infer_dimensions(lines, padding)
      pad = Strings::Padder.parse(padding)
      content_height = lines.size
      content_width = lines.empty? ? 1 : lines.max_by(&:length).length
      width = pad.left + content_width + pad.right
      height = pad.top + content_height + pad.bottom
      [width, height]
    end

    # Format content
    #
    # @return [Array[String]]
    #
    # @api private
    def format(content, width, padding, align)
      return "" if content.to_s.empty?

      pad = Strings::Padder.parse(padding)
      total_width = width - 2 - (pad.left + pad.right)
      sep = content[LINE_BREAK] || NEWLINE # infer line break

      wrapped = Strings.wrap(content, total_width)
      aligned = Strings.align(wrapped, total_width, direction: align)
      padded  = Strings.pad(aligned, padding)
      padded.split(sep)
    end

    # Convert style keywords into styling
    #
    # @return [Array[Proc, Proc]]
    #
    # @api private
    def extract_style(style)
      fg = style[:fg] ? color.send(style[:fg]).detach : -> (c) { c }
      bg = style[:bg] ? color.send(:"on_#{style[:bg]}").detach : -> (c) { c }
      [fg, bg]
    end

    # Top border
    #
    # @return [String]
    #
    # @api private
    def top_border(title, width, border, style)
      top_titles_size = title[:top_left].to_s.size +
                        title[:top_center].to_s.size +
                        title[:top_right].to_s.size
      fg, bg = *extract_style(style[:border] || {})

      top_left = border.top_left? && border.left? ? send(:"#{border.top_left}_char", border.type) : ""
      top_right = border.top_right? && border.right? ? send(:"#{border.top_right}_char", border.type) : ""

      top_space_left   = width - top_titles_size - top_left.size - top_right.size
      top_space_before = top_space_left / 2
      top_space_after  = top_space_left / 2 + top_space_left % 2

      [
        bg.(fg.(top_left)),
        bg.(fg.(title[:top_left].to_s)),
        bg.(fg.(line_char(border.type) * top_space_before)),
        bg.(fg.(title[:top_center].to_s)),
        bg.(fg.(line_char(border.type) * top_space_after)),
        bg.(fg.(title[:top_right].to_s)),
        bg.(fg.(top_right))
      ].join('')
    end

    # Bottom border
    #
    # @return [String]
    #
    # @api private
    def bottom_border(title, width, border, style)
      bottom_titles_size = title[:bottom_left].to_s.size +
                           title[:bottom_center].to_s.size +
                           title[:bottom_right].to_s.size
      fg, bg = *extract_style(style[:border] || {})

      bottom_left  = border.bottom_left? && border.left? ? send(:"#{border.bottom_left}_char", border.type) : ""
      bottom_right = border.bottom_right? && border.right? ? send(:"#{border.bottom_right}_char", border.type) : ""

      bottom_space_left = width - bottom_titles_size -
                          bottom_left.size - bottom_right.size
      bottom_space_before = bottom_space_left / 2
      bottom_space_after = bottom_space_left / 2 + bottom_space_left % 2

      [
        bg.(fg.(bottom_left)),
        bg.(fg.(title[:bottom_left].to_s)),
        bg.(fg.(line_char(border.type) * bottom_space_before)),
        bg.(fg.(title[:bottom_center].to_s)),
        bg.(fg.(line_char(border.type) * bottom_space_after)),
        bg.(fg.(title[:bottom_right].to_s)),
        bg.(fg.(bottom_right))
      ].join('')
    end
  end # TTY
end # Box
