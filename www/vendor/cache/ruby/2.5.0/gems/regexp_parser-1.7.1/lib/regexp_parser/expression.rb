module Regexp::Expression

  class Base
    attr_accessor :type, :token
    attr_accessor :text, :ts
    attr_accessor :level, :set_level, :conditional_level, :nesting_level

    attr_accessor :quantifier
    attr_accessor :options

    def initialize(token, options = {})
      self.type              = token.type
      self.token             = token.token
      self.text              = token.text
      self.ts                = token.ts
      self.level             = token.level
      self.set_level         = token.set_level
      self.conditional_level = token.conditional_level
      self.nesting_level     = 0
      self.quantifier        = nil
      self.options           = options
    end

    def initialize_clone(orig)
      self.text       = (orig.text       ? orig.text.dup         : nil)
      self.options    = (orig.options    ? orig.options.dup      : nil)
      self.quantifier = (orig.quantifier ? orig.quantifier.clone : nil)
      super
    end

    def to_re(format = :full)
      ::Regexp.new(to_s(format))
    end

    alias :starts_at :ts

    def full_length
      to_s.length
    end

    def offset
      [starts_at, full_length]
    end

    def coded_offset
      '@%d+%d' % offset
    end

    def to_s(format = :full)
      "#{text}#{quantifier_affix(format)}"
    end

    def quantifier_affix(expression_format)
      quantifier.to_s if quantified? && expression_format != :base
    end

    def terminal?
      !respond_to?(:expressions)
    end

    def quantify(token, text, min = nil, max = nil, mode = :greedy)
      self.quantifier = Quantifier.new(token, text, min, max, mode)
    end

    def unquantified_clone
      clone.tap { |exp| exp.quantifier = nil }
    end

    def quantified?
      !quantifier.nil?
    end

    # Deprecated. Prefer `#repetitions` which has a more uniform interface.
    def quantity
      return [nil,nil] unless quantified?
      [quantifier.min, quantifier.max]
    end

    def repetitions
      return 1..1 unless quantified?
      min = quantifier.min
      max = quantifier.max < 0 ? Float::INFINITY : quantifier.max
      # fix Range#minmax - https://bugs.ruby-lang.org/issues/15807
      (min..max).tap { |r| r.define_singleton_method(:minmax) { [min, max] } }
    end

    def greedy?
      quantified? and quantifier.greedy?
    end

    def reluctant?
      quantified? and quantifier.reluctant?
    end
    alias :lazy? :reluctant?

    def possessive?
      quantified? and quantifier.possessive?
    end

    def attributes
      {
        type:              type,
        token:             token,
        text:              to_s(:base),
        starts_at:         ts,
        length:            full_length,
        level:             level,
        set_level:         set_level,
        conditional_level: conditional_level,
        options:           options,
        quantifier:        quantified? ? quantifier.to_h : nil,
      }
    end
    alias :to_h :attributes
  end

  def self.parsed(exp)
    warn('WARNING: Regexp::Expression::Base.parsed is buggy and '\
         'will be removed in 2.0.0. Use Regexp::Parser.parse instead.')
    case exp
    when String
      Regexp::Parser.parse(exp)
    when Regexp
      Regexp::Parser.parse(exp.source) # <- causes loss of root options
    when Regexp::Expression            # <- never triggers
      exp
    else
      raise ArgumentError, 'Expression.parsed accepts a String, Regexp, or '\
                           'a Regexp::Expression as a value for exp, but it '\
                           "was given #{exp.class.name}."
    end
  end

end # module Regexp::Expression

require 'regexp_parser/expression/quantifier'
require 'regexp_parser/expression/subexpression'
require 'regexp_parser/expression/sequence'
require 'regexp_parser/expression/sequence_operation'

require 'regexp_parser/expression/classes/alternation'
require 'regexp_parser/expression/classes/anchor'
require 'regexp_parser/expression/classes/backref'
require 'regexp_parser/expression/classes/conditional'
require 'regexp_parser/expression/classes/escape'
require 'regexp_parser/expression/classes/free_space'
require 'regexp_parser/expression/classes/group'
require 'regexp_parser/expression/classes/keep'
require 'regexp_parser/expression/classes/literal'
require 'regexp_parser/expression/classes/posix_class'
require 'regexp_parser/expression/classes/property'
require 'regexp_parser/expression/classes/root'
require 'regexp_parser/expression/classes/set'
require 'regexp_parser/expression/classes/set/intersection'
require 'regexp_parser/expression/classes/set/range'
require 'regexp_parser/expression/classes/type'

require 'regexp_parser/expression/methods/match'
require 'regexp_parser/expression/methods/match_length'
require 'regexp_parser/expression/methods/options'
require 'regexp_parser/expression/methods/strfregexp'
require 'regexp_parser/expression/methods/tests'
require 'regexp_parser/expression/methods/traverse'
