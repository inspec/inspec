# encoding: utf-8
require 'train'
require 'yaml'
require 'github/markup'
require 'json'
require 'shellwords'
require 'digest'

# global config
input_dir = File.expand_path(File.join(File.dirname(__FILE__), '../content'))
output_dir = File.expand_path(File.join(File.dirname(__FILE__), '../app/responses'))
simulator = 'inspec-simulator'

# Create key given command
def create_key(command)
  formatted_command = command.gsub(/\W/, '_')
  not_too_long = formatted_command.gsub(/_{2,}/, '_')
  # ensure file names do not get to long (for Windows)
  if not_too_long.length > 40
    hash = Digest::MD5.hexdigest not_too_long
    # hard_cut at 40 chars
    not_too_long = not_too_long.slice(0..40)
    # find last underscore and change end with hash
    not_too_long.gsub!(/_[^_]*$/, '_' + hash)
  end
  not_too_long + '.txt'
end

def indent(text)
  '     ' + text
end

# loads all commands from tutorial.yml
def load_tutorial_commands(demos)
  # extract commands from instructions
  raw_commands = demos.map { |x| x['desc'] }.map { |x| x.scan(/```(.*?)```/m) }.flatten.map(&:strip).map { |x| x.split("\n") }

  # find out if we have a single command or a multiline shell command
  tutorial_commands = raw_commands.map { |x|
    cmd = x.join("\n")
    if cmd.include?('describe')
      cmd
    else
      x
    end
  }.flatten

  # Pull shell commands out so they can be handled
  # This is currently done by checking if the command includes the word inspec :/
  no_shell_tutorial_commands = tutorial_commands.select { |a| a.include?('inspec') && a != 'inspec shell' }
  commands = no_shell_tutorial_commands.map {|cmd|
    {
      'key' => create_key(cmd),
      'command' => cmd,
      'simulator_cmd' => cmd,
      'extra' => false,
      'shell' => 'sh',
    }
  }

  # special handling for InSpec shell commands
  shell_tutorial_commands = tutorial_commands.reject { |a| a.include?('inspec') }
  commands += shell_tutorial_commands.map {|cmd|
    # Add 'echo' and ' | inspec shell' to shell commands to enable inspec shell command functionality
    simulator_cmd = 'echo ' + Shellwords.escape(cmd) + ' | inspec shell'
    {
      'key' => create_key(simulator_cmd),
      'command' => cmd,
      'simulator_cmd' => simulator_cmd,
      'extra' => false,
      'shell' => 'inspec',
    }
  }
  commands
end

# load all commands from commands.yml
def load_extra_commands(extra_commands)
  extra_commands.map {|cmd|
    {
      'key' => create_key(cmd),
      'command' => cmd,
      'simulator_cmd' => cmd,
      'extra' => true,
      'shell' => 'sh',
    }
  }
end

def generate_webapp_instructions(demos, output_dir)
  # Create instructions.json file
  instructions_file = File.new(File.join(output_dir, 'instructions.json'), 'w')
  tutorial_instructions = demos.map { |x| [x['title'], x['desc']] }
  tutorial_instructions.map! { |set| [set[0], GitHub::Markup.render('instructions.markdown', set[1])] }
  instructions_file.write(JSON.generate(tutorial_instructions))
  puts indent("Wrote #{instructions_file.path}")
end

def generate_webapp_commands(commands, output_dir)
  # Create commands.json file
  commands_file = File.new(File.join(output_dir, 'commands.json'), 'w')
  commands_file.write(JSON.generate(commands))
  puts indent("Wrote #{commands_file.path}")
end

def run_command(command, conn, output_dir)
  puts indent("Run `#{command['command']}` on `#{command['shell']}`")
  cmd = conn.run_command(command['simulator_cmd'])
  cmd.stdout

  # save the result and put it in inspec/www/app/responses with command as filename
  result = cmd.stdout

  # filter inspec shell welcome message
  welcome = "To find out how to use it, type: [1mhelp[0m\n\n"
  # To find out how to use it, type: [1mhelp[0m
  idx = result.index(welcome)
  if command['shell'] == 'inspec' && !idx.nil?
    # find welcome message
    index = idx + welcome.length
    # also remove the command before the welcome message
    result = result.slice(index, result.length - index)
  end

  key = command['key']
  filename = File.join(output_dir, key.to_s)
  out_file = File.new(filename, 'w')
  result.lines.each do |line|
    line_to_write = "#{line.chomp}\r\n"
    out_file.write(line_to_write)
  end
  out_file.close
  puts indent("Wrote #{filename}")
end

def generate_simulation_files(simulator, commands, output_dir)
  require 'docker'
  fail "#{simulator} docker image is not available" unless Docker::Image.exist?(simulator)

  # start container and get id
  Docker.options[:read_timeout] = 3 * 60
  container = Docker::Container.create('Cmd' => ['/bin/sh'], 'Image' => simulator, 'Tty' => true)
  container.start
  puts indent("Run simulation on Container #{container.id}")
  # Create Train connection
  backend = Train.create('docker', { host: container.id })
  conn = backend.connection

  # Loop over sh commands
  commands.each do |command|
    run_command(command, conn, output_dir)
  end

  # close train connection and stop container
  conn.close
  container.kill
end

# start workflow
puts '---> Load Content'
# Load tutorial instructions
demos = YAML.load(File.read(File.join(input_dir, 'tutorial.yml')))['demos']
commands = load_tutorial_commands(demos)

extra_commands = YAML.load(File.read(File.join(input_dir, 'commands.yml')))['commands']
commands += load_extra_commands(extra_commands)

puts '---> Create files for web app'
generate_webapp_instructions(demos, output_dir)
generate_webapp_commands(commands, output_dir)
generate_simulation_files(simulator, commands, output_dir)
