# frozen_string_literal: true

require_relative "../lib/tty-box"

box = TTY::Box.frame(
  width: 29,
  height: 7,
  align: :center,
  padding: 1
) do
  "Closes #360\r\n\r\nCloses !217"
end

puts box
