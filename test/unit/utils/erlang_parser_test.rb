# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'inspec/utils/erlang_parser'

describe ErlangParser do
  def parse(c)
    ErlangParser.new.parse(c)
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

describe ErlangTransform do
  def parse(c)
    ErlangTransform.new.apply(ErlangParser.new.parse(c))
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
    _(parse('[{}].')).must_equal [ErlangTransform::Tuple.new]
  end

  it 'transforms a tuple with one element' do
    _(parse('[{1}].')).must_equal [ErlangTransform::Tuple.new([1])]
  end

  it 'transforms a tuple with multiple elements' do
    _(parse('[{id123, 1, 1.1}].')).must_equal [ErlangTransform::Tuple.new([ErlangTransform::Identifier.new('id123'), 1, 1.1])]
  end

  it 'transforms a deep tuple' do
    _(parse('[{{{1}}}].')).must_equal [ErlangTransform::Tuple.new([ErlangTransform::Tuple.new([ErlangTransform::Tuple.new([1])])])]
  end

  it 'transforms a deep mix of tuple and array' do
    _(parse('[{[{1}]}].')).must_equal [ErlangTransform::Tuple.new([[ErlangTransform::Tuple.new([1])]])]
  end
end
