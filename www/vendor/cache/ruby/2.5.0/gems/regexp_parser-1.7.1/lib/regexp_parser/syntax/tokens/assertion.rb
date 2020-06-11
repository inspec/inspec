module Regexp::Syntax
  module Token
    module Assertion
      Lookahead = [:lookahead, :nlookahead]
      Lookbehind = [:lookbehind, :nlookbehind]

      All = Lookahead + Lookbehind
      Type = :assertion
    end

    Map[Assertion::Type] = Assertion::All
  end
end
