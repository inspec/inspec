# frozen_string_literal: true

require_relative '../lib/tty-table'

table = TTY::Table.new header: ['right align', 'center align', 'left align']
table << ['a1', 'a2', 'a3']
table << ['b1','b2', 'b3']
table << ['c1', 'c2', 'c3']

puts table.render(:ascii, alignments: [:right, :center, :left])
