# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec
  class Shell
    def initialize(runner)
      @runner = runner
      # load and configure pry
      require 'pry'
      configure_pry
    end

    def start
      # store context to run commands in this context
      c = { content: 'binding.pry', ref: __FILE__, line: __LINE__ }
      @runner.add_content(c, [])
      @runner.run
    end

    def configure_pry
      # Remove all hooks and checks
      Pry.hooks.clear_all
      that = self

      # Add the help command
      Pry::Commands.block_command 'usage', 'Show examples' do
        that.usage
      end

      # Add a help menu as the default intro
      Pry.hooks.add_hook(:before_session, :intro) do
        intro
      end
    end

    def mark(x)
      "\033[1m#{x}\033[0m"
    end

    def intro
      puts 'Welcome to the interactive Inspec Shell'
      puts "To find out how to use it, type: #{mark 'usage'}"
      puts
    end

    def usage
      ctx = @runner.backend
      puts <<EOF

Welcome to the interactive Inspec Shell.

You can use resources in this environment to test the target machine.
For example:

    command('uname -a').stdout
    file('/proc/cpuinfo').content

You are currently running on:

    OS family:  #{mark ctx.os[:family] || 'unknown'}
    OS release: #{mark ctx.os[:release] || 'unknown'}

EOF
    end
  end
end
