# encoding: utf-8

require_relative "unix"

module Train
  class File
    class Remote
      class Linux < Train::File::Remote::Unix
        def content
          return @content if defined?(@content)

          @content = @backend.run_command("cat #{@spath} || echo -n").stdout
          return @content unless @content.empty?

          @content = nil if directory? || size.nil? || (size > 0)
          @content
        end
      end
    end
  end
end
