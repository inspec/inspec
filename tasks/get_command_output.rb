require 'open3'

commands = {'inspec_exec' => 'inspec exec examples/profile/controls/example.rb', 'inspec_version' => 'inspec version'}

commands.each do |keyname, command|
  stdout, stdeerr, status = Open3.capture3(command)

  # filename should be key.txt...and we should be saving it somewhere in www/
  out_file = File.new("#{keyname}.txt", "w")
  out_file.puts(stdout)
  out_file.close
end

