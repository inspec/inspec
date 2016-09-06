# encoding: utf-8
require 'train'
require 'yaml'
require 'json'
require 'shellwords'

# Load all commands and instructions
demos = YAML.load(File.read('www/tutorial/tutorial.yml'))['demos']
commands = demos.map { |x| x['desc'] }.map { |x| x.scan(/```(.*?)```/m) }.flatten.map(&:strip).map { |x| x.split("\n") }
tutorial_instructions = demos.map { |x| [x['demo'], x['desc']] }
extra_commands = YAML.load(File.read('www/tutorial/commands.yml'))['commands']

# find out if we have a single command or a multiline shell command
cmds = commands.map { |x|
  cmd = x.join("\n")
  if cmd.include?('describe')
    cmd
  else
    x
  end
}
tutorial_commands = cmds.flatten

# Pull shell commands out so they can be handled
# This is currently done by checking if the command includes the word inspec :/
no_shell_tutorial_commands = tutorial_commands.select { |a| a.include?('inspec') }
shell_tutorial_commands = tutorial_commands.reject { |a| a.include?('inspec') }

# escape the shell commands for echo
shell_tutorial_commands.map! { |x|
  Shellwords.escape(x)
}
# Add 'echo' and ' | inspec shell' to shell commands to enable inspec shell command functionality
shell_commands = shell_tutorial_commands.map { |x| 'echo ' + x + ' | inspec shell' }

# Merge the output
commands = no_shell_tutorial_commands + extra_commands + shell_commands

# TEMPORARY: REMOVE SSH COMMANDS (-t & -b)
commands.delete_if { |x| x.include? '-t' }
commands.delete_if { |x| x.include? '-b' }

# Create key given command
def create_key(command)
  formatted_command = command.gsub(/\W/, '_')
  not_too_long = formatted_command.gsub(/_{2,}/, '_')
  not_too_long + '.txt'
end

# Create commands.json file
commands_file = File.new('www/tutorial/commands.json', 'w')
json = commands.map { |x| [x => create_key(x)] }.to_json
commands_file.write(json)
puts 'Wrote www/tutorial/commands.json'

# Create instructions.json file
instructions_file = File.new('www/tutorial/instructions.json', 'w')
instructions_file.write(tutorial_instructions.to_json)
puts 'Wrote www/tutorial/instructions.json'

# Create extra_commands.json file used to expose the extra commands
# that have been enabled but not noted in the tutorial instructions
extra_commands_file = File.new('www/tutorial/extra_commands.json', 'w')
extra_commands_file.write(extra_commands.to_json)
puts 'Wrote www/tutorial/extra_commands.json'

# Generate command results files
# Create Train connection
backend = Train.create('local')
conn = backend.connection

# Loop over commands
commands.each do |command|
  cmd = conn.run_command(command)
  cmd.stdout

  # save the result and put it in inspec/www/app/results with command as filename
  result = cmd.stdout
  dir = 'www/tutorial/app/responses/'

  key = create_key(command)
  filename = File.join(dir, key.to_s)
  out_file = File.new(filename, 'w')
  result.lines.each do |line|
    line_to_write = "#{line.chomp}\r\n"
    out_file.write(line_to_write)
  end
  out_file.close
  puts "Wrote #{filename}"
end

conn.close
