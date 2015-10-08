# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Vulcano::Shell
  def self.start(runner)
    # load and configure pry
    require 'pry'
    configure_pry

    runner.add_content('binding.pry', __FILE__, __LINE__)
    runner.run
  end

  def self.configure_pry
    # Remove all hooks and checks
    Pry.hooks.clear_all

    # Add the help command
    Pry::Commands.block_command 'usage', 'Show examples' do
      Vulcano::Shell.usage
    end

    # Add a help menu as the default intro
    Pry.hooks.add_hook(:before_session, :intro) do
      intro
    end
  end

  def self.mark(x)
    "\033[1m#{x}\033[0m"
  end

  def self.intro
    puts 'Welcome to the interactive Vulcano Shell'
    puts "To find out how to use it, type: #{mark 'usage'}"
    puts
  end

  def self.usage
    puts <<EOF

Welcome to the interactive Vulcano Shell.

You can use resources in this environment to test the target machine.
For example:

    command('uname -a').stdout
    file('/proc/cpuinfo').content

You are currently running on:

    OS family:  #{mark os[:family] || 'unknown'}
    OS release: #{mark os[:release] || 'unknown'}

EOF
  end
end
