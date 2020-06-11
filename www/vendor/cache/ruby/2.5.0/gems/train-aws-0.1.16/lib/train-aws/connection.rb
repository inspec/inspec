# Connection definition file for an example Train plugin.

# Most of the work of a Train plugin happens in this file.
# Connections derive from Train::Plugins::Transport::BaseConnection,
# and provide a variety of services.  Later generations of the plugin
# API will likely separate out these responsibilities, but for now,
# some of the responsibilities include:
# * authentication to the target
# * platform / release /family detection
# * caching
# * API execution
# * marshalling to / from JSON
# You don't have to worry about most of this.

# Push platform detection out to a mixin, as it tends
# to develop at a different cadence than the rest
require_relative "platform"
require "train"
require "train/plugins"

require "aws-sdk-core"

require "aws-sdk-cloudtrail"
require "aws-sdk-cloudwatch"
require "aws-sdk-cloudwatchlogs"
require "aws-sdk-costandusagereportservice"
require "aws-sdk-configservice"
require "aws-sdk-ec2"
require "aws-sdk-ecs"
require "aws-sdk-eks"
require "aws-sdk-elasticloadbalancing"
require "aws-sdk-iam"
require "aws-sdk-kms"
require "aws-sdk-rds"
require "aws-sdk-s3"
require "aws-sdk-sqs"
require "aws-sdk-sns"

module TrainPlugins
  module Aws
    # You must inherit from BaseConnection.
    class Connection < Train::Plugins::Transport::BaseConnection
      # We've placed platform detection in a separate module; pull it in here.
      include TrainPlugins::Aws::Platform

      def initialize(options)
        # 'options' here is a hash, Symbol-keyed,
        # of what Train.target_config decided to do with the URI that it was
        # passed by `inspec -t` (or however the application gathered target information)
        # Some plugins might use this moment to capture credentials from the URI,
        # and the configure an underlying SDK accordingly.
        # You might also take a moment to manipulate the options.
        # Have a look at the Local, SSH, and AWS transports for ideas about what
        # you can do with the options.

        # Override for any cli options
        # aws://region/my-profile
        options[:region] = options[:host] || options[:region]
        if options[:path]
          # string the leading / from path
          options[:profile] = options[:path].sub(%r{^/}, "")
        end

        # Now let the BaseConnection have a chance to configure itself.
        super(options)

        # Force enable caching.
        enable_cache :api_call

        # Why are we doing this?
        # Why aren't we calling the AWS config system?
        ENV["AWS_PROFILE"] = @options[:profile] if @options[:profile]
        ENV["AWS_REGION"] = @options[:region] if @options[:region]
      end

      # We support caching on the aws_client call, but not the aws_resource call
      def aws_client(klass)
        return klass.new unless cache_enabled?(:api_call)

        @cache[:api_call][klass.to_s.to_sym] ||= klass.new
      end

      def aws_resource(klass, args)
        klass.new(args)
      end

      # TODO: determine exactly what this is used for
      def uri
        "aws://#{@options[:region]}"
      end

      def unique_identifier
        # use aws account id
        sts_client = aws_client(::Aws::STS::Client)
        sts_client.get_caller_identity.account
      end

    end
  end
end
