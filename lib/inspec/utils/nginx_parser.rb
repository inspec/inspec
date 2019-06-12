require "parslet"

class NginxParser < Parslet::Parser
  root :outermost
  # only designed for rabbitmq config files for now:
  rule(:outermost) { filler? >> exp.repeat }

  rule(:filler?) { one_filler.repeat }
  rule(:one_filler) { match('\s+') | match["\n"] | comment }
  rule(:space)   { match('\s+') }
  rule(:comment) { str("#") >> (match["\n\r"].absent? >> any).repeat }

  rule(:exp) do
    section | assignment
  end
  rule(:assignment) do
    (identifier >> values.maybe.as(:args)).as(:assignment) >> str(";") >> filler?
  end

  rule(:standard_identifier) do
    (match("[a-zA-Z]") >> match('\S').repeat).as(:identifier) >> space >> space.repeat
  end

  rule(:quoted_identifier) do
    str('"') >> (str('"').absent? >> any).repeat.as(:identifier) >> str('"') >> space.repeat
  end

  rule(:identifier) do
    standard_identifier | quoted_identifier
  end

  rule(:standard_value) do
    ((match(/[#;{'"]/).absent? >> any) >> (
      str('\\') >> any | match('[#;{]|\s').absent? >> any
    ).repeat).as(:value) >> space.repeat
  end

  rule(:single_quoted_value) do
    str("'") >> (
      str('\\') >> any | str("'").absent? >> any
    ).repeat.as(:value) >> str("'") >> space.repeat
  end

  rule(:double_quoted_value) do
    str('"') >> (
      str('\\') >> any | str('"').absent? >> any
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

  rule(:section) do
    identifier.as(:section) >> values.maybe.as(:args) >> str("{") >> filler? >> exp.repeat.as(:expressions) >> str("}") >> filler?
  end
end

class NginxTransform < Parslet::Transform
  Group = Struct.new(:id, :args, :body)
  Exp = Struct.new(:key, :vals)

  def self.assemble_binary(seq)
    b = ErlangBitstream.new
    seq.each { |i| b.add(i) }
    b.value
  end

  rule(section: { identifier: simple(:x) }, args: subtree(:y), expressions: subtree(:z)) { Group.new(x.to_s, y, z) }
  rule(assignment: { identifier: simple(:x), args: subtree(:y) }) { Exp.new(x.to_s, y) }
  rule(value: simple(:x)) { x.to_s }
end

class NginxConfig
  def self.parse(content)
    lex = NginxParser.new.parse(content)
    tree = NginxTransform.new.apply(lex)
    gtree = NginxTransform::Group.new(nil, "", tree)
    read_nginx_group(gtree)
  rescue Parslet::ParseFailed => err
    raise "Failed to parse NginX config: #{err}"
  end

  def self.read_nginx_group(t)
    agg_conf = Hash.new([])
    agg_conf["_"] = t.args unless t.args == ""

    groups, conf = t.body.partition { |i| i.is_a? NginxTransform::Group }
    conf.each { |x| agg_conf[x.key] += [x.vals] }
    groups.each { |x| agg_conf[x.id] += [read_nginx_group(x)] }
    agg_conf
  end
end
