# encoding: utf-8

module Vulcano::Backends
  class Mock < Vulcano.backend(1)
    name 'mock'

    def initialize(conf, mapping = {}, cmd_mapping = {})
      @conf = conf
      @files = {}
      @mapping = mapping
      @cmd_mapping = cmd_mapping
    end

    def file(path)
      puts "--> get file #{path}"
      newpath = @mapping[path]
      @files[path] ||= File.new(self, newpath || path, newpath.nil?)
    end

    def run_command(cmd)
      puts "--> run command #{cmd}"
      result = Command.new(self, cmd)

      mapping = @cmd_mapping[cmd]
      # read simulation data
      return result if mapping.nil?
      Command.new(self, cmd, File.new(self, mapping, false).content, '', 0)
    end

    def to_s
      'Mock Backend Runner'
    end
  end

  class Mock
    class File
      def initialize(runtime, path, mock = true)
        @path = path
        # mock dataset
        if mock
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
        # we have a mapping file
        else
          @exists = IO::File.exists?(path)
          @is_file = IO::File.file?(path)
          @size = IO::File.size(path)
          @content = IO::File.read(path)
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

      def file?
        puts "----> is file #{@path} a file? #{@is_file}"
        @is_file
      end

      def exists?
        puts "----> does file #{@path} exist? #{@exists}"
        @exists
      end
    end

    class Command
      attr_accessor :stdout, :stderr, :exit_status
      def initialize(runtime, cmd, stdout = nil, stderr = nil, exit_code = nil)
        @exit_code = exit_code || (rand < 0.7) ? 0 : (100 * rand).to_i
        @stdout =    stdout    || (0...50).map { ('a'..'z').to_a[rand(26)] }.join
        @stderr =    stderr    || (0...50).map { ('a'..'z').to_a[rand(26)] }.join
      end
    end
  end
end
