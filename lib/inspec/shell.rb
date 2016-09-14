# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rspec/core/formatters/base_text_formatter'
require 'pry'

module Inspec
  # A pry based shell for inspec. Given a runner (with a configured backend and
  # all that jazz), this shell will produce a pry shell from which you can run
  # inspec/ruby commands that will be run within the context of the runner.
  class Shell
    def initialize(runner)
      @runner = runner
    end

    def start
      # This will hold a single evaluation binding context as opened within
      # the instance_eval context of the anonymous class that the profile
      # context creates to evaluate each individual test file. We want to
      # pretend like we are constantly appending to the same file and want
      # to capture the local variable context from inside said class.
      @ctx_binding = @runner.eval_with_virtual_profile('binding')
      configure_pry
      @ctx_binding.pry
    end

    def configure_pry # rubocop:disable Metrics/AbcSize
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
      Pry.hooks.add_hook(:before_session, 'inspec_intro') do
        intro
      end

      # Track the rules currently registered and what their merge count is.
      Pry.hooks.add_hook(:before_eval, 'inspec_before_eval') do
        @runner.reset
      end

      # After pry has evaluated a commanding within the binding context of a
      # test file, register all the rules it discovered.
      Pry.hooks.add_hook(:after_eval, 'inspec_after_eval') do
        @runner.load
        @runner.run_tests if !@runner.all_rules.empty?
      end

      # Don't print out control class inspection when the user uses DSL methods.
      # Instead produce a result of evaluating their control.
      Pry.config.print = proc do |_output_, value, pry|
        next if !@runner.all_rules.empty?
        pry.pager.open do |pager|
          pager.print pry.config.output_prefix
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
end
