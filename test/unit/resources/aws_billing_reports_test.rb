require 'helper'

class ConstructorAwsBillingReportsTest < Minitest::Test
  def setup
    AwsBillingReports::BackendFactory.select(MockAwsBillingReports::Empty)
  end

  def test_empty_params_ok
    assert AwsBillingReports.new
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsBillingReports.new(unrecognized_param: 1) }
  end
end

class EmptyAwsBillingReportsTest < Minitest::Test
  def setup
    AwsBillingReports::BackendFactory.select(MockAwsBillingReports::Empty)
  end

  def test_search_miss_reports_empty
    refute AwsBillingReports.new.exists?
  end
end

class BasicAwsBillingReportsTest < Minitest::Test
  def setup
    AwsBillingReports::BackendFactory.select(MockAwsBillingReports::Basic)
  end

  def test_search_hit_via_empty_filter
    assert AwsBillingReports.new.exists?
  end

  def test_search_hit_properties
    assert AwsBillingReports.new.report_name.include?('inspec1')
  end

  def test_where_hit
    abr = AwsBillingReports.new.where { report_name =~ /inspec.*/ }
    assert_includes abr.compression, 'ZIP'
    assert_includes abr.s3_bucket, 'inspec-s3-bucket'
  end
end

module MockAwsBillingReports
  class Empty < AwsBackendBase
    def describe_report_definitions
      OpenStruct.new(report_definitions: [])
    end
  end

  class Basic < AwsBackendBase
    def describe_report_definitions
      OpenStruct.new(report_definitions: [
        Aws::CostandUsageReportService::Types::ReportDefinition.new(
          report_name: 'inspec1',
          time_unit: 'HOURLY',
          format: 'textORcsv',
          compression: 'ZIP',
          additional_schema_elements: ['RESOURCES'],
          s3_bucket: 'inspec-s3-bucket',
          s3_prefix: 'inspec1',
          s3_region: 'us-east-1',
          additional_artifacts: ['REDSHIFT'],
        ),
        Aws::CostandUsageReportService::Types::ReportDefinition.new(
          report_name: 'inspec2',
          time_unit: 'DAILY',
          format: 'textORcsv',
          compression: 'GZIP',
          additional_schema_elements: ['RESOURCES'],
          s3_bucket: 'inspec-s3-bucket',
          s3_prefix: 'inspec2',
          s3_region: 'us-west-1',
          additional_artifacts: ['QUICKSIGHT'],
        ),
      ])
    end
  end
end
