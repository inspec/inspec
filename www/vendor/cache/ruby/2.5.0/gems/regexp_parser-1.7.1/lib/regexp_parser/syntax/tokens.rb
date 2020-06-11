# Define the base module and the simplest of tokens.
module Regexp::Syntax
  module Token
    Map = {}

    module Literal
      All = [:literal]
      Type = :literal
    end

    module FreeSpace
      All  = [:comment, :whitespace]
      Type = :free_space
    end

    Map[FreeSpace::Type] = FreeSpace::All
    Map[Literal::Type]   = Literal::All
  end
end


# Load all the token files, they will populate the Map constant.
require 'regexp_parser/syntax/tokens/anchor'
require 'regexp_parser/syntax/tokens/assertion'
require 'regexp_parser/syntax/tokens/backref'
require 'regexp_parser/syntax/tokens/posix_class'
require 'regexp_parser/syntax/tokens/character_set'
require 'regexp_parser/syntax/tokens/character_type'
require 'regexp_parser/syntax/tokens/conditional'
require 'regexp_parser/syntax/tokens/escape'
require 'regexp_parser/syntax/tokens/group'
require 'regexp_parser/syntax/tokens/keep'
require 'regexp_parser/syntax/tokens/meta'
require 'regexp_parser/syntax/tokens/quantifier'
require 'regexp_parser/syntax/tokens/unicode_property'


# After loading all the tokens the map is full. Extract all tokens and types
# into the All and Types constants.
module Regexp::Syntax
  module Token
    All   = Map.values.flatten.uniq.sort.freeze
    Types = Map.keys.freeze
  end
end
