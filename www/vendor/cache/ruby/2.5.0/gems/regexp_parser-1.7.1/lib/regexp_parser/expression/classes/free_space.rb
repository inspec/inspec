module Regexp::Expression

  class FreeSpace < Regexp::Expression::Base
    def quantify(token, text, min = nil, max = nil, mode = :greedy)
      raise "Can not quantify a free space object"
    end
  end

  class Comment < Regexp::Expression::FreeSpace; end

  class WhiteSpace < Regexp::Expression::FreeSpace
    def merge(exp)
      text << exp.text
    end
  end

end
