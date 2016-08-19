# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rspec/core/formatters/base_text_formatter'

module Inspec
  # A pry based shell for inspec. Given a runner (with a configured backend and
  # all that jazz), this shell will produce a pry shell from which you can run
  # inspec/ruby commands that will be run within the context of the runner.
  class Shell
    def initialize(runner)
      @runner = runner
      # load and configure pry
      require 'pry'
      configure_pry
    end

    def start
      # store context to run commands in this context
      c = { content: 'binding.pry', ref: nil, line: nil }
      @runner.add_content(c, [])
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
      Pry.prompt = [proc { "#{readline_ignore("\e[0;32m")}#{Pry.config.prompt_name}> #{readline_ignore("\e[0m")}" }]

      # Add a help menu as the default intro
      Pry.hooks.add_hook(:before_session, :intro) do
        intro
      end

      # execute describe blocks
      Pry.hooks.add_hook(:after_eval, 'run_controls') do |output, _binding, _pry_|
        next unless output.is_a?(Inspec::Rule)
        # reset tests, register the control and execute the runner
        @runner.reset
        @runner.method(:register_rule).call(output.id, output)
        @runner.run
      end

      # Don't print out control class inspection when the user uses DSL methods.
      # Instead produce a result of evaluating their control.
      Pry.config.print = proc do |_output, value, pry_|
        next if value.is_a?(Inspec::Rule)
        pry_.pager.open do |pager|
          pager.print pry_.config.output_prefix
          Pry::ColorPrinter.pp(value, pager, Pry::Terminal.width! - 1)
        end
      end
    end

    def readline_ignore(code)
      "\001#{code}\002"
    end

    def mark(x)
      "#{readline_ignore("\033[1m")}#{x}#{readline_ignore("\033[0m")}"
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

    OS platform:  #{mark ctx.os[:name] || 'unknown'}
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
