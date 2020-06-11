module Regexp::Syntax
  module Token
    module Conditional
      Delimiters = [:open, :close]

      Condition  = [:condition_open, :condition, :condition_close]
      Separator  = [:separator]

      All = Conditional::Delimiters + Conditional::Condition + Conditional::Separator

      Type = :conditional
    end

    Map[Conditional::Type] = Conditional::All
  end
end
