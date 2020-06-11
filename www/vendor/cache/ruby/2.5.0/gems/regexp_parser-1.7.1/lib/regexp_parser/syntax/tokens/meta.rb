module Regexp::Syntax
  module Token
    module Meta
      Basic    = [:dot]
      Extended = Basic + [:alternation]

      All = Extended
      Type = :meta
    end

    Map[Meta::Type] = Meta::All
  end
end
