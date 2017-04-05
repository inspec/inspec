# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'parslet'

class ErlangParser < Parslet::Parser
  root :outermost
  # only designed for rabbitmq config files for now:
  rule(:outermost) { filler? >> array.maybe >> dot.maybe }

  rule(:exp) {
    (tuple | array | binary | string | bool | identifier | float | integer) >> filler?
  }

  rule(:array) {
    str('[') >> filler? >> (
      exp.repeat(1) >>
      (comma >> exp).repeat
    ).maybe.as(:array) >> str(']') >> filler?
  }

  rule(:tuple) {
    str('{') >> filler? >> (
      exp.repeat(1) >> filler? >>
      (comma >> exp).repeat
    ).maybe.as(:tuple) >> str('}') >> filler?
  }

  rule(:filler?) { space.repeat }
  rule(:space)   { match('\s+') | match["\n"] | comment }

  rule(:comment) { str('%') >> (match["\n\r"].absent? >> any).repeat }
  rule(:comma) { str(',') >> filler? }
  rule(:dot) { str('.') >> filler? }
  rule(:bool) { str('true').as(:bool) | str('false').as(:bool) }

  rule(:identifier) {
    (match('[a-zA-Z]') >> match('[a-zA-Z0-9_]').repeat).as(:identifier) >> filler?
  }

  rule(:float) {
    (
      integer >> (
        str('.') >> match('[0-9]').repeat(1) |
        str('e') >> match('[0-9]').repeat(1)
      ).as(:e)
    ).as(:float) >> filler?
  }

  rule(:integer) {
    ((str('+') | str('-')).maybe >> match('[0-9]').repeat(1)).as(:integer) >> filler?
  }

  rule(:string) { stringS | stringD }

  rule(:stringS) {
    str("'") >> (
      str('\\') >> any | str("'").absent? >> any
    ).repeat.as(:string) >> str("'") >> filler?
  }

  rule(:stringD) {
    str('"') >> (
      str('\\') >> any | str('"').absent? >> any
    ).repeat.as(:string) >> str('"') >> filler?
  }

  rule(:binary_item) {
    (string | integer) >>
      (str(':') >> integer).maybe.as(:size) >>
      (str('/') >> identifier).maybe.as(:type) >>
      filler?
  }

  rule(:binary) {
    str('<<') >> filler? >> (
      binary_item.repeat(1) >>
      (comma >> binary_item).repeat
    ).maybe.as(:binary) >> str('>>') >> filler?
  }
end

class ErlangBitstream
  def initialize
    @data = []     # a stream of 8-bit numbers
    @cur_bits = '' # a string of binary bits 10010010...
  end

  TYPES = {
    'integer' => 8,
    'float'   => 8*8,
    'utf8'    => 8,
    'utf16'   => 8*2,
    'utf32'   => 8*4,
  }.freeze

  def bit_size(size, type)
    raise 'Cannot specify size and type at the same time.' if !type.nil? && !size.nil?
    return (size || 8).to_i if type.nil?
    TYPES[type] || raise("Cannot handle binary-stream type #{type}")
  end

  def add(i)
    if i[:integer].nil? && i[:string].nil?
      raise 'No data provided, internal error for binary-stream processing!'
    end
    s = bit_size(i[:size], i[:type])
    unless i[:string].nil?
      str2int(i[:string].to_s, i[:type]).map { |e| add_bits(int2bits(e, 8)) }
    else
      add_int(i[:integer], s)
    end
  rescue RuntimeError => e
    raise 'Error processing Erlang bit string '\
          "'#{i[:string] || i[:integer]}:#{i[:size]}/#{i[:type]}'. #{e.message}"
  end

  def str2int(s, type)
    case type
    when 'utf8' then s.encode('utf-8').unpack('C*')
    when 'utf16' then s.encode('utf-16').unpack('C*').drop(2)
    when 'utf32' then s.encode('utf-32').unpack('C*').drop(4)
    when 'integer', 'float' then raise "Cannot handle bit string as type #{type}"
    else s.split('').map { |x| x.ord & 0xff }
    end
  end

  def int2bits(i, len)
    format("%0#{len}b", i)
  end

  def add_int(v, size)
    x = v.to_i & (2**size - 1) # only get the bits specified in size
    add_bits(int2bits(x, size))
  end

  def add_bits(s)
    b = (@cur_bits + s).scan(/.{1,8}/)
    @data += b[0..-2].map { |x| x.to_i(2) }
    @cur_bits = b.last
  end

  def value(encoding = 'utf-8')
    # fill in the rest
    rest = '0' * (8 - @cur_bits.length) + @cur_bits
    arr = @data + [rest.to_i(2)]
    s = arr.pack('C*')
    s.force_encoding(encoding) unless encoding.nil?
    s
  end
end

class ErlangTransform < Parslet::Transform
  class Tuple < Array; end
  class Identifier < String; end

  def self.assemble_binary(seq)
    b = ErlangBitstream.new
    seq.each { |i| b.add(i) }
    b.value
  end

  rule(string: simple(:x)) { x.to_s }
  rule(string: []) { '' }
  rule(integer: simple(:x)) { x.to_i }
  rule(float: { integer: simple(:a), e: simple(:b) }) { (a+b).to_f }
  rule(bool: 'true') { true }
  rule(bool: 'false') { false }
  rule(binary: subtree(:x)) { x.nil? ? '' : ErlangTransform.assemble_binary(x) }
  rule(identifier: simple(:x)) { Identifier.new(x.to_s) }
  rule(array: subtree(:x)) { Array(x) }
  rule(tuple: subtree(:x)) {
    x.nil? ? Tuple.new : Tuple.new(x)
  }
end

class ErlangConfigFile
  def self.parse(content)
    lex = ErlangParser.new.parse(content)
    tree = ErlangTransform.new.apply(lex)
    turn_to_hash(tree)
  end

  def self.turn_to_hash(t)
    if t.is_a?(Array) && t.all? { |x| x.class == ErlangTransform::Tuple && x.length == 2 }
      Hash[t.map { |i| [i[0], turn_to_hash(i[1])] }]
    else
      t
    end
  end
end
