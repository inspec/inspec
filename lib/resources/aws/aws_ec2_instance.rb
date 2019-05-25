require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-ec2'

class AwsEc2Instance < Inspec.resource(1)
  name 'aws_ec2_instance'
  desc 'Verifies settings for an EC2 instance'

  example <<~EXAMPLE
    describe aws_ec2_instance('i-123456') do
      it { should be_running }
      it { should have_roles }
    end

    describe aws_ec2_instance(name: 'my-instance') do
      it { should be_running }
      it { should have_roles }
    end
  EXAMPLE
  supports platform: 'aws'

  # TODO: rewrite to avoid direct injection, match other resources, use AwsSingularResourceMixin
  def initialize(opts, conn = nil)
    @opts = opts
    @opts.is_a?(Hash) ? @display_name = @opts[:name] : @display_name = opts
    @ec2_client = conn ? conn.ec2_client : inspec_runner.backend.aws_client(Aws::EC2::Client)
    @ec2_resource = conn ? conn.ec2_resource : inspec_runner.backend.aws_resource(Aws::EC2::Resource, {})
    @iam_resource = conn ? conn.iam_resource : inspec_runner.backend.aws_resource(Aws::IAM::Resource, {})
  end

  # TODO: DRY up, see https://github.com/chef/inspec/issues/2633
  # Copied from resource_support/aws/aws_resource_mixin.rb
  def catch_aws_errors
    yield
  rescue Aws::Errors::MissingCredentialsError
    # The AWS error here is unhelpful:
    # "unable to sign request without credentials set"
    Inspec::Log.error "It appears that you have not set your AWS credentials.  You may set them using environment variables, or using the 'aws://region/aws_credentials_profile' target.  See https://www.inspec.io/docs/reference/platforms for details."
    fail_resource('No AWS credentials available')
  rescue Aws::Errors::ServiceError => e
    fail_resource e.message
  end

  # TODO: DRY up, see https://github.com/chef/inspec/issues/2633
  # Copied from resource_support/aws/aws_singular_resource_mixin.rb
  def inspec_runner
    # When running under inspec-cli, we have an 'inspec' method that
    # returns the runner. When running under unit tests, we don't
    # have that, but we still have to call this to pass something
    # (nil is OK) to the backend.
    # TODO: remove with https://github.com/chef/inspec-aws/issues/216
    # TODO: remove after rewrite to include AwsSingularResource
    inspec if respond_to?(:inspec)
  end

  def id
    return @instance_id if defined?(@instance_id)
    catch_aws_errors do
      if @opts.is_a?(Hash)
        first = @ec2_resource.instances(
          {
            filters: [{
              name: 'tag:Name',
              values: [@opts[:name]],
            }],
          },
        ).first
        # catch case where the instance is not known
        @instance_id = first.id unless first.nil?
      else
        @instance_id = @opts
      end
    end
  end
  alias instance_id id

  def exists?
    return false if instance.nil?
    instance.exists?
  end

  # returns the instance state
  def state
    catch_aws_errors do
      instance&.state&.name
    end
  end

  # helper methods for each state
  %w{
    pending running shutting-down
    terminated stopping stopped unknown
  }.each do |state_name|
    define_method state_name.tr('-', '_') + '?' do
      state == state_name
    end
  end

  # attributes that we want to expose
  %w{
    public_ip_address private_ip_address key_name private_dns_name
    public_dns_name subnet_id architecture root_device_type
    root_device_name virtualization_type client_token launch_time
    instance_type image_id vpc_id
  }.each do |attribute|
    define_method attribute do
      catch_aws_errors do
        instance.send(attribute) if instance
      end
    end
  end

  # Don't document this - it's a bit hard to use.  Our current doctrine
  # is to use dumb things, like arrays of strings - use security_group_ids instead.
  def security_groups
    catch_aws_errors do
      @security_groups ||= instance.security_groups.map { |sg|
        { id: sg.group_id, name: sg.group_name }
      }
    end
  end

  def security_group_ids
    catch_aws_errors do
      @security_group_ids ||= instance.security_groups.map(&:group_id)
    end
  end

  def tags
    catch_aws_errors do
      @tags ||= instance.tags.map { |tag| { key: tag.key, value: tag.value } }
    end
  end

  def to_s
    "EC2 Instance #{@display_name}"
  end

  def has_roles?
    catch_aws_errors do
      instance_profile = instance.iam_instance_profile

      if instance_profile
        roles = @iam_resource.instance_profile(
          instance_profile.arn.gsub(%r{^.*\/}, ''),
        ).roles
      else
        roles = nil
      end

      roles && !roles.empty?
    end
  end

  private

  def instance
    catch_aws_errors { @instance ||= @ec2_resource.instance(id) }
  end
end
