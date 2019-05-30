require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-configservice'

class AwsConfigurationRecorder < Inspec.resource(1)
  name 'aws_config_recorder'
  desc 'Verifies settings for AWS Configuration Recorder'
  example <<~EXAMPLE
    describe aws_config_recorder('My_Recorder') do
      it { should exist }
      it { should be_recording }
      it { should be_all_supported }
      it { should have_include_global_resource_types }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :role_arn, :resource_types, :recorder_name

  def to_s
    "Configuration_Recorder: #{@recorder_name}"
  end

  def recording_all_resource_types?
    @recording_all_resource_types
  end

  def recording_all_global_types?
    @recording_all_global_types
  end

  def status
    return {} unless @exists
    backend = BackendFactory.create(inspec_runner)
    catch_aws_errors do
      response = backend.describe_configuration_recorder_status(configuration_recorder_names: [@recorder_name])
      @status = response.configuration_recorders_status.first.to_h
    end
  end

  def recording?
    return unless @exists
    status[:recording]
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:recorder_name],
      allowed_scalar_name: :recorder_name,
      allowed_scalar_type: String,
    )

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    query = @recorder_name ? { configuration_recorder_names: [@recorder_name] } : {}
    response = backend.describe_configuration_recorders(query)

    @exists = !response.configuration_recorders.empty?
    return unless exists?

    if response.configuration_recorders.count > 1
      raise ArgumentError, 'Internal error: unexpectedly received multiple AWS Config Recorder objects from API; expected to be singleton per-region.  Please file a bug report at https://github.com/chef/inspec/issues .'
    end

    recorder = response.configuration_recorders.first.to_h
    @recorder_name = recorder[:name]
    @role_arn = recorder[:role_arn]
    @recording_all_resource_types = recorder[:recording_group][:all_supported]
    @recording_all_global_types = recorder[:recording_group][:include_global_resource_types]
    @resource_types = recorder[:recording_group][:resource_types]
  rescue Aws::ConfigService::Errors::NoSuchConfigurationRecorderException
    @exists = false
    return
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::ConfigService::Client

      def describe_configuration_recorders(query)
        aws_service_client.describe_configuration_recorders(query)
      end

      def describe_configuration_recorder_status(query)
        aws_service_client.describe_configuration_recorder_status(query)
      end
    end
  end
end
