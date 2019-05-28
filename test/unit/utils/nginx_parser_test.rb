# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'inspec/utils/nginx_parser'

describe NginxParser do
  def parse(c)
    NginxParser.new.parse(c)
  end

  def parsestr(c)
    parse(c).to_s
  end

  def parse_file(f)
    parse(File.read(f))
  end

  it 'parses an empty nginx file' do
    _(parsestr('')).must_equal ''
  end

  it 'parses a file with a comment' do
    _(parsestr("# some nice comment")).must_equal "# some nice comment"
  end

  it 'parses a simple assignment' do
    _(parsestr("assignment a;")).must_equal "[{:assignment=>{:identifier=>\"assignment\"@0, :args=>[{:value=>\"a\"@11}]}}]"
  end

  it 'parses an assignment with a single quoted value' do
    result = parse("include '/a/b/c/*.conf';")
    result[0][:assignment][:identifier].must_equal 'include'
    result[0][:assignment][:args][0][:value].must_equal '/a/b/c/*.conf'
  end

  it 'parses an assignment with a double quoted value' do
    result = parse('include "/a/b/c/*.conf";')
    result[0][:assignment][:identifier].must_equal 'include'
    result[0][:assignment][:args][0][:value].must_equal '/a/b/c/*.conf'
  end

  it 'parses an assignemnt with single quote in a double quoted value' do
    result = parse('include "/a/\'b/*.conf";')
    result[0][:assignment][:identifier].must_equal 'include'
    result[0][:assignment][:args][0][:value].must_equal '/a/\'b/*.conf'
  end

  it 'parses an assignemnt with double quote in a single quoted value' do
    result = parse("include '/a/\"b/*.conf';")
    result[0][:assignment][:identifier].must_equal 'include'
    result[0][:assignment][:args][0][:value].must_equal "/a/\"b/*.conf"
  end

  it 'parses an assignemnt with single quote in a single quoted value' do
    result = parse("include '/a/\\\'b/*.conf';")
    result[0][:assignment][:identifier].must_equal 'include'
    result[0][:assignment][:args][0][:value].must_equal "/a/\\\'b/*.conf"
  end

  it 'parses an assignemnt with double quote in a double quoted value' do
    result = parse('include "/a/\"b/*.conf";')
    result[0][:assignment][:identifier].must_equal 'include'
    result[0][:assignment][:args][0][:value].must_equal '/a/\"b/*.conf'
  end

  it 'parses an empty group' do
    _(parsestr("group {}")).must_equal "[{:section=>{:identifier=>\"group\"@0}, :args=>\"\", :expressions=>[]}]"
  end

  it 'parses a group with parameters' do
    _(parsestr("group a b {}")).must_equal "[{:section=>{:identifier=>\"group\"@0}, :args=>[{:value=>\"a\"@6}, {:value=>\"b\"@8}], :expressions=>[]}]"
  end

  it 'parses a group with a body' do
    _(parsestr("group {\na b;\n}")).must_equal "[{:section=>{:identifier=>\"group\"@0}, :args=>\"\", :expressions=>[{:assignment=>{:identifier=>\"a\"@8, :args=>[{:value=>\"b\"@10}]}}]}]"
  end

  it 'parses a group with arguments and a body' do
    _(parsestr("group c {\na b;\n}")).must_equal "[{:section=>{:identifier=>\"group\"@0}, :args=>[{:value=>\"c\"@6}], :expressions=>[{:assignment=>{:identifier=>\"a\"@10, :args=>[{:value=>\"b\"@12}]}}]}]"
  end

  it 'parses nested groups' do
    _(parsestr("f {g {h {\n# comment\n}}}")).must_equal "[{:section=>{:identifier=>\"f\"@0}, :args=>\"\", :expressions=>[{:section=>{:identifier=>\"g\"@3}, :args=>\"\", :expressions=>[{:section=>{:identifier=>\"h\"@6}, :args=>\"\", :expressions=>[]}]}]}]"
  end

  it 'parses quoted identifiers for assignments' do
    _(parsestr(%{"~^\/opcache-api" 1;})).must_equal "[{:assignment=>{:identifier=>\"~^/opcache-api\"@1, :args=>[{:value=>\"1\"@17}]}}]"
  end
end

describe NginxTransform do
  def parse(c)
    NginxTransform.new.apply(NginxParser.new.parse(c))
  end

  it 'transforms and empty file' do
    _(parse('')).must_equal ''
  end

  it 'transforms an assignment' do
    _(parse('a b;')).must_equal [NginxTransform::Exp.new('a', ['b'])]
  end

  it 'transforms an empty group' do
    _(parse('group {}')).must_equal [NginxTransform::Group.new('group','',[])]
  end

  it 'transforms a simple group' do
    _(parse("group a {\na b;\n}")).must_equal [NginxTransform::Group.new('group',['a'],[NginxTransform::Exp.new('a', ['b'])])]
  end

  it 'transforms a deeply nested group' do
    _(parse("f { g { h {\na b;\n}}}")).must_equal [
      NginxTransform::Group.new('f', '', [
        NginxTransform::Group.new('g', '', [
          NginxTransform::Group.new('h', '', [NginxTransform::Exp.new('a', ['b'])])
        ])
      ])
    ]
  end
end
