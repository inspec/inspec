# author: Christoph Hartmann
class AwsEc2Instances < Inspec.resource(1)
  name 'aws_ec2_instances'
  desc 'Verifies settings for an EC2 instance'
  supports platform: 'aws'
  example "
    describe_ec2_instances.where { public_ip_address !=nil } do
      its('instance_id') { should eq [] }
    end
  "

  # TODO: rewrite to avoid direct injection, using AwsPluralResourceMixin
  def initialize(opts = {}, conn = nil)
    @opts = opts
    @ec2_client = conn ? conn.ec2_client : inspec_runner.backend.aws_client(Aws::EC2::Client)
  end

  # Set up some accessors and the filter table
  filter = FilterTable.create
  filter.add_accessor(:where).add_accessor(:entries)
  Aws::EC2::Types::Instance.members.each do |field|
    # Add a filter table field for each AWS instance property
    filter.add(field, field: field)
    # Add an accessors to access properties without the filter table
    define_method(field) do
      list.map(&:field)
    end
  end
  filter.connect(self, :list)

  # Give uses of `inspec shell` a few hints about what they can test
  def possible_properties
    Aws::EC2::Types::Instance.members
  end

  def inspec_runner
    inspec if respond_to?(:inspec)
  end

  def to_s
    'EC2 Instances'
  end

  # Calls self.class.list to gain access to 'class instance variables'
  def list
    self.class.list(@ec2_client)
  end

  def self.list(ec2_client)
    # Make sure we only call depaginate_api once
    @aws_ec2_instances_cache ||= depaginate_api(ec2_client)
  end

  # This call is expensive in network terms so we cache data across all
  # instances in a 'class instance variable' which prevents inheritance
  # problems and Rubocop complaints.
  def self.depaginate_api(ec2_client)
    @aws_ec2_instances_cache ||= []
    next_token = nil
    loop do
      api_result=ec2_client.describe_instances(
        next_token: next_token, max_results: 1000,
      )
      api_result.reservations.map(&:instances).each do |instance|
        @aws_ec2_instances_cache << instance.first
      end
      next_token = api_result.next_token
      break unless api_result.next_token
    end
    @aws_ec2_instances_cache
  end
end
