# encoding: utf-8

module Vulcano::Backends
  Struct.new("MockCommand", :stdout, :stderr, :exit_status)

  class Mock < Vulcano.backend(1)
    name 'mock'

    attr_accessor :files, :commands
    def initialize(conf)
      @conf = conf
      @files = {}
      @commands = {}
      trace_calls unless @conf[:quiet]
    end

    def file(path)
      @files[path] ||= File.new(self, path)
    end

    def run_command(cmd)
      @commands[cmd] || Command.new(self, cmd)
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

      set_trace_func proc{|event, file, line, id, binding, classname|
        next unless
          classname.to_s.start_with?('Vulcano::Backends::Mock') and
          event == 'call' and
          interface_methods[classname.to_s].include?(id)
        # kindly borrowed from the wonderful simple-tracer by matugm
        arg_names = eval("method(__method__).parameters.map { |arg| arg[1].to_s }",binding)
			  args = eval("#{arg_names}.map { |arg| eval(arg) }",binding).join(', ')
        prefix = '-' * (classname.to_s.count(':') - 2) + '> '
        puts  "#{prefix}#{id} #{args}"
      }
    end

  end

  class Mock
    class File < FileCommon
      def initialize(runtime, path)
        @path = path
        # mock dataset
        @exists = (rand < 0.8) ? true : false
        @is_file = (@exists && rand < 0.7) ? true : false
        @size = 0
        @content = ''
        if @exists && @is_file
          @size = (rand**3 * 1000).to_i
          @size = 0 if rand < 0.2
        end
        if @size > 0
          @content = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
        end
      end

      def size
        @size
      end

      def content
        @content
      end

      def file?
        @is_file
      end

      def exists?
        @exists
      end
    end

    class Command
      attr_accessor :stdout, :stderr, :exit_status
      def initialize(runtime, cmd)
        @exit_code = (rand < 0.7) ? 0 : (100 * rand).to_i
        @stdout =    (0...50).map { ('a'..'z').to_a[rand(26)] }.join
        @stderr =    (0...50).map { ('a'..'z').to_a[rand(26)] }.join
      end
    end

  end
end
