Enumerator = Enumerable::Enumerator unless Object.const_defined? :Enumerator # For 1.8.x

unless Enumerator.respond_to?(:produce)
  require 'backports/tools/arguments'

  class Enumerator
    def self.produce(initial = Backports::Undefined)
      raise ArgumentError, 'no block given' unless block_given?

      Enumerator.new do |y|
        val = initial == Backports::Undefined ? yield() : initial

        loop do
          y << val
          val = yield(val)
        end
      end
    end
  end
end
