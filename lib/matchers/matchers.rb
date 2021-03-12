# copyright: 2015, Vulcano Security GmbH

require "rspec/matchers"

RSpec::Matchers.define :be_readable do
  match do |file|
    file.readable?(@by, @by_user)
  end

  chain :by do |by|
    @by = by
  end

  chain :by_user do |by_user|
    @by_user = by_user
  end

  description do
    res = "be readable"
    res += " by #{@by}" unless @by.nil?
    res += " by user #{@by_user}" unless @by_user.nil?
    res
  end
end

RSpec::Matchers.define :be_writable do
  match do |file|
    file.writable?(@by, @by_user)
  end

  chain :by do |by|
    @by = by
  end

  chain :by_user do |by_user|
    @by_user = by_user
  end

  description do
    res = "be writable"
    res += " by #{@by}" unless @by.nil?
    res += " by user #{@by_user}" unless @by_user.nil?
    res
  end
end

RSpec::Matchers.define :be_executable do
  match do |file|
    file.executable?(@by, @by_user)
  end

  chain :by do |by|
    @by = by
  end

  chain :by_user do |by_user|
    @by_user = by_user
  end

  description do
    res = "be executable"
    res += " by #{@by}" unless @by.nil?
    res += " by user #{@by_user}" unless @by_user.nil?
    res
  end
end

RSpec::Matchers.define :contain_duplicates do
  match do |arr|
    dup = arr.select { |element| arr.count(element) > 1 }
    !dup.uniq.empty?
  end
end

# for packages
RSpec::Matchers.define :be_installed do
  match do |package|
    package.installed? == true
  end

  failure_message do |package|
    "expected that `#{package}` is installed"
  end

  chain :by do
    raise "[UNSUPPORTED] Please use the new resources 'gem', 'npm' or 'pip'."
  end
end

# for services
RSpec::Matchers.define :be_enabled do
  match do |service|
    service.enabled? == true
  end

  chain :with_level do |_level|
    raise "[UNSUPPORTED] with level is not supported"
  end

  failure_message do |service|
    "expected that `#{service}` is enabled"
  end
end

# service resource matcher for serverspec compatibility
# Deprecated: You should not use this matcher anymore
RSpec::Matchers.define :be_running do
  match do |service|
    service.running? == true
  end

  chain :under do |_under|
    raise "[UNSUPPORTED] under is not supported"
  end

  failure_message do |service|
    "expected that `#{service}` is running"
  end
end

# matcher to check if host is reachable
RSpec::Matchers.define :be_reachable do
  match do |host|
    host.reachable? == true
  end

  chain :with do |_attr|
    raise "[UNSUPPORTED] `with` is not supported in combination with `be_reachable`"
  end

  failure_message do |host|
    "expected that host #{host} is reachable"
  end
end

# matcher to check if host is resolvable
RSpec::Matchers.define :be_resolvable do
  match do |host|
    host.resolvable? == true
  end

  chain :by do |_type|
    raise "[UNSUPPORTED] `by` is not supported in combination with `be_resolvable`. Please use the following syntax `host('example.com', port: 53, proto: 'udp')`."
  end

  failure_message do |host|
    "expected that host #{host} is resolvable"
  end
end

# matcher for iptables and ip6tables
RSpec::Matchers.define :have_rule do |rule|
  match do |tables|
    tables.has_rule?(rule)
  end

  chain :with_table do |_table|
    raise "[UNSUPPORTED] `with_table` is not supported in combination with `have_rule`. Please use the following syntax `iptables(table:'mangle', chain: 'input')`."
  end

  chain :with_chain do |_chain|
    raise "[UNSUPPORTED] `with_table` is not supported in combination with `with_chain`. Please use the following syntax `iptables(table:'mangle', chain: 'input')`."
  end
end

# `be_in` matcher
# You can use it in the following cases:
# - check if an item or array is included in a given array
# eg:
# describe nginx do
#   its('user') { should be_in AUTHORIZED_USER_LIST }
# end
# describe nginx do
#   its('module_list') { should be_in AUTHORIZED_MODULE_LIST }
# end
RSpec::Matchers.define :be_in do |list|
  match do |item|
    # Handle both single item and array
    item.is_a?(Array) ? (item - list).empty? : list.include?(item)
  end

  match_when_negated do |item|
    # Handle both single item and array
    item.is_a?(Array) ? (item & list).empty? : !list.include?(item)
  end

  failure_message do |item|
    if item.is_a?(Array)
      "expected `#{item}` to be in the list: `#{list}` \nDiff:\n #{(item - list)}"
    else
      "expected `#{item}` to be in the list: `#{list}`"
    end
  end

  failure_message_when_negated do |item|
    if item.is_a?(Array)
      "expected `#{item}` not to be in the list: `#{list}` \nComm:\n #{(item & list)}"
    else
      "expected `#{item}` not to be in the list: `#{list}`"
    end
  end
end

# This matcher implements a compare feature that cannot be covered by the default
# `eq` matcher
# You can use it in the following cases:
# - compare strings case-insensitive
# - you expect a number (strings will be converted if possible)
#
RSpec::Matchers.define :cmp do |first_expected| # rubocop:disable Metrics/BlockLength

  def integer?(value)
    !(value =~ /\A-?0+\Z|\A-?[1-9]\d*\Z/).nil?
  end

  def float?(value)
    Float(value)
    true
  rescue ArgumentError, TypeError
    false
  end

  def octal?(value)
    value.is_a?(String) && (value =~ /\A0+[0-7]+\Z/)
  end

  def boolean?(value)
    %w{true false}.include?(value.downcase)
  end

  def version?(value)
    Gem::Version.new(value)
    true
  rescue ArgumentError => _ex
    false
  end

  # expects that the values have been checked with boolean?
  def to_boolean(value)
    value.casecmp("true") == 0
  end

  def try_match(actual, op, expected) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
    # if actual and expected are strings
    if expected.is_a?(String) && actual.is_a?(String)
      return actual.casecmp(expected) == 0 if op == :==
      return Gem::Version.new(actual).send(op, Gem::Version.new(expected)) if
        version?(expected) && version?(actual)
    elsif expected.is_a?(Regexp) && (actual.is_a?(String) || actual.is_a?(Integer))
      return !actual.to_s.match(expected).nil?
    elsif expected.is_a?(String) && integer?(expected) && actual.is_a?(Integer)
      return actual.send(op, expected.to_i)
    elsif expected.is_a?(String) && boolean?(expected) && [true, false].include?(actual)
      return actual.send(op, to_boolean(expected))
    elsif expected.is_a?(Integer) && actual.is_a?(String) && integer?(actual)
      return actual.to_i.send(op, expected)
    elsif expected.is_a?(Float) && float?(actual)
      return actual.to_f.send(op, expected)
    elsif actual.is_a?(Symbol) && expected.is_a?(String)
      return try_match(actual.to_s, op, expected)
    elsif octal?(expected) && actual.is_a?(Integer)
      return actual.send(op, expected.to_i(8))
    end

    # fallback to simple operation
    actual.send(op, expected)
  rescue NameError => _
    false
  rescue ArgumentError
    false
  end

  match do |actual|
    @operation ||= :==
    @expected ||= first_expected
    return actual === @expected if @operation == :=== # rubocop:disable Style/CaseEquality

    actual = actual[0] if actual.is_a?(Array) && !@expected.is_a?(Array) && actual.length == 1
    try_match(actual, @operation, @expected)
  end

  %i{== != < <= >= > === =~}.each do |op|
    chain(op) do |x|
      @operation = op
      @expected = x
    end
  end

  def format_actual(actual)
    actual = "0%o" % actual if octal?(@expected) && !actual.nil?
    "\n%s\n     got: %s\n\n(compared using `cmp` matcher)\n" % [format_expectation(false), actual]
  end

  def format_expectation(negate)
    return "expected: %s" % [@expected] if @operation == :== && !negate

    negate_str = negate ? "not " : ""
    "expected it %sto be %s %p" % [negate_str, @operation, @expected]
  end

  failure_message do |actual|
    format_actual actual
  end

  failure_message_when_negated do |actual|
    format_actual actual
  end

  description do
    "cmp %s %p" % [@operation, @expected]
  end
end

# user resource matcher for serverspec compatibility
# This matcher will be deprecated in future
RSpec::Matchers.define :be_mounted do
  match do |path|
    if !@options.nil?
      path.mounted?(@options, @identical)
    else
      path.mounted?
    end
  end

  chain :with do |attr|
    @options = attr
    @identical = false
  end

  chain :only_with do |attr|
    @options = attr
    @identical = true
  end

  failure_message do |path|
    if !@options.nil?
      "\n#{path} is not mounted with the options\n     expected: #{@options}\n     got: #{path.mount_options}\n"
    else
      "\n#{path} is not mounted\n"
    end
  end
end
