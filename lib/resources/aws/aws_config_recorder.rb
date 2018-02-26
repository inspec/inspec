class AwsConfigurationRecorder < Inspec.resource(1)
  name 'aws_config_recorder'
  desc 'Verifies settings for AWS Configuration Recorder'
  example "
    describe aws_config_recorder('My_Recorder') do
      it { should exist }
      it { should be_recording }
      it { should be_all_supported }
      it { should have_include_global_resource_types }
    end
  "
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :role_arn, :resource_types, :recorder_name, :resp

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
    return unless @exists
    backend = BackendFactory.create(inspec_runner)
    catch_aws_errors do
      @resp = backend.describe_configuration_recorder_status(@query)
      @status = @resp.configuration_recorders_status.first.to_h
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

    # Must give it a recorder_name
    if validated_params[:recorder_name].nil?
      raise ArgumentError, 'You must provide recorder_name to aws_config_recorder'
    end

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @query = { configuration_recorder_names: [@recorder_name] }

    catch_aws_errors do
      begin
        @resp = backend.describe_configuration_recorders(@query)
      rescue Aws::ConfigService::Errors::NoSuchConfigurationRecorderException
        @exists = false
        return
      end
      @exists = !@resp.empty?
      return unless @exists

      @recorder = @resp.configuration_recorders.first.to_h
      @recorder_name = @recorder[:name]
      @role_arn = @recorder[:role_arn]
      @recording_all_resource_types = @recorder[:recording_group][:all_supported]
      @recording_all_global_types = @recorder[:recording_group][:include_global_resource_types]
      @resource_types = @recorder[:recording_group][:resource_types]
    end
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
