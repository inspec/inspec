require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-rds'

class AwsRdsInstance < Inspec.resource(1)
  name 'aws_rds_instance'
  desc 'Verifies settings for an rds instance'
  example <<~EXAMPLE
    describe aws_rds_instance(db_instance_identifier: 'test-instance-id') do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :db_instance_identifier

  def to_s
    "RDS Instance #{@db_instance_identifier}"
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:db_instance_identifier],
      allowed_scalar_name: :db_instance_identifier,
      allowed_scalar_type: String,
    )
    if validated_params.empty? or !validated_params.key?(:db_instance_identifier)
      raise ArgumentError, 'You must provide an id for the aws_rds_instance.'
    end

    if validated_params.key?(:db_instance_identifier) && validated_params[:db_instance_identifier] !~ /^[a-z]{1}[0-9a-z\-]{0,62}$/
      raise ArgumentError, 'aws_rds_instance Database Instance ID must be in the format: start with a letter followed by up to 62 letters/numbers/hyphens.'
    end

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    dsg_response = nil
    catch_aws_errors do
      begin
        dsg_response = backend.describe_db_instances(db_instance_identifier: db_instance_identifier)
        @exists = true
      rescue Aws::RDS::Errors::DBInstanceNotFound
        @exists = false
        return
      end
    end

    if dsg_response.db_instances.empty?
      @exists = false
      return
    end

    @db_instance_identifier = dsg_response.db_instances[0].db_instance_identifier
  end

  # Uses the SDK API to really talk to AWS
  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::RDS::Client

      def describe_db_instances(query)
        aws_service_client.describe_db_instances(query)
      end
    end
  end
end
