class Array
  unless method_defined? :difference
    require 'backports/1.8.7/enumerable/inject'

    def difference(*arrays)
      arrays.inject(Array.new(self), :-)
    end
  end
end
