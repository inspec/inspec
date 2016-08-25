# encoding: utf-8
require 'train'

commands = { 'inspec_exec' => 'inspec exec examples/profile/controls/example.rb', 'inspec_version' => 'inspec version' }

commands.each do |keyname, command|
  backend = Train.create('local')
  conn = backend.connection
  # loop around commands
  cmd = conn.run_command(command)
  cmd.stdout
  conn.close

  # save the result and put it in inspec/www/app/results with the keyname as filename
  result = cmd.stdout
  dir = 'www/app/results/'
  out_file = File.new(File.join(dir, "#{keyname}.txt"), 'w')
  out_file.puts(result)
  out_file.close
end
