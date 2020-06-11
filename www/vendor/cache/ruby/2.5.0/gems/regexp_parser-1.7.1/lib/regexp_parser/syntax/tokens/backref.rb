module Regexp::Syntax
  module Token
    module Backreference
      Name      = [:name_ref]
      Number    = [:number, :number_ref, :number_rel_ref]

      RecursionLevel = [:name_recursion_ref, :number_recursion_ref]

      All = Name + Number + RecursionLevel
      Type = :backref
    end

    # Type is the same as Backreference so keeping it here, for now.
    module SubexpressionCall
      Name      = [:name_call]
      Number    = [:number_call, :number_rel_call]

      All = Name + Number
    end

    Map[Backreference::Type] = Backreference::All +
                               SubexpressionCall::All
  end
end
