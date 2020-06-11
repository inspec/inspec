require 'backports/1.8.7/enumerable/inject' unless Enumerable.method_defined? :inject

class Array
  def intersection(*arrays)
    arrays.inject(Array.new(self), :&)
  end unless method_defined? :intersection
end
