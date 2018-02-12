# author: Matthew Dromazos
class AwsS3BucketObject < Inspec.resource(1)
  name 'aws_s3_bucket_object'
  desc 'Verifies settings for a s3 bucket object'
  example "
    describe aws_s3_bucket_object(bucket_name: 'bucket_name', key: 'file_name') do
      it { should exist }
      it { should_not be_public }
    end
  "
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :bucket_name, :key

  def to_s
    "s3://#{@bucket_name}/#{@key}"
  end

  def object_acl
    # This is simple enough to inline it.
    @object_acl ||= BackendFactory.create(inspec_runner).get_object_acl(bucket: bucket_name, key: key).grants
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

    begin
      backend.get_object(bucket: bucket_name, key: key)
    rescue Aws::S3::Errors::NoSuchBucket
      @exists = false
      return
    rescue Aws::S3::Errors::NoSuchKey
      @exists = false
      return
    end

    @exists = true
  end

  # Uses the SDK API to really talk to AWS
  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::S3::Client

      def get_object(query)
        aws_service_client.get_object(query)
      end

      def get_object_acl(query)
        aws_service_client.get_object_acl(query)
      end
    end
  end
end
