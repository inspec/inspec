require_relative "../lib/tty-reader"

reader = TTY::Reader.new

reader.on(:keyctrl_x, :keyescape) { puts "Exiting..."; exit }

loop do
  reader.read_line("one\ntwo\nthree")
end
