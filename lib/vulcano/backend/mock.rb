# encoding: utf-8

module Vulcano::Backends
  class Mock < Vulcano.backend(1)
    name 'mock'

    def initialize( conf )
      @conf = conf
      @files = {}
    end

    def file(path)
      puts "--> get file #{path}"
      @files[path] ||= File.new(self, path)
    end

    def run_command(cmd)
      Command.new(self, cmd)
    end

    def to_s
      'Mock Backend Runner'
    end
  end

  class Mock
    class File

      def initialize(runtime, path)
        @path = path
        @exists = (rand < 0.8) ? true : false
        @is_file = (@exists && rand < 0.7) ? true : false
        @size = 0
        @content = ''
        if @exists && @is_file
          @size = ( rand ** 3 * 1000 ).to_i
          @size = 0 if rand < 0.2
        end
        if @size > 0
          @content = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
        end
      end

      def size
        puts "----> get file #{@path} size: #{@size}"
        @size
      end

      def content
        puts "----> get file #{@path} content: #{@content}"
        @content
      end

      def is_file?
        puts "----> is file #{@path} a file? #{@is_file}"
        @is_file
      end

      def exists?
        puts "----> does file #{@path} exist? #{@exists}"
        @exists
      end
    end

    class Command
      attr_reader :stdout, :stderr, :exit_status
      def initialize(runtime, cmd)
        @exit_code = (rand < 0.7) ? 0 : (100 * rand).to_i
        @stdout = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
        @stderr = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
      end
    end

  end
end
