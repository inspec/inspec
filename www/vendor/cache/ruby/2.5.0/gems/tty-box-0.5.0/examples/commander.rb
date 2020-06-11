# frozen_string_literal: true

require_relative '../lib/tty-box'

print TTY::Cursor.clear_screen

box_1 = TTY::Box.frame(
  top: 2,
  left: 10,
  width: 30,
  height: 10,
  border: :thick,
  align: :center,
  padding: 3,
  title: {
    top_left: ' file1 '
  },
  style: {
    fg: :bright_yellow,
    bg: :blue,
    border: {
      fg: :bright_yellow,
      bg: :blue
    }
  }
) do
  "Drawing a box in terminal emulator"
end

box_2 = TTY::Box.frame(
  top: 8,
  left: 34,
  width: 30,
  height: 10,
  border: :thick,
  align: :center,
  padding: 3,
  title: {
    top_left: ' file2 '
  },
  style: {
    fg: :bright_yellow,
    bg: :blue,
    border: {
      fg: :bright_yellow,
      bg: :blue
    }
  }
) do
  "Drawing a box in terminal emulator"
end

puts box_1 + box_2
print "\n" * 5
