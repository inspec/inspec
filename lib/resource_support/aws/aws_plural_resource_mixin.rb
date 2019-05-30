require 'resource_support/aws/aws_resource_mixin'
require 'resource_support/aws/aws_backend_factory_mixin'

module AwsPluralResourceMixin
  include AwsResourceMixin
  attr_reader :table

  # This sets up a class, AwsSomeResource::BackendFactory, that
  # provides a mechanism to create and use backends without
  # having to know which is selected.  This is mainly used for
  # unit testing.
  # TODO: DRY up.  This code exists in both the Singular and Plural mixins.
  # We'd like to put it in AwsResourceMixin, but included only sees the
  # directly-including class - we can't see second-order includers.
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
