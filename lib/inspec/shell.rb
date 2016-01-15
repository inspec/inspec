# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rspec/core/formatters/base_text_formatter'

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
      Pry::Commands.block_command 'help', 'Show examples' do |resource|
        that.help(resource)
      end

      # configure pry shell prompt
      Pry.config.prompt_name = 'inspec'
      Pry.prompt = [proc { "\e[0;32m#{Pry.config.prompt_name}>\e[0m " }]

      # Add a help menu as the default intro
      Pry.hooks.add_hook(:before_session, :intro) do
        intro
      end
    end

    def mark(x)
      "\033[1m#{x}\033[0m"
    end

    def print_example(example)
      # determine min whitespace that can be removed
      min = nil
      example.lines.each do |line|
        if line.strip.length > 0 # ignore empty lines
          line_whitespace = line.length - line.lstrip.length
          min = line_whitespace if min.nil? || line_whitespace < min
        end
      end
      # remove whitespace from each line
      example.gsub(/\n\s{#{min}}/, "\n")
    end

    def intro
      puts 'Welcome to the interactive InSpec Shell'
      puts "To find out how to use it, type: #{mark 'help'}"
      puts
    end

    def help(resource = nil)
      if resource.nil?

        ctx = @runner.backend
        puts <<EOF

Available commands:

    `[resource]` - run resource on target machine
    `help resources` - show all available resources that can be used as commands
    `help [resource]` - information about a specific resource
    `exit` - exit the InSpec shell

You can use resources in this environment to test the target machine. For example:

    command('uname -a').stdout
    file('/proc/cpuinfo').content => "value",

You are currently running on:

    OS family:  #{mark ctx.os[:family] || 'unknown'}
    OS release: #{mark ctx.os[:release] || 'unknown'}

EOF
      elsif resource == 'resources'
        resources
      elsif !Inspec::Resource.registry[resource].nil?
        puts <<EOF
#{mark 'Name:'} #{resource}

#{mark 'Description:'}

#{Inspec::Resource.registry[resource].desc}

#{mark 'Example:'}
#{print_example(Inspec::Resource.registry[resource].example)}

#{mark 'Web Reference:'}

https://github.com/chef/inspec/blob/master/docs/resources.rst##{resource}

EOF
      else
        puts 'Only the following resources are available:'
        resources
      end
    end

    def resources
      puts Inspec::Resource.registry.keys.join(' ')
    end
  end

  class NoSummaryFormatter < RSpec::Core::Formatters::BaseTextFormatter
    RSpec::Core::Formatters.register self, :dump_summary

    def dump_summary(*_args)
      # output nothing
    end
  end
end
