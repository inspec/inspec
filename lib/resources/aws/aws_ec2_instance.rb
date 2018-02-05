require '_aws'

# author: Christoph Hartmann
class AwsEc2Instance < Inspec.resource(1)
  name 'aws_ec2_instance'
  desc 'Verifies settings for an EC2 instance'

  example <<-EOX
    describe aws_ec2_instance('i-123456') do
      it { should be_running }
      it { should have_roles }
    end

    describe aws_ec2_instance(name: 'my-instance') do
      it { should be_running }
      it { should have_roles }
    end
EOX
  supports platform: 'aws'

  # TODO: rewrite to avoid direct injection, match other resources, use AwsSingularResourceMixin
  def initialize(opts, conn = nil)
    @opts = opts
    @opts.is_a?(Hash) ? @display_name = @opts[:name] : @display_name = opts
    @ec2_client = conn ? conn.ec2_client : inspec_runner.backend.aws_client(Aws::EC2::Client)
    @ec2_resource = conn ? conn.ec2_resource : inspec_runner.backend.aws_resource(Aws::EC2::Resource, {})
    @iam_resource = conn ? conn.iam_resource : inspec_runner.backend.aws_resource(Aws::IAM::Resource, {})
  end

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
  alias instance_id id

  def exists?
    return false if instance.nil?
    instance.exists?
  end

  # returns the instance state
  def state
    instance&.state&.name
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
      instance.send(attribute) if instance
    end
  end

  def security_groups
    @security_groups ||= instance.security_groups.map { |sg|
      { id: sg.group_id, name: sg.group_name }
    }
  end

  def tags
    @tags ||= instance.tags.map { |tag| { key: tag.key, value: tag.value } }
  end

  def to_s
    "EC2 Instance #{@display_name}"
  end

  def has_roles?
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

  private

  def instance
    @instance ||= @ec2_resource.instance(id)
  end
end

# Deprecated
class AwsEc2 < AwsEc2Instance
  name 'aws_ec2'

  def initialize(opts, conn = nil)
    deprecated
    super(opts, conn)
  end

  def deprecated
    warn '[DEPRECATION] `aws_ec2(parameter)` is deprecated. ' \
         'Please use `aws_ec2_instance(parameter)` instead.'
  end
end
