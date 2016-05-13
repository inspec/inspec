# encoding: utf-8
# copyright: 2016, Chef Software Inc.
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

class Struct
  unless instance_methods.include? :to_h
    def to_h
      Hash[each_pair.to_a]
    end
  end
end
