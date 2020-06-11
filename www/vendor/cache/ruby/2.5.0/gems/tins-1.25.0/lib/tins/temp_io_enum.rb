require 'tins/temp_io'

module Tins
  module TempIO
    class Enum < Enumerator
      include Tins::TempIO

      def initialize(chunk_size: 2 ** 16, filename: nil, &content_proc)
        content_proc or raise ArgumentError, 'need a content proc as block argument'
        super() do |y|
          temp_io(name: 'some-stream', content: content_proc) do |file|
            until file.eof?
              y.yield file.read(chunk_size)
            end
          end
        end.tap do |enum|
          if filename
            enum.define_singleton_method(:filename) do
              filename
            end
          end
        end
      end
    end
  end
end
