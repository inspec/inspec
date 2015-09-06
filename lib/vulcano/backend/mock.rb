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
  end

  class Mock
    class File
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
