require "parslet"
require "inspec/log"

# Parslet-based lexer for Nginx configuration syntax.
# Produces an AST of hashes tagged :assignment and :section.
class NginxParser < Parslet::Parser
  root :outermost
  # Parses Nginx configuration files (directives, blocks, comments).
  rule(:outermost) { filler? >> exp.repeat }

  # Whitespace and comments — skipped between tokens.
  rule(:filler?) { one_filler.repeat }
  rule(:one_filler) { match('\s+') | match["\n"] | comment }
  rule(:space)   { match('\s+') }
  rule(:comment) { str("#") >> (match["\n\r"].absent? >> any).repeat }

  # An expression is either a block (section) or a directive (assignment).
  rule(:exp) do
    section | assignment
  end

  # Directive: "identifier arg1 arg2 ...;"
  rule(:assignment) do
    (identifier >> values.maybe.as(:args)).as(:assignment) >> str(";") >> filler?
  end

  # Unquoted identifier — starts with letter, ~, *, or dot.
  rule(:standard_identifier) do
    (match("[a-zA-Z~*.]") >> match('\S').repeat).as(:identifier) >> space >> space.repeat
  end

  # Double-quoted identifier (e.g. regex locations).
  rule(:quoted_identifier) do
    str('"') >> (str('"').absent? >> any).repeat.as(:identifier) >> str('"') >> space.repeat
  end

  rule(:identifier) do
    standard_identifier | quoted_identifier
  end

  # Unquoted value — stops at comment, semicolon, brace, or quote start.
  rule(:standard_value) do
    ((match(/[#;{'"]/).absent? >> any) >> (
      str("\\") >> any | match('[#;{]|\s').absent? >> any
    ).repeat).as(:value) >> space.repeat
  end

  rule(:single_quoted_value) do
    str("'") >> (
      str("\\") >> any | str("'").absent? >> any
    ).repeat.as(:value) >> str("'") >> space.repeat
  end

  rule(:double_quoted_value) do
    str('"') >> (
      str("\\") >> any | str('"').absent? >> any
    ).repeat.as(:value) >> str('"') >> space.repeat
  end

  rule(:quoted_value) do
    single_quoted_value | double_quoted_value
  end

  rule(:value) do
    standard_value | quoted_value
  end

  rule(:values) do
    value.repeat >> space.maybe
  end

  # Block: "identifier args { expressions }"
  rule(:section) do
    identifier.as(:section) >> values.maybe.as(:args) >> str("{") >> filler? >> exp.repeat.as(:expressions) >> str("}") >> filler?
  end
end

# Converts NginxParser's raw AST into typed structs (Group, Exp).
class NginxTransform < Parslet::Transform
  Group = Struct.new(:id, :args, :body) # A named block (server, location, etc.)
  Exp = Struct.new(:key, :vals)         # A directive (listen, proxy_pass, etc.)

  rule(section: { identifier: simple(:x) }, args: subtree(:y), expressions: subtree(:z)) { Group.new(x.to_s, y, z) }
  rule(assignment: { identifier: simple(:x), args: subtree(:y) }) { Exp.new(x.to_s, y) }
  rule(value: simple(:x)) { x.to_s }
end

# High-level interface: parses Nginx config text into a nested Hash.
#
# Usage:
#   result = NginxConfig.parse(File.read("/etc/nginx/nginx.conf"))
#   result["server"][0]["listen"]  #=> [["80"]]
#
class NginxConfig
  # Returns a nested Hash where:
  #   - directive keys map to arrays of argument lists
  #   - block keys map to arrays of sub-hashes (recursive)
  #   - "_" key holds the block's own arguments (e.g. location path)
  def self.parse(content)
    raise ArgumentError, "NginxConfig.parse requires a String, got #{content.class}" unless content.is_a?(String)

    if content.empty?
      Inspec::Log.debug { "nginx_parser: op=parse status=skip reason=empty_input" }
      return {}
    end

    start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    lex = NginxParser.new.parse(content)
    tree = NginxTransform.new.apply(lex)
    gtree = NginxTransform::Group.new(nil, "", tree)
    result = read_nginx_group(gtree)
    elapsed = ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - start) * 1000).round(2)
    Inspec::Log.debug { "nginx_parser: op=parse status=ok bytes=#{content.bytesize} elapsed_ms=#{elapsed}" }
    result
  rescue Parslet::ParseFailed => err
    elapsed = ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - start) * 1000).round(2) if start
    Inspec::Log.debug { "nginx_parser: op=parse status=error elapsed_ms=#{elapsed} error=#{err.message[0..80]}" }
    raise "Failed to parse NginX config: #{err}"
  end

  # Recursively converts a Group struct into a plain Hash.
  def self.read_nginx_group(t)
    agg_conf = Hash.new([])
    agg_conf["_"] = t.args unless t.args == ""

    groups, conf = t.body.partition { |i| i.is_a? NginxTransform::Group }
    conf.each { |x| agg_conf[x.key] += [x.vals] }
    groups.each { |x| agg_conf[x.id] += [read_nginx_group(x)] }
    agg_conf
  end
end
