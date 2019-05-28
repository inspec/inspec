# copyright: 2016, Chef Software Inc.

class Struct
  unless instance_methods.include? :to_h
    def to_h
      Hash[each_pair.to_a]
    end
  end
end
