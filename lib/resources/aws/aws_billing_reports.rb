require 'utils/filter'

class AwsBillingReports < Inspec.resource(1)
  name 'aws_billing_reports'
  supports platform: 'aws'
  desc 'Verifies settings for AWS Cost and Billing Reports.'
  example "
      describe aws_billing_reports do
        its('report_name') { should include 'inspec1' }
        its('s3_bucket') { should include 'inspec1-s3-bucket' }
      end

     describe aws_billing_reports.where { report_name =~ /inspec.*/ } do
       its ('report_name') { should include ['inspec1'] }
       its ('time_unit') { should include ['DAILY'] }
       its ('s3_bucket') { should include ['inspec1-s3-bucket'] }
     end"

  include AwsPluralResourceMixin

  filtertable = FilterTable.create
  filtertable.add_accessor(:entries)
             .add_accessor(:where)
             .add(:exists?) { |x| !x.entries.empty? }
             .add(:report_name, field: :report_name)
             .add(:time_unit, field: :time_unit)
             .add(:format, field: :format)
             .add(:compression, field: :compression)
             .add(:s3_bucket, field: :s3_bucket)
             .add(:s3_prefix, field: :s3_prefix)
             .add(:s3_region, field: :s3_region)
             .add(:additional_artifacts, field: :additional_artifacts)
             .add(:additional_schema_elements, field: :additional_schema_elements)
  filtertable.connect(self, :table)

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
    backend = BackendFactory.create(inspec_runner)
    backend.describe_report_definitions.report_definitions.each do |r|
      @table << r.to_h
    end
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      AwsBillingReports::BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::CostandUsageReportService::Client

      def describe_report_definitions
        aws_service_client.describe_report_definitions
      end
    end
  end
end
