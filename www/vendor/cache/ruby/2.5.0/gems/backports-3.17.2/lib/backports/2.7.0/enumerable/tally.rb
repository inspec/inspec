require 'backports/1.9.1/enumerable/each_with_object' unless Enumerable.method_defined? :each_with_object

unless Enumerable.method_defined? :tally
  module Enumerable
    def tally
      # NB: By spec, tally should return default-less hash
      each_with_object(Hash.new(0)) { |item, res| res[item] += 1 }.tap { |h| h.default = nil }
    end
  end
end
