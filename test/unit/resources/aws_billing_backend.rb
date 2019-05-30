require 'resource_support/aws'

module MockAwsBillingReports
  class Empty < AwsBackendBase
    def describe_report_definitions(_query)
      Aws::CostandUsageReportService::Types::DescribeReportDefinitionsResponse.new(report_definitions: [])
    end
  end

  class Basic < AwsBackendBase
    def describe_report_definitions(_query)
      Aws::CostandUsageReportService::Types::DescribeReportDefinitionsResponse
        .new(report_definitions:
      [
        Aws::CostandUsageReportService::Types::ReportDefinition.new(
          report_name: 'inspec1',
          time_unit: 'HOURLY',
          format: 'textORcsv',
          compression: 'ZIP',
          s3_bucket: 'inspec1-s3-bucket',
          s3_prefix: 'inspec1/accounting',
          s3_region: 'us-east-1',
        ),
        Aws::CostandUsageReportService::Types::ReportDefinition.new(
          report_name: 'inspec2',
          time_unit: 'DAILY',
          format: 'textORcsv',
          compression: 'GZIP',
          s3_bucket: 'inspec2-s3-bucket',
          s3_prefix: 'inspec2/accounting',
          s3_region: 'us-west-1',
        ),
      ])
    end
  end

  # This backend will always repond with 5 reports, as if the `max_results` option was passed to
  # `#describe_report_definitions`. I chose 5 because when using `max_results` in the real world
  # it seems to only accept a value of 5.
  #
  # == Returns:
  # A Aws::CostandUsageReportService::Types::DescribeReportDefinitionsRespons object with two instance
  # properties:
  # `report_definitions` An Array that includes a single page of 5 Reports.
  # `next_token` A String set to the start of the next page. When `next_token` is nil, there are no more pages.
  #
  class Paginated < AwsBackendBase

    # Generate a set of report data, and shuffle their order.
    def generate_definitions
      definitions = []

      definitions << Aws::CostandUsageReportService::Types::ReportDefinition.new(
        report_name: 'inspec1',
        time_unit: 'HOURLY',
        format: 'textORcsv',
        compression: 'ZIP',
        s3_bucket: 'inspec1-s3-bucket',
        s3_prefix: 'inspec1/accounting',
        s3_region: 'us-east-1')
      definitions << Aws::CostandUsageReportService::Types::ReportDefinition.new(
        report_name: 'inspec2',
        time_unit: 'DAILY',
        format: 'textORcsv',
        compression: 'GZIP',
        s3_bucket: 'inspec2-s3-bucket',
        s3_prefix: 'inspec2/accounting',
        s3_region: 'us-west-1')

      (3..12).each do |i|
        definitions <<
        Aws::CostandUsageReportService::Types::ReportDefinition.new(
          report_name: "inspec#{i}",
          time_unit: %w{HOURLY DAILY}.sample,
          format: 'textORcsv',
          compression: %w{ZIP GZIP}.sample,
          s3_bucket: "inspec#{i}-s3-bucket",
          s3_prefix: "inspec#{i}",
          s3_region: 'us-east-1'
        )
      end

      definitions.shuffle
    end

    def describe_report_definitions(options = {})

      @definitions ||= generate_definitions

      starting_position = options.fetch(:next_token, 0)
      selected_definitions = @definitions.slice(starting_position, 5).compact
      next_token = starting_position + 5
      next_token = @definitions.count < next_token ? nil : next_token

      response = Aws::CostandUsageReportService::Types::DescribeReportDefinitionsResponse
      .new(report_definitions: selected_definitions)
      response.next_token = next_token
      response
    end
  end
end
