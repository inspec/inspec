require 'backports/1.9.1/enumerable/each_with_object' unless Enumerable.method_defined? :each_with_object

unless Enumerable.method_defined? :filter_map
  module Enumerable
    def filter_map
      return to_enum(:filter_map) unless block_given?

      each_with_object([]) do |item, res|
        processed = yield(item)
        res << processed if processed
      end
    end
  end
end
