module Regexp::Expression

  # A sequence of expressions. Differs from a Subexpressions by how it handles
  # quantifiers, as it applies them to its last element instead of itself as
  # a whole subexpression.
  #
  # Used as the base class for the Alternation alternatives, Conditional
  # branches, and CharacterSet::Intersection intersected sequences.
  class Sequence < Regexp::Expression::Subexpression
    # TODO: this override is here for backwards compatibility, remove in 2.0.0
    def initialize(*args)
      if args.count == 3
        warn('WARNING: Sequence.new without a Regexp::Token argument is '\
             'deprecated and will be removed in 2.0.0.')
        return self.class.at_levels(*args)
      end
      super
    end

    class << self
      def add_to(subexpression, params = {}, active_opts = {})
        sequence = at_levels(
          subexpression.level,
          subexpression.set_level,
          params[:conditional_level] || subexpression.conditional_level
        )
        sequence.nesting_level = subexpression.nesting_level + 1
        sequence.options = active_opts
        subexpression.expressions << sequence
        sequence
      end

      def at_levels(level, set_level, conditional_level)
        token = Regexp::Token.new(
          :expression,
          :sequence,
          '',
          nil, # ts
          nil, # te
          level,
          set_level,
          conditional_level
        )
        new(token)
      end
    end

    def starts_at
      expressions.first.starts_at
    end
    alias :ts :starts_at

    def quantify(token, text, min = nil, max = nil, mode = :greedy)
      offset = -1
      target = expressions[offset]
      while target.is_a?(FreeSpace)
        target = expressions[offset -= 1]
      end

      target || raise(ArgumentError, "No valid target found for '#{text}' "\
                                     'quantifier')

      target.quantify(token, text, min, max, mode)
    end
  end

end
