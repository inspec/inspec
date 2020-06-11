module Regexp::Syntax
  module Token
    module CharacterType
      Basic     = []
      Extended  = [:digit, :nondigit, :space, :nonspace, :word, :nonword]
      Hex       = [:hex, :nonhex]

      Clustered = [:linebreak, :xgrapheme]

      All = Basic + Extended + Hex + Clustered
      Type = :type
    end

    Map[CharacterType::Type] = CharacterType::All
  end
end
