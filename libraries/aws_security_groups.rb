require '_aws'

class AwsSecurityGroups < Inspec.resource(1)
  name 'aws_security_groups'
  desc 'Verifies settings for AWS Security Groups in bulk'
  example <<-EOX
    # Verify that you have security groups defined
    describe aws_security_groups do
      it { should exist }
    end

    # Verify you have more than the default security group
    describe aws_security_groups do
      its('entries.count') { should be > 1 }
    end
EOX
  supports platform: 'aws'

  include AwsPluralResourceMixin

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
        .add(:group_ids, field: :group_id)
  filter.connect(self, :table)

  def to_s
    'EC2 Security Groups'
  end

  private

  def validate_params(raw_criteria)
    unless raw_criteria.is_a? Hash
      raise 'Unrecognized criteria for fetching Security Groups. ' \
            "Use 'criteria: value' format."
    end

    # No criteria yet
    unless raw_criteria.empty?
      raise ArgumentError, 'aws_ec2_security_groups does not currently accept resource parameters.'
    end
    raw_criteria
  end

  def fetch_from_api
    @table = []
    backend = BackendFactory.create(inspec_runner)
    backend.describe_security_groups({}).security_groups.each do |sg_info|
      @table.push({
                    group_id: sg_info.group_id,
        group_name: sg_info.group_name,
        vpc_id: sg_info.vpc_id,
                  })
    end
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend self
      self.aws_client_class = Aws::EC2::Client

      def describe_security_groups(query)
        aws_service_client.describe_security_groups(query)
      end
    end
  end
end
