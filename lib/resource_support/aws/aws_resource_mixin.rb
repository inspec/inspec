module AwsResourceMixin
  def initialize(resource_params = {})
    Inspec.deprecate(:aws_resources_in_resource_pack,
                     "Resource '#{@__resource_name__ ||= self.class.to_s}'")
    validate_params(resource_params).each do |param, value|
      instance_variable_set(:"@#{param}", value)
    end
    catch_aws_errors do
      fetch_from_api
    end
  rescue ArgumentError => e
    # continue with ArgumentError if testing
    raise unless respond_to?(:inspec)
    raise Inspec::Exceptions::ResourceFailed, e.message
  end

  # Default implementation of validate params accepts everything.
  def validate_params(resource_params)
    resource_params
  end

  def check_resource_param_names(raw_params: {}, allowed_params: [], allowed_scalar_name: nil, allowed_scalar_type: nil)
    # Some resources allow passing in a single ID value.  Check and convert to hash if so.
    if allowed_scalar_name && !raw_params.is_a?(Hash)
      value_seen = raw_params
      if value_seen.is_a?(allowed_scalar_type)
        raw_params = { allowed_scalar_name => value_seen }
      else
        raise ArgumentError, "If you pass a single value to the resource, it must " \
                             "be a #{allowed_scalar_type}, not an #{value_seen.class}."
      end
    end

    # Remove all expected params from the raw param hash
    recognized_params = {}
    allowed_params.each do |expected_param|
      recognized_params[expected_param] = raw_params.delete(expected_param) if raw_params.key?(expected_param)
    end

    # Any leftovers are unwelcome
    unless raw_params.empty?
      raise ArgumentError, "Unrecognized resource param '#{raw_params.keys.first}'. Expected parameters: #{allowed_params.join(', ')}"
    end

    recognized_params
  end

  def inspec_runner
    # When running under inspec-cli, we have an 'inspec' method that
    # returns the runner. When running under unit tests, we don't
    # have that, but we still have to call this to pass something
    # (nil is OK) to the backend.
    # TODO: remove with https://github.com/chef/inspec-aws/issues/216
    inspec if respond_to?(:inspec)
  end

  # Intercept AWS exceptions
  def catch_aws_errors
    yield
  rescue Aws::Errors::MissingCredentialsError
    # The AWS error here is unhelpful:
    # "unable to sign request without credentials set"
    Inspec::Log.error "It appears that you have not set your AWS credentials.  You may set them using environment variables, or using the 'aws://region/aws_credentials_profile' target.  See https://www.inspec.io/docs/reference/platforms for details."
    fail_resource("No AWS credentials available")
  rescue Aws::Errors::ServiceError => e
    fail_resource e.message
  end
end
