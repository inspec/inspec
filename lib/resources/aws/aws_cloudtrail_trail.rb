require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-cloudtrail'

class AwsCloudTrailTrail < Inspec.resource(1)
  name 'aws_cloudtrail_trail'
  desc 'Verifies settings for an individual AWS CloudTrail Trail'
  example <<~EXAMPLE
    describe aws_cloudtrail_trail('trail-name') do
      it { should exist }
    end
  EXAMPLE

  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :cloud_watch_logs_log_group_arn, :cloud_watch_logs_role_arn, :home_region,
              :kms_key_id, :s3_bucket_name, :trail_arn

  def to_s
    "CloudTrail #{@trail_name}"
  end

  def multi_region_trail?
    @is_multi_region_trail
  end

  def log_file_validation_enabled?
    @log_file_validation_enabled
  end

  def encrypted?
    !kms_key_id.nil?
  end

  def delivered_logs_days_ago
    query = { name: @trail_name }
    catch_aws_errors do
      begin
        resp = BackendFactory.create(inspec_runner).get_trail_status(query).to_h
        ((Time.now - resp[:latest_cloud_watch_logs_delivery_time])/(24*60*60)).to_i unless resp[:latest_cloud_watch_logs_delivery_time].nil?
      rescue Aws::CloudTrail::Errors::TrailNotFoundException
        nil
      end
    end
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:trail_name],
      allowed_scalar_name: :trail_name,
      allowed_scalar_type: String,
    )

    if validated_params.empty?
      raise ArgumentError, "You must provide the parameter 'trail_name' to aws_cloudtrail_trail."
    end

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)

    query = { trail_name_list: [@trail_name] }
    resp = backend.describe_trails(query)

    @trail = resp.trail_list[0].to_h
    @exists = !@trail.empty?
    @s3_bucket_name = @trail[:s3_bucket_name]
    @is_multi_region_trail = @trail[:is_multi_region_trail]
    @trail_arn = @trail[:trail_arn]
    @log_file_validation_enabled = @trail[:log_file_validation_enabled]
    @cloud_watch_logs_role_arn = @trail[:cloud_watch_logs_role_arn]
    @cloud_watch_logs_log_group_arn = @trail[:cloud_watch_logs_log_group_arn]
    @kms_key_id = @trail[:kms_key_id]
    @home_region = @trail[:home_region]
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      AwsCloudTrailTrail::BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::CloudTrail::Client

      def describe_trails(query)
        aws_service_client.describe_trails(query)
      end

      def get_trail_status(query)
        aws_service_client.get_trail_status(query)
      end
    end
  end
end
