class AwsKmsKey < Inspec.resource(1)
  name 'aws_kms_key'
  desc 'Verifies settings for an individual AWS KMS Key'
  example "
    describe aws_kms_key('arn:aws:kms:us-east-1::key/4321dcba-21io-23de-85he-ab0987654321') do
      it { should exist }
    end
  "

  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :key_id, :arn, :creation_date, :key_usage, :key_state, :description,
              :deletion_date, :valid_to, :external, :has_key_expiration, :has_aws_key_manager,
              :has_rotation_enabled, :enabled
  alias external? external
  alias enabled? enabled
  alias has_aws_key_manager? has_aws_key_manager
  alias has_key_expiration? has_key_expiration
  alias has_rotation_enabled? has_rotation_enabled

  def to_s
    "KMS Key #{@key_id}"
  end

  def created_days_ago
    ((Time.now - creation_date)/(24*60*60)).to_i unless creation_date.nil?
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:key_id],
      allowed_scalar_name: :key_id,
      allowed_scalar_type: String,
    )

    if validated_params.empty?
      raise ArgumentError, "You must provide the parameter 'key_id' to aws_kms_key."
    end

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)

    query = { key_id: @key_id }
    resp = backend.describe_key(query)

    @exists = !resp.empty?
    return unless @exists

    @key = resp.key_metadata.to_h
    @key_id = @key[:key_id]
    @arn = @key[:arn]
    @creation_date = @key[:creation_date]
    @enabled = @key[:enabled]
    @description = @key[:description]
    @key_usage = @key[:key_usage]
    @key_state = @key[:key_state]
    @deletion_date = @key[:deletion_date]
    @valid_to = @key[:valid_to]
    @external = @key[:origin] == 'EXTERNAL'
    @has_key_expiration = @key[:expiration_model] == 'KEY_MATERIAL_EXPIRES'
    @has_aws_key_manager = @key[:key_manager] == 'AWS'

    resp = backend.get_key_rotation_status(query)
    @has_rotation_enabled = resp.key_rotation_enabled unless resp.empty?
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::KMS::Client

      def describe_key(query)
        aws_service_client.describe_key(query)
      rescue Aws::KMS::Errors::NotFoundException
        return {}
      end

      def get_key_rotation_status(query)
        aws_service_client.get_key_rotation_status(query)
      rescue Aws::KMS::Errors::NotFoundException
        return {}
      end
    end
  end
end
