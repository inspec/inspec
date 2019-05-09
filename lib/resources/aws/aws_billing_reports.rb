require 'inspec/utils/filter'

class AwsBillingReports < Inspec.resource(1)
  name 'aws_billing_reports'
  supports platform: 'aws'
  desc 'Verifies settings for AWS Cost and Billing Reports.'
  example <<~EXAMPLE
    describe aws_billing_reports do
      its('report_names') { should include 'inspec1' }
      its('s3_buckets') { should include 'inspec1-s3-bucket' }
    end

    describe aws_billing_reports.where { report_name =~ /inspec.*/ } do
      its ('report_names') { should include ['inspec1'] }
      its ('time_units') { should include ['DAILY'] }
      its ('s3_buckets') { should include ['inspec1-s3-bucket'] }
    end
  EXAMPLE

  include AwsPluralResourceMixin

  filtertable = FilterTable.create
  filtertable.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
             .register_column(:report_names, field: :report_name)
             .register_column(:time_units, field: :time_unit, style: :simple)
             .register_column(:formats, field: :format, style: :simple)
             .register_column(:compressions, field: :compression, style: :simple)
             .register_column(:s3_buckets, field: :s3_bucket, style: :simple)
             .register_column(:s3_prefixes, field: :s3_prefix, style: :simple)
             .register_column(:s3_regions, field: :s3_region, style: :simple)
  filtertable.install_filter_methods_on_resource(self, :table)

  def validate_params(resource_params)
    unless resource_params.empty?
      raise ArgumentError, 'aws_billing_reports does not accept resource parameters.'
    end
    resource_params
  end

  def to_s
    'AWS Billing Reports'
  end

  def fetch_from_api
    @table = []
    pagination_opts = {}
    backend = BackendFactory.create(inspec_runner)
    loop do
      api_result = backend.describe_report_definitions(pagination_opts)
      api_result.report_definitions.each do |raw_report|
        report = raw_report.to_h
        %i(time_unit compression).each { |field| report[field].downcase! }
        @table << report
      end
      pagination_opts = { next_token: api_result.next_token }
      break unless api_result.next_token
    end
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      AwsBillingReports::BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::CostandUsageReportService::Client

      def describe_report_definitions(options = {})
        aws_service_client.describe_report_definitions(options)
      end
    end
  end
end
