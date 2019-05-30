require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-ec2'

class AwsFlowLog < Inspec.resource(1)
  name 'aws_flow_log'
  supports platform: 'aws'
  desc 'This resource is used to test the attributes of a Flow Log.'
  example <<~EXAMPLE
    describe aws_flow_log('fl-9c718cf5') do
      it { should exist }
    end
  EXAMPLE

  include AwsSingularResourceMixin

  def to_s
    "AWS Flow Log #{id}"
  end

  def resource_type
    case @resource_id
    when /^eni/
      @resource_type = 'eni'
    when /^subnet/
      @resource_type = 'subnet'
    when /^vpc/
      @resource_type = 'vpc'
    end
  end

  def attached_to_eni?
    resource_type.eql?('eni') ? true : false
  end

  def attached_to_subnet?
    resource_type.eql?('subnet') ? true : false
  end

  def attached_to_vpc?
    resource_type.eql?('vpc') ? true : false
  end

  attr_reader :log_group_name, :resource_id, :flow_log_id

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:flow_log_id, :subnet_id, :vpc_id],
      allowed_scalar_name: :flow_log_id,
      allowed_scalar_type: String,
    )

    if validated_params.empty?
      raise ArgumentError,
            'aws_flow_log requires a parameter: flow_log_id, subnet_id, or vpc_id'
    end

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)

    resp = backend.describe_flow_logs(filter_args)
    flow_log = resp.to_h[:flow_logs].first
    @exists = !flow_log.nil?
    unless flow_log.nil?
      @log_group_name = flow_log[:log_group_name]
      @resource_id = flow_log[:resource_id]
      @flow_log_id = flow_log[:flow_log_id]
    end
  end

  def filter_args
    if @flow_log_id
      { filter: [{ name: 'flow-log-id', values: [@flow_log_id] }] }
    elsif @subnet_id || @vpc_id
      filter = @subnet_id || @vpc_id
      { filter: [{ name: 'resource-id', values: [filter] }] }
    end
  end

  def id
    return @flow_log_id if @flow_log_id
    return @subnet_id if @subnet_id
    return @vpc_id if @vpc_id
  end

  def backend
    BackendFactory.create(inspec_runner)
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      AwsFlowLog::BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::EC2::Client

      def describe_flow_logs(query)
        aws_service_client.describe_flow_logs(query)
      end
    end
  end
end
