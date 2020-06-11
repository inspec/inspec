require_relative '../lib/tty-reader'

puts "*** TTY::Reader Shell ***"
puts "Press Ctrl-X or ESC to exit"

reader = TTY::Reader.new

reader.on(:keyctrl_x, :keyescape) { puts "Exiting..."; exit }

loop do
  reader.read_line('=> ')
end
