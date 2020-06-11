# frozen_string_literal: true

require_relative "../lib/tty-box"

box = TTY::Box.frame "Drawing a box in", "terminal emulator",
  padding: 3, align: :center

puts box
