# @author: Matthew Dromazos

require '_aws'

class AwsVpcSubnets < Inspec.resource(1)
  name 'aws_vpc_subnets'
  desc 'Verifies settings for VPC Subnets in bulk'
  example "
    # you should be able to test the cidr_block of a subnet
    describe aws_vpc_subnets.where(vpc_id: 'vpc-123456789') do
      its('subnet_ids') { should eq ['subnet-12345678', 'subnet-87654321'] }
      its('cidr_blocks') { should eq ['172.31.96.0/20'] }
      its('states') { should_not include 'pending' }
    end
  "

  def initialize
    backend = AwsVpcSubnets::BackendFactory.create
    @table = backend.describe_subnets.subnets.map(&:to_h)
  end

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
        .add(:vpc_ids, field: :vpc_id)
        .add(:subnet_ids, field: :subnet_id)
        .add(:cidr_blocks, field: :cidr_block)
        .add(:states, field: :state)
  filter.connect(self, :access_key_data)

  def access_key_data
    @table
  end

  def to_s
    'EC2 VPC Subnets'
  end

  class BackendFactory
    extend AwsBackendFactoryMixin
  end

  class Backend
    class AwsClientApi < Backend
      AwsVpcSubnets::BackendFactory.set_default_backend self

      def describe_subnets(query = {})
        AWSConnection.new.ec2_client.describe_subnets(query)
      end
    end
  end
end
