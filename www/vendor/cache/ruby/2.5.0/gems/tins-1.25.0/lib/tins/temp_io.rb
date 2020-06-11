require 'tmpdir'

module Tins
  module TempIO
    def temp_io(content: nil, name: __method__)
      content.nil? and raise ArgumentError, "missing keyword: content"
      name = File.basename(name.to_s)
      Dir.mktmpdir do |dir|
        name = File.join(dir, name)
        File.open(name, 'w+b') do |io|
          if content.respond_to?(:call)
            if content.respond_to?(:arity) && content.arity == 1
              content.call(io)
            else
              io.write content.call
            end
          else
            io.write content
          end
          io.rewind
          yield io
        end
      end
    end
  end
end
