# encoding: utf-8
require 'train'
require 'yaml'
require 'github/markup'
require 'json'
require 'shellwords'

# global config
input_dir = File.expand_path(File.join(File.dirname(__FILE__), '../content'))
output_dir = File.expand_path(File.join(File.dirname(__FILE__), '../app/responses'))
simulator = 'inspec-simulator'

puts '---> Load Content'

# Load tutorial instructions
demos = YAML.load(File.read(File.join(input_dir, 'tutorial.yml')))['demos']
tutorial_instructions = demos.map { |x| [x['title'], x['desc']] }

# extract commands from instructions
commands = demos.map { |x| x['desc'] }.map { |x| x.scan(/```(.*?)```/m) }.flatten.map(&:strip).map { |x| x.split("\n") }

puts '---> Prepare Simulation Commands'

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
no_shell_tutorial_commands = tutorial_commands.select { |a| a.include?('inspec') && a != 'inspec shell' }
shell_tutorial_commands = tutorial_commands.reject { |a| a.include?('inspec') }

# escape the shell commands for echo
shell_tutorial_commands.map! { |x|
  Shellwords.escape(x)
}
# Add 'echo' and ' | inspec shell' to shell commands to enable inspec shell command functionality
shell_commands = shell_tutorial_commands.map { |x| 'echo ' + x + ' | inspec shell' }

# extract commands
extra_commands = YAML.load(File.read(File.join(input_dir, 'commands.yml')))['commands']

# Merge the output
commands = no_shell_tutorial_commands + extra_commands + shell_commands

# Create key given command
def create_key(command)
  formatted_command = command.gsub(/\W/, '_')
  not_too_long = formatted_command.gsub(/_{2,}/, '_')
  not_too_long + '.txt'
end

puts '---> Create json files for web tutorial'

def indent(text)
  '     ' + text
end

# Create commands.json file
commands_file = File.new(File.join(output_dir, 'commands.json'), 'w')
commands_json = {}
commands.each { |x|
  commands_json[x] = {
    'key' => create_key(x),
    # indicates if the command is part of the tutorial.yml
    'extra' => extra_commands.include?(x),
  }
}
puts JSON.generate(commands_json)
commands_file.write(JSON.generate(commands_json))
puts indent("Wrote #{commands_file.path}")

# Create instructions.json file
instructions_file = File.new(File.join(output_dir, 'instructions.json'), 'w')
tutorial_instructions.map! { |set| [set[0], GitHub::Markup.render('instructions.markdown', set[1])] }
puts JSON.generate(tutorial_instructions)
instructions_file.write(JSON.generate(tutorial_instructions))
puts indent("Wrote #{instructions_file.path}")

# Generate command results files
require 'docker'
fail "#{simulator} docker image is not available" unless Docker::Image.exist?(simulator)

# start container and get id
Docker.options[:read_timeout] = 3 * 60
container = Docker::Container.create('Cmd' => ['/bin/sh'], 'Image' => simulator, 'Tty' => true)
container.start
puts "---> Run simulation on Container #{container.id}"
# Create Train connection
backend = Train.create('docker', { host: container.id })
conn = backend.connection

# Loop over commands
commands.each do |command|
  puts indent("Run `#{command}`")
  cmd = conn.run_command(command)
  cmd.stdout

  # save the result and put it in inspec/www/app/responses with command as filename
  result = cmd.stdout

  key = create_key(command)
  filename = File.join(output_dir, key.to_s)
  out_file = File.new(filename, 'w')
  result.lines.each do |line|
    line_to_write = "#{line.chomp}\r\n"
    out_file.write(line_to_write)
  end
  out_file.close
  puts indent("Wrote #{filename}")
end

# close train connection and stop container
conn.close
container.kill
