# encoding:utf-8

module Inspec
  class List < Value
    def map
      raise 'Inspec::List.map needs to be called with a block' unless block_given?
      t = List.new
      t.qualifier = [['x']]
      yield(t)
      return if t.qualifier == [['x']]
      @qualifier.push(['map', "{ |x| #{t.to_ruby} }"])
      self
    end
  end
end
