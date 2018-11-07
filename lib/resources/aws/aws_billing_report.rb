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
    report = find_report(@report)
    @exists = !report.nil?
    if @exists
      @report_name = report.report_name
      @time_unit = report.time_unit.downcase
      @format = report.format
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

      def describe_report_definitions(options = {})
        aws_service_client.describe_report_definitions(options)
      end
    end
  end
end
