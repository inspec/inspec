# frozen_string_literal: true

require_relative "../lib/tty-table"

table = TTY::Table.new(header: ["Column 1", "Column 2", "Column 3"]) do |t|
  t << [ "r1 c1", "r1 c2", "r1 c3" ]
  t << [ "r2 c1", "r2 c2", "r2 c3" ]
  t << [ "r3 c1", "r3 c2", "r3 c3" ]
end

table.orientation = :vertical

puts table.render(:ascii)
