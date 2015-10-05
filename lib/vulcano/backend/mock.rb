# encoding: utf-8

module Vulcano::Backends
  Struct.new('MockCommand', :stdout, :stderr, :exit_status)

  class Mock < Vulcano.backend(1)
    name 'mock'

    attr_accessor :files, :commands, :os
    def initialize(conf = nil)
      @conf = conf || {}
      @files = {}
      @os = {}
      @commands = {}
      trace_calls if @conf[:verbose]
    end

    def file(path)
      @files[path] ||= File.new(self, path)
    end

    def run_command(cmd)
      @commands[cmd] || @commands[Digest::SHA256.hexdigest cmd] || Command.new(self, cmd)
    end

    def mock_command(stdout, stderr, exit_status)
      Struct::MockCommand.new(stdout, stderr, exit_status)
    end

    def to_s
      'Mock Backend Runner'
    end

    private

    def trace_calls
      interface_methods = {
        'Vulcano::Backends::Mock' => Vulcano::Backends::Mock.instance_methods(false),
        'Vulcano::Backends::Mock::File' => FileCommon.instance_methods(false),
      }

      # rubocop:disable Metrics/ParameterLists
      # rubocop:disable Lint/Eval
      set_trace_func proc { |event, _file, _line, id, binding, classname|
        unless classname.to_s.start_with?('Vulcano::Backends::Mock') and
               event == 'call' and
               interface_methods[classname.to_s].include?(id)
          next
        end
        # kindly borrowed from the wonderful simple-tracer by matugm
        arg_names = eval(
          'method(__method__).parameters.map { |arg| arg[1].to_s }',
          binding)
        args = eval("#{arg_names}.map { |arg| eval(arg) }", binding).join(', ')
        prefix = '-' * (classname.to_s.count(':') - 2) + '> '
        puts("#{prefix}#{id} #{args}")
      }
      # rubocop:enable all
    end
  end

  class Mock
    class File < FileCommon
      def initialize(_runtime, path)
        @path = path
        # mock dataset
        @exist = (rand < 0.8) ? true : false
        @is_file = (@exist && rand < 0.7) ? true : false
        @size = 0
        @content = ''
        if @exist && @is_file
          @size = (rand**3 * 1000).to_i
          @size = 0 if rand < 0.2
        end
        if @size > 0
          @content = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
        end
        @content
      end

      %w{ size content file? exist? }.each do |m|
        define_method m.to_sym do
          instance_variable_get(m.sub('?', '').to_sym)
        end
      end
    end

    class Command
      attr_accessor :stdout, :stderr, :exit_status
      def initialize(_runtime, _cmd)
        @exit_code = (rand < 0.7) ? 0 : (100 * rand).to_i
        @stdout =    (0...50).map { ('a'..'z').to_a[rand(26)] }.join
        @stderr =    (0...50).map { ('a'..'z').to_a[rand(26)] }.join
      end
    end
  end
end
