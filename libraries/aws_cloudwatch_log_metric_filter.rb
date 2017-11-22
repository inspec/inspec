require 'aws_conn'

class AwsCloudwatchLogMetricFilter < Inspec.resource(1)
  name 'aws_cloudwatch_log_metric_filter'
  desc 'Verifies individual Cloudwatch Log Metric Filters'
  example <<-EOX
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
EOX

  RESOURCE_PARAMS = [
    :filter_name,
    :log_group_name,
    :pattern,
  ].freeze

  attr_reader :filter_name, :log_group_name, :pattern, :metric_name, :metric_namespace

  def initialize(resource_params)
    validate_resource_params(resource_params).each do |param, value|
      instance_variable_set("@#{param}", value)
    end
    fetch
  end

  def exists?
    @exists
  end

  private

  def validate_resource_params(resource_params)
    unless resource_params.is_a? Hash
      raise(
        ArgumentError, \
        'Unrecognized format for aws_cloudwatch_log_metric_filter parameters ' \
        " - use (param: 'value') format ",
      )
    end
    resource_params.keys.each do |param_name|
      unless RESOURCE_PARAMS.include?(param_name) # rubocop:disable Style/Next
        raise(
          ArgumentError, \
          "Unrecognized parameter '#{param_name}' for aws_cloudwatch_log_metric_filter." \
          " Expected one of #{RESOURCE_PARAMS.join(', ')}.",
        )
      end
    end
    resource_params
  end

  def fetch
    # get a backend
    backend = AwsCloudwatchLogMetricFilter::Backend.create

    # Perform query with remote filtering
    aws_search_criteria = {}
    aws_search_criteria[:filter_name] = filter_name if filter_name
    aws_search_criteria[:log_group_name] = log_group_name if log_group_name
    aws_results = backend.describe_metric_filters(aws_search_criteria)

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
    #=====================================================#
    #                    API Definition
    #=====================================================#
    [
      :describe_metric_filters,
    ].each do |method|
      define_method(:method) do |*_args|
        raise "Unimplemented abstract method #{method} - internal error"
      end
    end

    #=====================================================#
    #                 Concrete Implementation
    #=====================================================#
    # Uses the cloudwatch API to really talk to AWS
    class AwsClientApi < Backend
      def describe_metric_filters(criteria)
        cwl_client = AWSConnection.new.cloudwatch_logs_client
        query = {}
        query[:filter_name_prefix] = criteria[:filter_name] if criteria[:filter_name]
        query[:log_group_name] = criteria[:log_group_name] if criteria[:log_group_name]
        # 'pattern' is not available as a remote filter,
        # we filter it after the fact locally
        # TODO: handle pagination?  Max 50/page.  Maybe you want a plural resource?
        aws_response = cwl_client.describe_metric_filters(query)
        aws_response.metric_filters
      end
    end

    #=====================================================#
    #                   Factory Interface
    #=====================================================#
    # TODO: move this to a mix-in
    DEFAULT_BACKEND = AwsClientApi
    @selected_backend = DEFAULT_BACKEND

    def self.create
      @selected_backend.new
    end

    def self.select(klass)
      @selected_backend = klass
    end

    def self.reset
      select(DEFAULT_BACKEND)
    end
  end
end
