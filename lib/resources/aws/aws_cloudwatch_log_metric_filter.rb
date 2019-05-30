require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-cloudwatchlogs'

class AwsCloudwatchLogMetricFilter < Inspec.resource(1)
  name 'aws_cloudwatch_log_metric_filter'
  desc 'Verifies individual Cloudwatch Log Metric Filters'
  example <<~EXAMPLE
    # Look for a LMF by its filter name and log group name.  This combination
    # will always either find at most one LMF - no duplicates.
    describe aws_cloudwatch_log_metric_filter(
      filter_name: 'my-filter',
      log_group_name: 'my-log-group'
    ) do
      it { should exist }
    end

    # Search for an LMF by pattern and log group.
    # This could result in an error if the results are not unique.
    describe aws_cloudwatch_log_metric_filter(
      log_group_name:  'my-log-group',
      pattern: 'my-filter'
    ) do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'
  include AwsSingularResourceMixin
  attr_reader :filter_name, :log_group_name, :metric_name, :metric_namespace, :pattern

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:filter_name, :log_group_name, :pattern],
    )
    if validated_params.empty?
      raise ArgumentError, 'You must provide either filter_name, log_group, or pattern to aws_cloudwatch_log_metric_filter.'
    end
    validated_params
  end

  def fetch_from_api
    # get a backend
    backend = BackendFactory.create(inspec_runner)

    # Perform query with remote filtering
    aws_search_criteria = {}
    aws_search_criteria[:filter_name] = filter_name if filter_name
    aws_search_criteria[:log_group_name] = log_group_name if log_group_name
    begin
      aws_results = backend.describe_metric_filters(aws_search_criteria)
    rescue Aws::CloudWatchLogs::Errors::ResourceNotFoundException
      @exists = false
      return
    end

    # Then perform local filtering
    if pattern
      aws_results.select! { |lmf| lmf.filter_pattern == pattern }
    end

    # Check result count.  We're a singular resource and can tolerate
    # 0 or 1 results, not multiple.
    if aws_results.count > 1
      raise 'More than one result was returned, but aws_cloudwatch_log_metric_filter '\
            'can only handle a single AWS resource.  Consider passing more resource '\
            'parameters to narrow down the search.'
    elsif aws_results.empty?
      @exists = false
    else
      @exists = true
      # Unpack the funny-shaped object we got back from AWS into our instance vars
      lmf = aws_results.first
      @filter_name = lmf.filter_name
      @log_group_name = lmf.log_group_name
      @pattern = lmf.filter_pattern # Note inconsistent name
      # AWS SDK returns an array of metric transformations
      # but only allows one (mandatory) entry, let's flatten that
      @metric_name = lmf.metric_transformations.first.metric_name
      @metric_namespace = lmf.metric_transformations.first.metric_namespace
    end
  end

  class Backend
    # Uses the cloudwatch API to really talk to AWS
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::CloudWatchLogs::Client

      def describe_metric_filters(criteria)
        query = {}
        query[:filter_name_prefix] = criteria[:filter_name] if criteria[:filter_name]
        query[:log_group_name] = criteria[:log_group_name] if criteria[:log_group_name]
        # 'pattern' is not available as a remote filter,
        # we filter it after the fact locally
        # TODO: handle pagination?  Max 50/page.  Maybe you want a plural resource?
        aws_response = aws_service_client.describe_metric_filters(query)
        aws_response.metric_filters
      end
    end
  end
end
