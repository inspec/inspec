require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-s3'

class AwsS3Bucket < Inspec.resource(1)
  name 'aws_s3_bucket'
  desc 'Verifies settings for a s3 bucket'
  example <<~EXAMPLE
    describe aws_s3_bucket(bucket_name: 'test_bucket') do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :bucket_name, :has_default_encryption_enabled, :has_access_logging_enabled, :region

  def to_s
    "S3 Bucket #{@bucket_name}"
  end

  def bucket_acl
    catch_aws_errors do
      @bucket_acl ||= BackendFactory.create(inspec_runner).get_bucket_acl(bucket: bucket_name).grants
    end
  end

  def bucket_policy
    @bucket_policy ||= fetch_bucket_policy
  end

  # RSpec will alias this to be_public
  def public?
    # first line just for formatting
    false || \
      bucket_acl.any? { |g| g.grantee.type == 'Group' && g.grantee.uri =~ /AllUsers/ } || \
      bucket_acl.any? { |g| g.grantee.type == 'Group' && g.grantee.uri =~ /AuthenticatedUsers/ } || \
      bucket_policy.any? { |s| s.effect == 'Allow' && s.principal == '*' }
  end

  def has_default_encryption_enabled?
    return false unless @exists
    @has_default_encryption_enabled ||= fetch_bucket_encryption_configuration
  end

  def has_access_logging_enabled?
    return false unless @exists
    catch_aws_errors do
      @has_access_logging_enabled ||= !BackendFactory.create(inspec_runner).get_bucket_logging(bucket: bucket_name).logging_enabled.nil?
    end
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:bucket_name],
      allowed_scalar_name: :bucket_name,
      allowed_scalar_type: String,
    )
    if validated_params.empty? or !validated_params.key?(:bucket_name)
      raise ArgumentError, 'You must provide a bucket_name to aws_s3_bucket.'
    end

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)

    # Since there is no basic "get_bucket" API call, use the
    # region fetch as the existence check.
    begin
      @region = backend.get_bucket_location(bucket: bucket_name).location_constraint
    rescue Aws::S3::Errors::NoSuchBucket
      @exists = false
      return
    end
    @exists = true
  end

  def fetch_bucket_policy
    backend = BackendFactory.create(inspec_runner)
    catch_aws_errors do
      begin
        # AWS SDK returns a StringIO, we have to read()
        raw_policy = backend.get_bucket_policy(bucket: bucket_name).policy
        return JSON.parse(raw_policy.read)['Statement'].map do |statement|
          lowercase_hash = {}
          statement.each_key { |k| lowercase_hash[k.downcase] = statement[k] }
          @bucket_policy = OpenStruct.new(lowercase_hash)
        end
      rescue Aws::S3::Errors::NoSuchBucketPolicy
        @bucket_policy = []
      end
    end
  end

  def fetch_bucket_encryption_configuration
    @has_default_encryption_enabled ||= catch_aws_errors do
      begin
        !BackendFactory.create(inspec_runner)
                       .get_bucket_encryption(bucket: bucket_name)
                       .server_side_encryption_configuration
                       .nil?
      rescue Aws::S3::Errors::ServerSideEncryptionConfigurationNotFoundError
        false
      end
    end
  end

  # Uses the SDK API to really talk to AWS
  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::S3::Client

      def get_bucket_acl(query)
        aws_service_client.get_bucket_acl(query)
      end

      def get_bucket_location(query)
        aws_service_client.get_bucket_location(query)
      end

      def get_bucket_policy(query)
        aws_service_client.get_bucket_policy(query)
      end

      def get_bucket_logging(query)
        aws_service_client.get_bucket_logging(query)
      end

      def get_bucket_encryption(query)
        aws_service_client.get_bucket_encryption(query)
      end
    end
  end
end
