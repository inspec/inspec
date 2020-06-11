module Regexp::Syntax
  module Token
    module CharacterSet
      Basic     = [:open, :close, :negate, :range]
      Extended  = Basic + [:intersection]

      All = Extended
      Type = :set
    end

    Map[CharacterSet::Type] = CharacterSet::All
  end
end
