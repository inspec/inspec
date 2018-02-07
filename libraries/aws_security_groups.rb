require '_aws'

class AwsEc2SecurityGroups < Inspec.resource(1)
  name 'aws_ec2_security_groups'
  desc 'Verifies settings for AWS Security Groups in bulk'
  example <<-EOX
    # Verify that you have security groups defined
    describe aws_ec2_security_groups do
      it { should exist }
    end

    # Verify you have more than the default security group
    describe aws_ec2_security_groups do
      its('entries.count') { should be > 1 }
    end
EOX

  # Constructor.  Args are reserved for row fetch filtering.
  def initialize(raw_criteria = {})
    validated_criteria = validate_filter_criteria(raw_criteria)
    fetch_from_backend(validated_criteria)
  end

  # Underlying FilterTable implementation.
  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
        .add(:group_ids, field: :group_id)
  filter.connect(self, :access_key_data)

  def access_key_data
    @table
  end

  def to_s
    'EC2 Security Groups'
  end

  private

  def validate_filter_criteria(raw_criteria)
    unless raw_criteria.is_a? Hash
      raise 'Unrecognized criteria for fetching Security Groups. ' \
            "Use 'criteria: value' format."
    end

    # No criteria yet
    recognized_criteria = check_criteria_names(raw_criteria)

    recognized_criteria
  end

  def check_criteria_names(raw_criteria: {}, allowed_criteria: [])
    # Remove all expected criteria from the raw criteria hash
    recognized_criteria = {}
    allowed_criteria.each do |expected_criterion|
      recognized_criteria[expected_criterion] = raw_criteria.delete(expected_criterion) if raw_criteria.key?(expected_criterion)
    end

    # Any leftovers are unwelcome
    unless raw_criteria.empty?
      raise ArgumentError, "Unrecognized filter criterion '#{raw_criteria.keys.first}'. Expected criteria: #{allowed_criteria.join(', ')}"
    end
    recognized_criteria
  end

  def fetch_from_backend(criteria)
    @table = []
    backend = AwsEc2SecurityGroups::BackendFactory.create
    # Note: should we ever implement server-side filtering
    # (and this is a very good resource for that),
    # we will need to reformat the criteria we are sending to AWS.
    backend.describe_security_groups(criteria).security_groups.each do |sg_info|
      @table.push({
                    group_id: sg_info.group_id,
        group_name: sg_info.group_name,
        vpc_id: sg_info.vpc_id,
                  })
    end
  end

  class BackendFactory
    extend AwsBackendFactoryMixin
  end

  class Backend
    class AwsClientApi < Backend
      AwsEc2SecurityGroups::BackendFactory.set_default_backend self

      def describe_security_groups(query)
        AWSConnection.new.ec2_client.describe_security_groups(query)
      end
    end
  end
end
