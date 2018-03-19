class AwsBillingReport < Inspec.resource(1)
  name 'aws_billing_report'
  supports platform: 'aws'
  desc 'Verifies settings for AWS Cost and Billing Reports.'
  example "
    describe aws_billing_report('inspec1') do
      its('report_name') { should cmp 'inspec1' }
      its('time_unit') { should cmp 'hourly' }
    end

    describe aws_billing_report(report: 'inspec1') do
      it { should exist }
    end"

  include AwsSingularResourceMixin

  attr_reader :report_name, :time_unit, :format, :compression, :s3_bucket,
              :s3_prefix, :s3_region

  def to_s
    "AWS Billing Report #{@report}"
  end

  def hourly?
    @time_unit.eql?('hourly')
  end

  def daily?
    @time_unit.eql?('daily')
  end

  def zip?
    @compression.eql?('zip')
  end

  def gzip?
    @compression.eql?('gzip')
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:report],
      allowed_scalar_name: :report,
      allowed_scalar_type: String,
    )

    if validated_params.empty?
      raise ArgumentError, "You must provide the parameter 'report' to aws_billing_report."
    end

    validated_params
  end

  def fetch_from_api
    r = report
    @exists = !r.nil?
    unless r.nil?
      @report_name = r.report_name
      @time_unit = r.time_unit.downcase
      @format = r.format
      @compression = r.compression.downcase
      @s3_bucket = r.s3_bucket
      @s3_prefix = r.s3_prefix
      @s3_region = r.s3_region
    end
  end

  def report
    definitions = backend.describe_report_definitions.report_definitions
    definitions.detect { |r| r.report_name.eql?(@report) }
  end

  def backend
    BackendFactory.create(inspec_runner)
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      AwsBillingReport::BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::CostandUsageReportService::Client

      def describe_report_definitions
        aws_service_client.describe_report_definitions
      end
    end
  end
end
