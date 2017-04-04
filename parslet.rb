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

  rule(:binary) {
    str('<<') >> (
      str('>>').absent? >> any
    ).repeat.as(:binary) >> str('>>') >> filler?
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

  it 'parses a root array with a binary' do
    _(parsestr('[<<0, G, B>>].')).must_equal '{:array=>[{:binary=>"0, G, B"@3}]}'
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



class ErlEr < Parslet::Transform
  class Tuple < Array; end
  class Identifier < String; end
  rule(string: simple(:x)) { x.to_s }
  rule(string: []) { '' }
  rule(integer: simple(:x)) { x.to_i }
  rule(float: { integer: simple(:a), e: simple(:b) }) { (a+b).to_f }
  rule(bool: 'true') { true }
  rule(bool: 'false') { false }
  rule(identifier: simple(:x)) { Identifier.new(x.to_s) }
  # TODO: binary!
  rule(array: subtree(:x)) { Array(x) }
  rule(tuple: subtree(:x)) {
    x.nil? ? Tuple.new : Tuple.new(x)
  }
end

describe ErlEr do
  def parse(c)
    ErlEr.new.apply(ErlAx.new.parse(c))
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

  it 'transforms a simple array with multiple values' do
    _(parse('[1, 1.1, true, false, "ok"].')).must_equal [1, 1.1, true, false, 'ok']
  end

  it 'transforms a deep array' do
    _(parse('[[[[1]]]].')).must_equal [[[[1]]]]
  end

  it 'transforms an empty tuple' do
    _(parse('[{}].')).must_equal [ErlEr::Tuple.new]
  end

  it 'transforms a tuple with one element' do
    _(parse('[{1}].')).must_equal [ErlEr::Tuple.new([1])]
  end

  it 'transforms a tuple with multiple elements' do
    _(parse('[{id123, 1, 1.1}].')).must_equal [ErlEr::Tuple.new([ErlEr::Identifier.new('id123'), 1, 1.1])]
  end

  it 'transforms a deep tuple' do
    _(parse('[{{{1}}}].')).must_equal [ErlEr::Tuple.new([ErlEr::Tuple.new([ErlEr::Tuple.new([1])])])]
  end

  it 'transforms a deep mix of tuple and array' do
    _(parse('[{[{1}]}].')).must_equal [ErlEr::Tuple.new([[ErlEr::Tuple.new([1])]])]
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
    res = ErlEr.new.apply(ErlAx.new.parse(c))
    # require "pry"; binding.pry
  end
end
