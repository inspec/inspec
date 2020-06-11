module Regexp::Syntax
  module Token
    module Group
      Basic     = [:capture, :close]
      Extended  = Basic + [:options, :options_switch]

      Named     = [:named]
      Atomic    = [:atomic]
      Passive   = [:passive]
      Comment   = [:comment]

      V1_8_6 = Group::Extended + Group::Named + Group::Atomic +
               Group::Passive + Group::Comment

      V2_4_1 = [:absence]

      All = V1_8_6 + V2_4_1
      Type = :group
    end

    Map[Group::Type] = Group::All
  end
end
