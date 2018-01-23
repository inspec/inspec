require '_aws'

# author: Matthew Dromazos
class AwsS3Bucket < Inspec.resource(1)
  name 'aws_s3_bucket'
  desc 'Verifies settings for a s3 bucket'
  example "
    describe aws_s3_bucket(bucket_name: 'test_bucket') do
      it { should exist }
    end
  "

  include AwsResourceMixin
  attr_reader :bucket_name, :region

  def to_s
    "S3 Bucket #{@bucket_name}"
  end

  def bucket_acl
    # This is simple enough to inline it.
    @bucket_acl ||= AwsS3Bucket::BackendFactory.create.get_bucket_acl(bucket: bucket_name).grants
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

  def fetch_from_aws
    backend = AwsS3Bucket::BackendFactory.create

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
    backend = AwsS3Bucket::BackendFactory.create

    begin
      # AWS SDK returns a StringIO, we have to read()
      raw_policy = backend.get_bucket_policy(bucket: bucket_name).policy
      return JSON.parse(raw_policy.read)['Statement'].map do |statement|
        lowercase_hash = {}
        statement.each_key { |k| lowercase_hash[k.downcase] = statement[k] }
        OpenStruct.new(lowercase_hash)
      end
    rescue Aws::S3::Errors::NoSuchBucketPolicy
      return []
    end
  end

  # Uses the SDK API to really talk to AWS
  class Backend
    class AwsClientApi
      BackendFactory.set_default_backend(self)

      def get_bucket_acl(query)
        AWSConnection.new.s3_client.get_bucket_acl(query)
      end

      def get_bucket_location(query)
        AWSConnection.new.s3_client.get_bucket_location(query)
      end

      def get_bucket_policy(query)
        AWSConnection.new.s3_client.get_bucket_policy(query)
      end
    end
  end
end
