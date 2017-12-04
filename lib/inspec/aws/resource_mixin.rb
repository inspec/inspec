module AwsResourceMixin
  def initialize(resource_params = {})
    validate_params(resource_params).each do |param, value|
      instance_variable_set(:"@#{param}", value)
    end
    fetch_from_aws
  end

  def check_resource_param_names(raw_params: {}, allowed_params: [], allowed_scalar_name: nil, allowed_scalar_type: nil)
    # Some resources allow passing in a single ID value.  Check and convert to hash if so.
    if allowed_scalar_name && !raw_params.is_a?(Hash)
      value_seen = raw_params
      if value_seen.is_a?(allowed_scalar_type)
        raw_params = { allowed_scalar_name => value_seen }
      else
        raise ArgumentError, 'If you pass a single value to the resource, it must ' \
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

  def exists?
    @exists
  end

  # This sets up a class, AwsSomeResource::BackendFactory, that
  # provides a mechanism to create and use backends without
  # having to know which is selected.  This is mainly used for
  # unit testing.
  def self.included(base)
    # Create a new class, whose body is simply to extend the
    # backend factory mixin
    resource_backend_factory_class = Class.new(Object) do
      extend AwsBackendFactoryMixin
    end
    # Name that class
    base.const_set('BackendFactory', resource_backend_factory_class)
  end
end
