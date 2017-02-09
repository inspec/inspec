# author: Christoph Hartmann

require 'aws_conn'

class Ec2 < Inspec.resource(1)
  name 'aws_ec2'
  desc 'Verifies settings for an EC2 instance'

  example "
    describe aws_ec2('i-123456') do
      it { should be_running }
    end

    describe aws_ec2(name: 'my-instance') do
      it { should be_running }
    end
  "

  def initialize(opts, conn = AWSConnection.new)
    @opts = opts
    @opts.is_a?(Hash) ? @display_name = @opts[:name] : @display_name = opts
    @ec2_client = conn.ec2_client
    @ec2_resource = conn.ec2_resource
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
    instance.exists?
  end

  # returns the instance state
  def state
    instance.state.name if instance
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
      instance.send(attribute)
    end
  end

  def security_groups
    @security_groups ||= instance.security_groups.map { |sg| { id: sg.group_id, name: sg.group_name } }
  end

  def tags
    @tags ||= instance.tags.map { |tag| { key: tag.key, value: tag.value } }
  end

  def to_s
    "EC2 Instance #{@display_name}"
  end

  private

  def instance
    @instance ||= @ec2_resource.instance(id)
  end
end
