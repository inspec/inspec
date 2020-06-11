module Regexp::Syntax
  module Token
    module Quantifier
      Greedy    = [
        :zero_or_one,
        :zero_or_more,
        :one_or_more
      ]

      Reluctant = [
        :zero_or_one_reluctant,
        :zero_or_more_reluctant,
        :one_or_more_reluctant
      ]

      Possessive  = [
        :zero_or_one_possessive,
        :zero_or_more_possessive,
        :one_or_more_possessive
      ]

      Interval             = [:interval]
      IntervalReluctant    = [:interval_reluctant]
      IntervalPossessive   = [:interval_possessive]

      IntervalAll = Interval + IntervalReluctant +
                    IntervalPossessive

      All = Greedy + Reluctant + Possessive + IntervalAll
      Type = :quantifier
    end

    Map[Quantifier::Type] = Quantifier::All
  end
end
