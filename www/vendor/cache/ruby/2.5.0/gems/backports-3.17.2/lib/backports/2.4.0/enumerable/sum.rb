module Enumerable
  unless method_defined? :sum
    require 'backports/1.8.7/enumerable/inject'

    def sum(accumulator = 0, &block)
      values = block_given? ? map(&block) : self
      values.inject(accumulator, :+)
    end
  end
end
