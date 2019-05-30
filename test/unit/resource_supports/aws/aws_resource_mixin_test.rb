# copyright: 2017, Chef Software Inc.

require 'helper'

require 'resource_support/aws'
require 'resource_support/aws/aws_resource_mixin'

describe 'AwsResourceMixin' do
  describe 'initialize' do
    class AwsResourceMixinError
      include AwsResourceMixin
      def validate_params(_resource_params)
        raise ArgumentError, 'this param is not right'
      end
    end

    it 'confirm ArgumentError is raised when testing' do
      proc {
        mixin = AwsResourceMixinError.new({})
      }.must_raise ArgumentError
    end

    class AwsResourceMixinLive
      include AwsResourceMixin
      def validate_params(_resource_params)
        raise ArgumentError, 'this param is not right'
      end

      # if inspec is defined we are a live test
      def inspec
        # live
      end
    end

    it 'confirm ResourceFailed is raised when live' do
      proc {
        mixin = AwsResourceMixinLive.new({})
      }.must_raise Inspec::Exceptions::ResourceFailed
    end
  end
end
