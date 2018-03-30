class AwsFlowLog < Inspec.resource(1)
  name 'aws_flow_log'
  supports platform: 'aws'
  desc ''
  example ''

  include AwsSingularResourceMixin

  def to_s
    "AWS Flow Log #{@flow_log_id}"
  end

  attr_reader :log_group_name, :resource_id, :name

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
            'aws_flow_log requires a parameter: flow_log_id, subnet_id, vpc_id'
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
      @name = flow_log[:flow_log_id]
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
