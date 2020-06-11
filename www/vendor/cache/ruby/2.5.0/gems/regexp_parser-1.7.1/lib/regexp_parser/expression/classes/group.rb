module Regexp::Expression
  module Group
    class Base < Regexp::Expression::Subexpression
      def to_s(format = :full)
        "#{text}#{expressions.join})#{quantifier_affix(format)}"
      end

      def capturing?; false end

      def comment?; false end
    end

    class Atomic  < Group::Base; end
    class Passive < Group::Base; end
    class Absence < Group::Base; end
    class Options < Group::Base
      attr_accessor :option_changes
    end

    class Capture < Group::Base
      attr_accessor :number, :number_at_level
      alias identifier number

      def capturing?; true end
    end

    class Named < Group::Capture
      attr_reader :name
      alias identifier name

      def initialize(token, options = {})
        @name = token.text[3..-2]
        super
      end

      def initialize_clone(orig)
        @name = orig.name.dup
        super
      end
    end

    class Comment < Group::Base
      def to_s(_format = :full)
        text.dup
      end

      def comment?; true end
    end
  end

  module Assertion
    class Base < Regexp::Expression::Group::Base; end

    class Lookahead           < Assertion::Base; end
    class NegativeLookahead   < Assertion::Base; end

    class Lookbehind          < Assertion::Base; end
    class NegativeLookbehind  < Assertion::Base; end
  end
end
