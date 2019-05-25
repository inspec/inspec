require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'

require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-costandusagereportservice.rb'

class AwsBillingReport < Inspec.resource(1)
  name 'aws_billing_report'
  supports platform: 'aws'
  desc 'Verifies settings for AWS Cost and Billing Reports.'
  example <<~EXAMPLE
    describe aws_billing_report('inspec1') do
      its('report_name') { should cmp 'inspec1' }
      its('time_unit') { should cmp 'hourly' }
    end

    describe aws_billing_report(report: 'inspec1') do
      it { should exist }
    end
  EXAMPLE

  include AwsSingularResourceMixin

  attr_reader :report_name, :time_unit, :format, :compression, :s3_bucket,
              :s3_prefix, :s3_region

  def to_s
    "AWS Billing Report #{report_name}"
  end

  def hourly?
    exists? ? time_unit.eql?('hourly') : nil
  end

  def daily?
    exists? ? time_unit.eql?('daily') : nil
  end

  def zip?
    exists? ? compression.eql?('zip') : nil
  end

  def gzip?
    exists? ? compression.eql?('gzip') : nil
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:report_name],
      allowed_scalar_name: :report_name,
      allowed_scalar_type: String,
    )

    if validated_params.empty?
      raise ArgumentError, "You must provide the parameter 'report_name' to aws_billing_report."
    end

    validated_params
  end

  def fetch_from_api
    report = find_report(report_name)
    @exists = !report.nil?
    if exists?
      @time_unit = report.time_unit.downcase
      @format = report.format.downcase
      @compression = report.compression.downcase
      @s3_bucket = report.s3_bucket
      @s3_prefix = report.s3_prefix
      @s3_region = report.s3_region
    end
  end

  def find_report(report_name)
    pagination_opts = {}
    found_report_def = nil
    while found_report_def.nil?
      api_result = backend.describe_report_definitions(pagination_opts)
      next_token = api_result.next_token
      found_report_def = api_result.report_definitions.find { |report_def| report_def.report_name == report_name }
      pagination_opts = { next_token: next_token }

      next if found_report_def.nil? && next_token        # Loop again: didn't find it, but there are more results
      break if found_report_def.nil? && next_token.nil?  # Give up: didn't find it, no more results
    end
    found_report_def
  end

  def backend
    @backend ||= BackendFactory.create(inspec_runner)
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      AwsBillingReport::BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::CostandUsageReportService::Client

      def describe_report_definitions(query = {})
        aws_service_client.describe_report_definitions(query)
      end
    end
  end
end
