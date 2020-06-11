module Regexp::Syntax

  # A syntax that always returns true, passing all tokens as implemented. This
  # is useful during development, testing, and should be useful for some types
  # of transformations as well.
  class Any < Base
    def initialize
      @implements = { :* => [:*] }
    end

    def implements?(type, token) true end
    def implements!(type, token) true end
  end

end
