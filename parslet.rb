require 'parslet'

class ErlAx < Parslet::Parser
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





require 'minitest/autorun'
require 'minitest/spec'
describe ErlAx do
  def parse(c)
    ErlAx.new.parse(c)
  end

  def parsestr(c)
    parse(c).to_s
  end

  def parse_file(f)
    parse(File.read(f))
  end

  it 'parses an empty rabbit file' do
    _(parsestr('')).must_equal ''
  end

  it 'parses a file with a comment' do
    _(parsestr("%% -*- mode: erlang -*-\n%%\n")).must_equal "%% -*- mode: erlang -*-\n%%\n"
  end

  it 'parse simple root array' do
    _(parsestr("[].\n")).must_equal '{:array=>nil}'
  end

  it 'parses a root array with an int' do
    _(parsestr('[1].')).must_equal '{:array=>[{:integer=>"1"@1}]}'
  end

  it 'parses a root array with a float' do
    _(parsestr('[1.1].')).must_equal '{:array=>[{:float=>{:integer=>"1"@1, :e=>".1"@2}}]}'
  end

  it 'parses a root array with a double quoted string' do
    _(parsestr('["st\"r"].')).must_equal '{:array=>[{:string=>"st\\\\\\"r"@2}]}'
  end

  it 'parses a root array with a single quoted string' do
    _(parsestr('[\'st\\\'r\'].')).must_equal '{:array=>[{:string=>"st\\\\\'r"@2}]}'
  end

  it 'parses a root array with an empty binary' do
    _(parsestr('[<<>>].')).must_equal '{:array=>[{:binary=>nil}]}'
  end

  it 'parses a root array with a bit-stream with a string' do
    _(parsestr('[<<"pwd">>].')).must_equal '{:array=>[{:binary=>[{:string=>"pwd"@4, :size=>nil, :type=>nil}]}]}'
  end

  it 'parses a root array with a bit-stream with a string and type' do
    _(parsestr('[<<"pwd"/utf8>>].')).must_equal '{:array=>[{:binary=>[{:string=>"pwd"@4, :size=>nil, :type=>{:identifier=>"utf8"@9}}]}]}'
  end

  it 'parses a root array with a bit-stream of numbers' do
    _(parsestr('[<<0, 1, 2>>].')).must_equal '{:array=>[{:binary=>[{:integer=>"0"@3, :size=>nil, :type=>nil}, {:integer=>"1"@6, :size=>nil, :type=>nil}, {:integer=>"2"@9, :size=>nil, :type=>nil}]}]}'
  end

  it 'parses a root array with a mixed bit-stream of string+numbers' do
    _(parsestr('[<<97, "b", 99>>].')).must_equal '{:array=>[{:binary=>[{:integer=>"97"@3, :size=>nil, :type=>nil}, {:string=>"b"@8, :size=>nil, :type=>nil}, {:integer=>"99"@12, :size=>nil, :type=>nil}]}]}'
  end

  it 'parses a root array with a bit-stream of value:size' do
    _(parsestr('[<<0, 1:8, "2":16>>].')).must_equal '{:array=>[{:binary=>[{:integer=>"0"@3, :size=>nil, :type=>nil}, {:integer=>"1"@6, :size=>{:integer=>"8"@8}, :type=>nil}, {:string=>"2"@12, :size=>{:integer=>"16"@15}, :type=>nil}]}]}'
  end

  it 'parses a root array with a boolean' do
    _(parsestr('[true].')).must_equal '{:array=>[{:bool=>"true"@1}]}'
  end

  it 'parses a root array with an identifier' do
    _(parsestr('[hello_world123].')).must_equal '{:array=>[{:identifier=>"hello_world123"@1}]}'
  end

  it 'parses a root array with multiple elements' do
    _(parsestr("[1, \"a\" %%\n, true\n\t].")).must_equal '{:array=>[{:integer=>"1"@1}, {:string=>"a"@5}, {:bool=>"true"@13}]}'
  end

  it 'parses a root array with an tuple' do
    _(parsestr('[{}].')).must_equal '{:array=>[{:tuple=>nil}]}'
  end

  it 'parses a root array with an tuple' do
    _(parsestr('[{handshake_timeout, 100}].')).must_equal '{:array=>[{:tuple=>[{:identifier=>"handshake_timeout"@2}, {:integer=>"100"@21}]}]}'
  end

  it 'parses a root array with a stringy tuple' do
    _(parsestr('[{ab, [{"c", 1},{"d",2}]}].')).must_equal '{:array=>[{:tuple=>[{:identifier=>"ab"@2}, {:array=>[{:tuple=>[{:string=>"c"@9}, {:integer=>"1"@13}]}, {:tuple=>[{:string=>"d"@18}, {:integer=>"2"@21}]}]}]}]}'
  end

  it 'parses a complex deep array-tuple mix' do
    _(parsestr('[{rabbit,[{two,[]}]}].')).must_equal '{:array=>[{:tuple=>[{:identifier=>"rabbit"@2}, {:array=>[{:tuple=>[{:identifier=>"two"@11}, {:array=>nil}]}]}]}]}'
  end

  it 'parses a complex multi array tuple mix' do
    _(parsestr('[{rabbit,[{two,[]}]}, 3, false].')).must_equal '{:array=>[{:tuple=>[{:identifier=>"rabbit"@2}, {:array=>[{:tuple=>[{:identifier=>"two"@11}, {:array=>nil}]}]}]}, {:integer=>"3"@22}, {:bool=>"false"@25}]}'
  end

  it 'parses a complex array-tuple mix with comments' do
    s = '%% -*- mode: erlang -*-
[
  {rabbit,
    [%%

     %% some more text
     {tcp_listeners, [5672]}
   ]}].
'
    _(parsestr(s)).must_equal '{:array=>[{:tuple=>[{:identifier=>"rabbit"@29}, {:array=>[{:tuple=>[{:identifier=>"tcp_listeners"@75}, {:array=>[{:integer=>"5672"@91}]}]}]}]}]}'
  end
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

class ErlOm < Parslet::Transform
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
  rule(binary: subtree(:x)) { x.nil? ? '' : ErlOm.assemble_binary(x) }
  rule(identifier: simple(:x)) { Identifier.new(x.to_s) }
  rule(array: subtree(:x)) { Array(x) }
  rule(tuple: subtree(:x)) {
    x.nil? ? Tuple.new : Tuple.new(x)
  }
end

describe ErlOm do
  def parse(c)
    ErlOm.new.apply(ErlAx.new.parse(c))
  end

  it 'transforms and empty file' do
    _(parse('')).must_equal ''
  end

  it 'transforms an empty array' do
    _(parse('[].')).must_equal []
  end

  it 'transforms a simple array with one string' do
    _(parse('["one"].')).must_equal ['one']
  end

  it 'transforms a simple array with an empty string' do
    _(parse('[\'\'].')).must_equal ['']
  end

  it 'transforms a simple array with an empty binary' do
    _(parse('[<<>>].')).must_equal ['']
  end

  it 'transforms a simple array with a binary string' do
    _(parse('[<<"Hello world!">>].')).must_equal ['Hello world!']
  end

  it 'transforms a simple array with a binary sequence' do
    _(parse('[<<97, "b", 99>>].')).must_equal ['abc']
  end

  it 'transforms a default ascii string' do
    _(parse('[<<"Łぁ">>].')).must_equal ['AA']
  end

  it 'transforms a utf-8 string' do
    _(parse('[<<"Łぁ"/utf8>>].')).must_equal ['Łぁ']
  end

  it 'transforms a utf-16 string' do
    _(parse('[<<"Łぁ"/utf16>>].')).must_equal ["\u0001\u0041\u0030\u0041"]
  end

  it 'transforms a utf-32 string' do
    _(parse('[<<"Łぁ"/utf32>>].')).must_equal ["\u0000\u0000\u0001\u0041\u0000\u0000\u0030\u0041"]
  end

  it 'transforms a partial bit number sequence' do
    _(parse('[<<1:2,1:6>>].')).must_equal ['A']
  end

  it 'prevents mixing size and type for bit-streams' do
    _(proc { parse('[<<1:8/utf8>>].') }).must_raise RuntimeError
  end

  it 'transforms a simple array with multiple values' do
    _(parse('[1, 1.1, true, false, "ok"].')).must_equal [1, 1.1, true, false, 'ok']
  end

  it 'transforms a deep array' do
    _(parse('[[[[1]]]].')).must_equal [[[[1]]]]
  end

  it 'transforms an empty tuple' do
    _(parse('[{}].')).must_equal [ErlOm::Tuple.new]
  end

  it 'transforms a tuple with one element' do
    _(parse('[{1}].')).must_equal [ErlOm::Tuple.new([1])]
  end

  it 'transforms a tuple with multiple elements' do
    _(parse('[{id123, 1, 1.1}].')).must_equal [ErlOm::Tuple.new([ErlOm::Identifier.new('id123'), 1, 1.1])]
  end

  it 'transforms a deep tuple' do
    _(parse('[{{{1}}}].')).must_equal [ErlOm::Tuple.new([ErlOm::Tuple.new([ErlOm::Tuple.new([1])])])]
  end

  it 'transforms a deep mix of tuple and array' do
    _(parse('[{[{1}]}].')).must_equal [ErlOm::Tuple.new([[ErlOm::Tuple.new([1])]])]
  end
end

describe 'complex use-case' do
  it 'parses a tricky rabbitmq config file' do
    f = 'rabbitmq.config'
    unless File.file?(f)
      puts "NO #{f}, skipping this check!"
      return
    end
    puts 'Wheeee, testing a real rabbitmq nasty config file'
    c = File.read(f)
    _(ErlAx.new.parse(c).to_s).must_be_instance_of String
    res = ErlOm.new.apply(ErlAx.new.parse(c))
    # require "pry"; binding.pry
  end
end
