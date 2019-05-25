require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-s3'

class AwsS3BucketObject < Inspec.resource(1)
  name 'aws_s3_bucket_object'
  desc 'Verifies settings for a s3 bucket object'
  example <<~EXAMPLE
    describe aws_s3_bucket_object(bucket_name: 'bucket_name', key: 'file_name') do
      it { should exist }
      it { should_not be_public }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :bucket_name, :key

  def to_s
    # keep the format that aws uses.
    "s3://#{@bucket_name}/#{@key}"
  end

  def object_acl
    return @object_acl if defined? @object_acl
    catch_aws_errors do
      @object_acl = BackendFactory.create(inspec_runner).get_object_acl(bucket: bucket_name, key: key).grants
    end
    @object_acl
  end

  # RSpec will alias this to be_public
  def public?
    # first line just for formatting
    false || \
      object_acl.any? { |g| g.grantee.type == 'Group' && g.grantee.uri =~ /AllUsers/ } || \
      object_acl.any? { |g| g.grantee.type == 'Group' && g.grantee.uri =~ /AuthenticatedUsers/ }
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:bucket_name, :key, :id],
    )
    if validated_params.empty? or !validated_params.key?(:bucket_name) or !validated_params.key?(:key)
      raise ArgumentError, 'You must provide a bucket_name and key to aws_s3_bucket_object.'
    end
    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    catch_aws_errors do
      begin
        # Just use get_object to detect if the bucket exists
        backend.get_object(bucket: bucket_name, key: key)
      rescue Aws::S3::Errors::NoSuchBucket
        @exists = false
        return
      rescue Aws::S3::Errors::NoSuchKey
        @exists = false
        return
      end
    end
    @exists = true
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::S3::Client

      # Used to detect if object exists
      def get_object(query)
        aws_service_client.get_object(query)
      end

      def get_object_acl(query)
        aws_service_client.get_object_acl(query)
      end
    end
  end
end
