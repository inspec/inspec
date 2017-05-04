# encoding: utf-8
require 'inspec/shell_detector'
require 'erb'
require 'shellwords'

module Inspec
  class EnvPrinter
    attr_reader :shell

    EVAL_COMMANDS = {
      'bash' => 'eval \"$(inspec env bash)\"',
      'fish' => 'inspec env fish > ~/.config/fish/completions/inspec.fish',
      'zsh' => 'eval \"$(inspec env zsh)\"',
    }.freeze

    def initialize(command_class, shell = nil)
      if !shell
        @detected = true
        @shell = Inspec::ShellDetector.new.shell
      else
        @shell = shell
      end
      @command_class = command_class
    end

    def print_and_exit!
      exit_no_shell if !have_shell?
      exit_no_completion if !have_shell_completion?

      print_completion_for_shell
      print_detection_warning($stdout) if @detected
      print_usage_guidance
      exit 0
    end

    private

    def print_completion_for_shell
      erb = ERB.new(File.read(completion_template_path), nil, '-')
      puts erb.result(TemplateContext.new(@command_class).get_bindings)
    end

    def have_shell?
      ! (@shell.nil? || @shell.empty?)
    end

    def have_shell_completion?
      File.exist?(completion_template_path)
    end

    def completion_dir
      File.join(File.dirname(__FILE__), 'completions')
    end

    def completion_template_path
      File.join(completion_dir, "#{@shell}.sh.erb")
    end

    def shells_with_completions
      Dir.glob("#{completion_dir}/*.sh.erb").map { |f| File.basename(f, '.sh.erb') }
    end

    def print_usage_guidance
      puts <<EOF
# To use this, eval it in your shell
#
#    #{EVAL_COMMANDS[shell]}
#
#
EOF
    end

    def print_detection_warning(device)
      device.puts <<EOF
#
# The shell #{@shell} was auto-detected. If this is incorrect, please
# specify a shell explicitly by running:
#
#     inspec env SHELLNAME
#
# Currently supported shells are: #{shells_with_completions.join(', ')}
#
EOF
    end

    def exit_no_completion
      $stderr.puts "# No completion script for #{@shell}!"
      print_detection_warning($stderr) if @detected
      exit 1
    end

    def exit_no_shell
      if @detected
        $stderr.puts '# Unable to automatically detect shell and no shell was provided.'
      end
      $stderr.puts <<EOF
#
# Please provide the name of your shell via the command line:
#
#    inspec env SHELLNAME
#
# Currently supported shells are: #{shells_with_completions.join(', ')}
EOF
      exit 1
    end

    class TemplateContext
      def initialize(command_class)
        @command_class = command_class
      end

      def get_bindings # rubocop:disable Style/AccessorMethodName
        binding
      end

      #
      # The following functions all assume that @command_class
      # is something that provides a Thor-like API
      #
      def top_level_commands
        commands_for_thor_class(@command_class)
      end

      def top_level_commands_with_descriptions
        descript_lines_for_class(@command_class)
      end

      def subcommands_with_commands
        ret = {}
        @command_class.subcommand_classes.each do |k, v|
          ret[k] = commands_for_thor_class(v)
        end
        ret
      end

      def subcommands_with_commands_and_descriptions
        ret = {}
        @command_class.subcommand_classes.each do |k, v|
          ret[k] = descript_lines_for_class(v)
        end
        ret
      end

      def commands_for_thor_class(thor_class)
        thor_class.all_commands.values.map { |c| c.usage.split.first }
      end

      def descript_lines_for_class(thor_class)
        thor_class.all_commands.values.map { |c| descript_line_for_command(c) }
      end

      def descript_line_for_command(c)
        "#{c.usage.split.first}:#{Shellwords.escape(c.description)}"
      end
    end
  end
end
