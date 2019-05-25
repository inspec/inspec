require 'set'
require 'ipaddr'

require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-ec2'

class AwsSecurityGroup < Inspec.resource(1)
  name 'aws_security_group'
  desc 'Verifies settings for an individual AWS Security Group.'
  example <<~EXAMPLE
    describe aws_security_group('sg-12345678') do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :description, :group_id, :group_name, :vpc_id, :inbound_rules, :outbound_rules, :inbound_rules_count, :outbound_rules_count

  def to_s
    "EC2 Security Group #{@group_id}"
  end

  def allow_in?(criteria = {})
    allow(inbound_rules, criteria.dup)
  end
  RSpec::Matchers.alias_matcher :allow_in, :be_allow_in

  def allow_out?(criteria = {})
    allow(outbound_rules, criteria.dup)
  end
  RSpec::Matchers.alias_matcher :allow_out, :be_allow_out

  def allow_in_only?(criteria = {})
    allow_only(inbound_rules, criteria.dup)
  end
  RSpec::Matchers.alias_matcher :allow_in_only, :be_allow_in_only

  def allow_out_only?(criteria = {})
    allow_only(outbound_rules, criteria.dup)
  end
  RSpec::Matchers.alias_matcher :allow_out_only, :be_allow_out_only

  private

  def allow_only(rules, criteria)
    rules = allow__focus_on_position(rules, criteria)
    # allow_{in_out}_only require either a single-rule group, or you
    # to select a rule using position.
    return false unless rules.count == 1 || criteria.key?(:position)
    if criteria.key?(:security_group)
      if criteria.key?(:position)
        pos = criteria[:position] -1
      else
        pos = 0
      end
      return false unless rules[pos].key?(:user_id_group_pairs) && rules[pos][:user_id_group_pairs].count == 1
    end
    criteria[:exact] = true
    allow(rules, criteria)
  end

  def allow(rules, criteria)
    criteria = allow__check_criteria(criteria)
    rules = allow__focus_on_position(rules, criteria)

    rules.any? do |rule|
      matched = true
      matched &&= allow__match_port(rule, criteria)
      matched &&= allow__match_protocol(rule, criteria)
      matched &&= allow__match_ipv4_range(rule, criteria)
      matched &&= allow__match_ipv6_range(rule, criteria)
      matched &&= allow__match_security_group(rule, criteria)
      matched
    end
  end

  def allow__check_criteria(raw_criteria)
    allowed_criteria = [
      :from_port,
      :ipv4_range,
      :ipv6_range,
      :security_group,
      :port,
      :position,
      :protocol,
      :to_port,
      :exact, # Internal
    ]
    recognized_criteria = {}
    allowed_criteria.each do |expected_criterion|
      if raw_criteria.key?(expected_criterion)
        recognized_criteria[expected_criterion] = raw_criteria.delete(expected_criterion)
      end
    end

    # Any leftovers are unwelcome
    unless raw_criteria.empty?
      raise ArgumentError, "Unrecognized security group rule 'allow' criteria '#{raw_criteria.keys.join(',')}'. Expected criteria: #{allowed_criteria.join(', ')}"
    end

    recognized_criteria
  end

  def allow__focus_on_position(rules, criteria)
    return rules unless criteria.key?(:position)

    idx = criteria.delete(:position)

    # Normalize to a zero-based numeric index
    case # rubocop: disable Style/EmptyCaseCondition
    when idx.is_a?(Symbol) && idx == :first
      idx = 0
    when idx.is_a?(Symbol) && idx == :last
      idx = rules.count - 1
    when idx.is_a?(String)
      idx = idx.to_i - 1 # We document this as 1-based, so adjust to be zero-based.
    when idx.is_a?(Numeric)
      idx -= 1 # We document this as 1-based, so adjust to be zero-based.
    else
      raise ArgumentError, "aws_security_group 'allow' 'position' criteria must be an integer or the symbols :first or :last"
    end

    unless idx < rules.count
      raise ArgumentError, "aws_security_group 'allow' 'position' criteria #{idx+1} is out of range - there are only #{rules.count} rules for security group #{group_id}."
    end

    [rules[idx]]
  end

  def allow__match_port(rule, criteria) # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
    if criteria[:exact] || criteria[:from_port] || criteria[:to_port]
      # Exact match mode
      # :port is shorthand for a single-valued port range.
      criteria[:to_port] = criteria[:from_port] = criteria[:port] if criteria[:port]
      to = criteria[:to_port]
      from = criteria[:from_port]
      # It's a match if neither criteria was specified
      return true if to.nil? && from.nil?
      # Normalize to integers
      to = to.to_i unless to.nil?
      from = from.to_i unless from.nil?
      # It's a match if either was specified and the other was not
      return true if rule[:to_port] == to && from.nil?
      return true if rule[:from_port] == from && to.nil?
      # Finally, both must match.
      rule[:to_port] == to && rule[:from_port] == from
    elsif !criteria[:port]
      # port not specified, match anything
      true
    else
      # Range membership mode
      rule_from = rule[:from_port] || 0
      rule_to = rule[:to_port] || 65535
      (rule_from..rule_to).cover?(criteria[:port].to_i)
    end
  end

  def allow__match_protocol(rule, criteria)
    return true unless criteria.key?(:protocol)
    prot = criteria[:protocol]
    # We provide a "fluency alias" for -1 (any).
    prot = '-1' if prot == 'any'

    rule[:ip_protocol] == prot
  end

  def match_ipv4_or_6_range(rule, criteria)
    if criteria.key?(:ipv4_range)
      query = criteria[:ipv4_range]
      query = [query] unless query.is_a?(Array)
      ranges = rule[:ip_ranges].map { |rng| rng[:cidr_ip] }
    else # IPv6
      query = criteria[:ipv6_range]
      query = [query] unless query.is_a?(Array)
      ranges = rule[:ipv_6_ranges].map { |rng| rng[:cidr_ipv_6] }
    end

    if criteria[:exact]
      Set.new(query) == Set.new(ranges)
    else
      # CIDR subset mode
      # "Each of the provided IP ranges must be a member of one of the rule's listed IP ranges"
      query.all? do |candidate|
        candidate = IPAddr.new(candidate)
        ranges.any? do |range|
          range = IPAddr.new(range)
          range.include?(candidate)
        end
      end
    end
  end

  def allow__match_ipv4_range(rule, criteria)
    return true unless criteria.key?(:ipv4_range)
    match_ipv4_or_6_range(rule, criteria)
  end

  def allow__match_ipv6_range(rule, criteria)
    return true unless criteria.key?(:ipv6_range)
    match_ipv4_or_6_range(rule, criteria)
  end

  def allow__match_security_group(rule, criteria)
    return true unless criteria.key?(:security_group)
    query = criteria[:security_group]
    return false unless rule[:user_id_group_pairs]
    rule[:user_id_group_pairs].any? { |group| query == group[:group_id] }
  end

  def validate_params(raw_params)
    recognized_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:id, :group_id, :group_name, :vpc_id],
      allowed_scalar_name: :group_id,
      allowed_scalar_type: String,
    )

    # id is an alias for group_id
    recognized_params[:group_id] = recognized_params.delete(:id) if recognized_params.key?(:id)

    if recognized_params.key?(:group_id) && recognized_params[:group_id] !~ /^sg\-[0-9a-f]{8}/
      raise ArgumentError, 'aws_security_group security group ID must be in the format "sg-" followed by 8 hexadecimal characters.'
    end

    if recognized_params.key?(:vpc_id) && recognized_params[:vpc_id] !~ /^vpc\-[0-9a-f]{8}/
      raise ArgumentError, 'aws_security_group VPC ID must be in the format "vpc-" followed by 8 hexadecimal characters.'
    end

    validated_params = recognized_params

    if validated_params.empty?
      raise ArgumentError, 'You must provide parameters to aws_security_group, such as group_name, group_id, or vpc_id.g_group.'
    end
    validated_params
  end

  def count_sg_rules(ip_permissions)
    rule_count = 0
    ip_permissions.each do |ip_permission|
      [:ip_ranges, :ipv_6_ranges, :user_id_group_pairs].each do |key|
        if ip_permission.key? key
          rule_count += ip_permission[key].length
        end
      end
    end
    rule_count
  end

  def fetch_from_api # rubocop: disable Metrics/AbcSize
    backend = BackendFactory.create(inspec_runner)

    # Transform into filter format expected by AWS
    filters = []
    [
      :description,
      :group_id,
      :group_name,
      :vpc_id,
    ].each do |criterion_name|
      instance_var = "@#{criterion_name}".to_sym
      next unless instance_variable_defined?(instance_var)
      val = instance_variable_get(instance_var)
      next if val.nil?
      filters.push(
        {
          name: criterion_name.to_s.tr('_', '-'),
          values: [val],
        },
      )
    end
    dsg_response = backend.describe_security_groups(filters: filters)

    if dsg_response.security_groups.empty?
      @exists = false
      @inbound_rules = []
      @outbound_rules = []
      return
    end

    @exists = true
    @description = dsg_response.security_groups[0].description
    @group_id   = dsg_response.security_groups[0].group_id
    @group_name = dsg_response.security_groups[0].group_name
    @vpc_id     = dsg_response.security_groups[0].vpc_id
    @inbound_rules = dsg_response.security_groups[0].ip_permissions.map(&:to_h)
    @inbound_rules_count = count_sg_rules(dsg_response.security_groups[0].ip_permissions.map(&:to_h))
    @outbound_rules = dsg_response.security_groups[0].ip_permissions_egress.map(&:to_h)
    @outbound_rules_count = count_sg_rules(dsg_response.security_groups[0].ip_permissions_egress.map(&:to_h))
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend self
      self.aws_client_class = Aws::EC2::Client

      def describe_security_groups(query)
        aws_service_client.describe_security_groups(query)
      end
    end
  end
end
