# encoding: utf-8
require 'train'

commands = { 'inspec_exec' => 'inspec exec examples/profile/controls/example.rb', 'inspec_version' => 'inspec version', 'help' => 'inspec help' }

backend = Train.create('local')
conn = backend.connection

commands.each do |keyname, command|
  # loop around commands
  cmd = conn.run_command(command)
  cmd.stdout

  # save the result and put it in inspec/www/app/results with the keyname as filename
  result = cmd.stdout
  dir = 'www/tutorial/app/responses/'
  filename = File.join(dir, "#{keyname}.txt")
  out_file = File.new(filename, 'w')
  result.lines.each do |line|
    line_to_write = "#{line.chomp}\r\n"
    out_file.write(line_to_write)
  end
  out_file.close
  puts "Wrote #{filename}"
end

conn.close
