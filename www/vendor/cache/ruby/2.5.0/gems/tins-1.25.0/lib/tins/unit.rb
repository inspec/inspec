require 'strscan'
require 'bigdecimal'

module Tins::Unit
  Prefix = Struct.new(:name, :step, :multiplier, :fraction)

  PREFIX_LC = [
    '', 'k', 'm', 'g', 't', 'p', 'e', 'z', 'y',
  ].each_with_index.map { |n, i| Prefix.new(n.freeze, 1000, 1000 ** i, false) }.freeze

  PREFIX_UC = [
    '', 'K', 'M', 'G', 'T', 'P', 'E', 'Z', 'Y',
  ].each_with_index.map { |n, i| Prefix.new(n.freeze, 1024, 1024 ** i, false) }.freeze

  PREFIX_F = [
    '', 'm', 'µ', 'n', 'p', 'f', 'a', 'z', 'y',
  ].each_with_index.map { |n, i| Prefix.new(n.freeze, 1000, 1000 ** -i, true) }.freeze

  class ParserError < ArgumentError; end

  module_function

  def prefixes(identifier)
    case identifier
    when :uppercase, :uc, 1024
      PREFIX_UC
    when :lowercase, :lc, 1000
      PREFIX_LC
    when :fraction, :f, 0.001
      PREFIX_F
    when Array
      identifier
    end
  end

  def format(value, format: '%f %U', prefix: 1024, unit: ?b)
    prefixes = prefixes(prefix)
    first_prefix = prefixes.first or
      raise ArgumentError, 'a non-empty array of prefixes is required'
    if value.zero?
      result = format.sub('%U', unit)
      result %= value
    else
      prefix = prefixes[
        (first_prefix.fraction ? -1 : 1) * Math.log(value.abs) / Math.log(first_prefix.step)
      ]
      result = format.sub('%U', "#{prefix.name}#{unit}")
      result %= (value / prefix.multiplier.to_f)
    end
  end

  class UnitParser < StringScanner
    NUMBER = /([+-]?
               (?:0|[1-9]\d*)
               (?:
                 \.\d+(?i:e[+-]?\d+) |
                 \.\d+ |
                 (?i:e[+-]?\d+)
               )?
             )/x

    def initialize(source, unit, prefixes = nil)
      super source
      if prefixes
        @unit_re    = unit_re(Tins::Unit.prefixes(prefixes), unit)
        @unit_lc_re = @unit_uc_re = nil
      else
        @unit_lc_re = unit_re(Tins::Unit.prefixes(:lc), unit)
        @unit_uc_re = unit_re(Tins::Unit.prefixes(:uc), unit)
        @unit_re    = nil
      end
      @number       = 1.0
    end

    def unit_re(prefixes, unit)
      re = Regexp.new(
        "(#{prefixes.reverse.map { |pre| Regexp.quote(pre.name) } * ?|})(#{unit})"
      )
      re.singleton_class.class_eval do
        define_method(:prefixes) { prefixes }
      end
      re
    end

    private :unit_re

    attr_reader :number

    def scan(re)
      re.nil? and return
      super
    end

    def scan_number
      scan(NUMBER) or return
      @number *= BigDecimal(self[1])
    end

    def scan_unit
      case
      when scan(@unit_re)
        prefix = @unit_re.prefixes.find { |pre| pre.name == self[1] } or return
        @number *= prefix.multiplier
      when scan(@unit_lc_re)
        prefix = @unit_lc_re.prefixes.find { |pre| pre.name == self[1] } or return
        @number *= prefix.multiplier
      when scan(@unit_uc_re)
        prefix = @unit_uc_re.prefixes.find { |pre| pre.name == self[1] } or return
        @number *= prefix.multiplier
      end
    end

    def scan_char(char)
      scan(/#{char}/) or return
    end

    def parse
      raise NotImplementedError
    end
  end

  class FormatParser < StringScanner
    def initialize(format, unit_parser)
      super format
      @unit_parser = unit_parser
    end

    def reset
      super
      @unit_parser.reset
    end

    def location
      @unit_parser.peek(10).inspect
    end

    private :location

    def parse
      reset
      until eos? || @unit_parser.eos?
        case
        when scan(/%f/)
          @unit_parser.scan_number or
            raise ParserError, "\"%f\" expected at #{location}"
        when scan(/%U/)
          @unit_parser.scan_unit or
            raise ParserError, "\"%U\" expected at #{location}"
        when scan(/%%/)
          @unit_parser.scan_char(?%) or
            raise ParserError, "#{?%.inspect} expected at #{location}"
        else
          char = scan(/./)
          @unit_parser.scan_char(char) or
            raise ParserError, "#{char.inspect} expected at #{location}"
        end
      end
      unless eos? && @unit_parser.eos?
        raise ParserError,
          "format #{string.inspect} and string "\
            "#{@unit_parser.string.inspect} do not match"
      end
      @unit_parser.number
    end
  end

  # Parse the string +string+ if it matches +format+ with the unit +unit+ and
  # the prefixes specified by +prefix+.
  def parse(string, format: '%f %U', unit: ?b, prefix: nil)
    prefixes = prefixes(prefix)
    FormatParser.new(format, UnitParser.new(string, unit, prefixes)).parse
  end

  def parse?(string, **options)
    parse(string, **options)
  rescue ParserError
    nil
  end
end
