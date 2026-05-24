require "helper"
require "inspec/utils/nginx_parser"

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

  it "parses an empty nginx file" do
    _(parsestr("")).must_equal ""
  end

  it "parses a file with a comment" do
    _(parsestr("# some nice comment")).must_equal "# some nice comment"
  end

  it "parses a simple assignment" do
    if Gem.ruby_version >= Gem::Version.new("3.4.0")
      _(parsestr("assignment a;")).must_equal "[{assignment: {identifier: \"assignment\"@0, args: [{value: \"a\"@11}]}}]"
    else
      _(parsestr("assignment a;")).must_equal "[{:assignment=>{:identifier=>\"assignment\"@0, :args=>[{:value=>\"a\"@11}]}}]"
    end
  end

  it "parses an assignment with a single quoted value" do
    result = parse("include '/a/b/c/*.conf';")
    _(result[0][:assignment][:identifier]).must_equal "include"
    _(result[0][:assignment][:args][0][:value]).must_equal "/a/b/c/*.conf"
  end

  it "parses an assignment with a double quoted value" do
    result = parse('include "/a/b/c/*.conf";')
    _(result[0][:assignment][:identifier]).must_equal "include"
    _(result[0][:assignment][:args][0][:value]).must_equal "/a/b/c/*.conf"
  end

  it "parses an assignment with single quote in a double quoted value" do
    result = parse('include "/a/\'b/*.conf";')
    _(result[0][:assignment][:identifier]).must_equal "include"
    _(result[0][:assignment][:args][0][:value]).must_equal "/a/'b/*.conf"
  end

  it "parses an assignment with double quote in a single quoted value" do
    result = parse("include '/a/\"b/*.conf';")
    _(result[0][:assignment][:identifier]).must_equal "include"
    _(result[0][:assignment][:args][0][:value]).must_equal "/a/\"b/*.conf"
  end

  it "parses an assignment with single quote in a single quoted value" do
    result = parse("include '/a/\\\'b/*.conf';")
    _(result[0][:assignment][:identifier]).must_equal "include"
    _(result[0][:assignment][:args][0][:value]).must_equal "/a/\\\'b/*.conf"
  end

  it "parses an assignment with double quote in a double quoted value" do
    result = parse('include "/a/\"b/*.conf";')
    _(result[0][:assignment][:identifier]).must_equal "include"
    _(result[0][:assignment][:args][0][:value]).must_equal '/a/\"b/*.conf'

  end

  it "parses an empty group" do
    if Gem.ruby_version >= Gem::Version.new("3.4.0")
      _(parsestr("group {}")).must_equal "[{section: {identifier: \"group\"@0}, args: \"\", expressions: []}]"
    else
      _(parsestr("group {}")).must_equal "[{:section=>{:identifier=>\"group\"@0}, :args=>\"\", :expressions=>[]}]"
    end
  end

  it "parses a group with parameters" do
    if Gem.ruby_version >= Gem::Version.new("3.4.0")
      _(parsestr("group a b {}")).must_equal "[{section: {identifier: \"group\"@0}, args: [{value: \"a\"@6}, {value: \"b\"@8}], expressions: []}]"
    else
      _(parsestr("group a b {}")).must_equal "[{:section=>{:identifier=>\"group\"@0}, :args=>[{:value=>\"a\"@6}, {:value=>\"b\"@8}], :expressions=>[]}]"
    end
  end

  it "parses a group with a body" do
    if Gem.ruby_version >= Gem::Version.new("3.4.0")
      _(parsestr("group {\na b;\n}")).must_equal "[{section: {identifier: \"group\"@0}, args: \"\", expressions: [{assignment: {identifier: \"a\"@8, args: [{value: \"b\"@10}]}}]}]"
    else
      _(parsestr("group {\na b;\n}")).must_equal "[{:section=>{:identifier=>\"group\"@0}, :args=>\"\", :expressions=>[{:assignment=>{:identifier=>\"a\"@8, :args=>[{:value=>\"b\"@10}]}}]}]"
    end
  end

  it "parses a group with arguments and a body" do
    if Gem.ruby_version >= Gem::Version.new("3.4.0")
      _(parsestr("group c {\na b;\n}")).must_equal "[{section: {identifier: \"group\"@0}, args: [{value: \"c\"@6}], expressions: [{assignment: {identifier: \"a\"@10, args: [{value: \"b\"@12}]}}]}]"
    else
      _(parsestr("group c {\na b;\n}")).must_equal "[{:section=>{:identifier=>\"group\"@0}, :args=>[{:value=>\"c\"@6}], :expressions=>[{:assignment=>{:identifier=>\"a\"@10, :args=>[{:value=>\"b\"@12}]}}]}]"
    end
  end

  it "parses nested groups" do
    if Gem.ruby_version >= Gem::Version.new("3.4.0")
      _(parsestr("f {g {h {\n# comment\n}}}")).must_equal "[{section: {identifier: \"f\"@0}, args: \"\", expressions: [{section: {identifier: \"g\"@3}, args: \"\", expressions: [{section: {identifier: \"h\"@6}, args: \"\", expressions: []}]}]}]"
    else
      _(parsestr("f {g {h {\n# comment\n}}}")).must_equal "[{:section=>{:identifier=>\"f\"@0}, :args=>\"\", :expressions=>[{:section=>{:identifier=>\"g\"@3}, :args=>\"\", :expressions=>[{:section=>{:identifier=>\"h\"@6}, :args=>\"\", :expressions=>[]}]}]}]"
    end
  end

  it "parses quoted identifiers for assignments" do
    if Gem.ruby_version >= Gem::Version.new("3.4.0")
      _(parsestr(%{"~^\/opcache-api" 1;})).must_equal "[{assignment: {identifier: \"~^/opcache-api\"@1, args: [{value: \"1\"@17}]}}]"
    else
      _(parsestr(%{"~^\/opcache-api" 1;})).must_equal "[{:assignment=>{:identifier=>\"~^/opcache-api\"@1, :args=>[{:value=>\"1\"@17}]}}]"
    end
  end

  it "parses regex identifiers for assignments" do
    if Gem.ruby_version >= Gem::Version.new("3.4.0")
      _(parsestr(%{~^\/opcache-api 1;})).must_equal "[{assignment: {identifier: \"~^/opcache-api\"@0, args: [{value: \"1\"@15}]}}]"
    else
      _(parsestr(%{~^\/opcache-api 1;})).must_equal "[{:assignment=>{:identifier=>\"~^/opcache-api\"@0, :args=>[{:value=>\"1\"@15}]}}]"
    end
  end

  it "parses wildcard identifiers for assignments" do
    if Gem.ruby_version >= Gem::Version.new("3.4.0")
      _(parsestr(%{*.example.org qa;})).must_equal "[{assignment: {identifier: \"*.example.org\"@0, args: [{value: \"qa\"@14}]}}]"
    else
      _(parsestr(%{*.example.org qa;})).must_equal "[{:assignment=>{:identifier=>\"*.example.org\"@0, :args=>[{:value=>\"qa\"@14}]}}]"
    end
  end

  it "parses dot-prefixed identifiers for assignments" do
    if Gem.ruby_version >= Gem::Version.new("3.4.0")
      _(parsestr(%{.example.com test;})).must_equal "[{assignment: {identifier: \".example.com\"@0, args: [{value: \"test\"@13}]}}]"
    else
      _(parsestr(%{.example.com test;})).must_equal "[{:assignment=>{:identifier=>\".example.com\"@0, :args=>[{:value=>\"test\"@13}]}}]"
    end
  end

end

describe NginxTransform do
  def parse(c)
    NginxTransform.new.apply(NginxParser.new.parse(c))
  end

  it "transforms and empty file" do
    _(parse("")).must_equal ""
  end

  it "transforms an assignment" do
    _(parse("a b;")).must_equal [NginxTransform::Exp.new("a", ["b"])]
  end

  it "transforms an empty group" do
    _(parse("group {}")).must_equal [NginxTransform::Group.new("group", "", [])]
  end

  it "transforms a simple group" do
    _(parse("group a {\na b;\n}")).must_equal [NginxTransform::Group.new("group", ["a"], [NginxTransform::Exp.new("a", ["b"])])]
  end

  it "transforms a deeply nested group" do
    _(parse("f { g { h {\na b;\n}}}")).must_equal [
      NginxTransform::Group.new("f", "", [
        NginxTransform::Group.new("g", "", [
          NginxTransform::Group.new("h", "", [NginxTransform::Exp.new("a", ["b"])]),
        ]),
      ]),
    ]
  end
end

describe NginxConfig do
  def with_env(name, value)
    old_value = ENV[name]
    if value.nil?
      ENV.delete(name)
    else
      ENV[name] = value
    end
    yield
  ensure
    if old_value.nil?
      ENV.delete(name)
    else
      ENV[name] = old_value
    end
  end

  it "parses a minimal server block into a nested hash" do
    input = <<~NGINX
      server {
        listen 80;
        server_name example.com;
        location / {
          proxy_pass http://backend;
        }
      }
    NGINX

    result = NginxConfig.parse(input)
    _(result).must_be_kind_of Hash
    _(result["server"]).must_be_kind_of Array
    _(result["server"].length).must_equal 1

    server = result["server"][0]
    _(server["listen"]).must_equal [["80"]]
    _(server["server_name"]).must_equal [["example.com"]]
    _(server["location"]).must_be_kind_of Array
    _(server["location"].length).must_equal 1

    location = server["location"][0]
    _(location["_"]).must_equal ["/"]
    _(location["proxy_pass"]).must_equal [["http://backend"]]
  end

  it "returns an empty hash for empty input" do
    with_env("INSPEC_NGINX_ALLOW_EMPTY_INPUT", nil) do
      _(NginxConfig.parse(""))
        .must_equal({})
    end
  end

  it "returns an empty hash for empty input when toggle is ON" do
    with_env("INSPEC_NGINX_ALLOW_EMPTY_INPUT", "true") do
      _(NginxConfig.parse(""))
        .must_equal({})
    end
  end

  it "raises ArgumentError for empty input when toggle is OFF" do
    with_env("INSPEC_NGINX_ALLOW_EMPTY_INPUT", "false") do
      err = _ { NginxConfig.parse("") }.must_raise ArgumentError
      _(err.message).must_match(/empty input is disabled/)
    end
  end

  it "raises ArgumentError when given nil" do
    err = _ { NginxConfig.parse(nil) }.must_raise ArgumentError
    _(err.message).must_match(/requires a String, got NilClass/)
  end

  it "raises ArgumentError when given a non-string" do
    err = _ { NginxConfig.parse(123) }.must_raise ArgumentError
    _(err.message).must_match(/requires a String, got Integer/)
  end

  it "raises an error for invalid syntax" do
    err = _ { NginxConfig.parse("server {") }.must_raise Inspec::NginxParseError
    _(err.message).must_match(/Failed to parse Nginx config/)
  end

  it "preserves the original parser failure as the cause" do
    err = _ { NginxConfig.parse("server {") }.must_raise Inspec::NginxParseError
    _(err.cause).wont_be_nil
    _(err.cause.class).must_equal Parslet::ParseFailed
  end
end
