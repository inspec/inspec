require '_aws'

class AwsIamPolicy < Inspec.resource(1)
  name 'aws_iam_policy'
  desc 'Verifies settings for individual AWS IAM Policy'
  example "
    describe aws_iam_policy('AWSSupportAccess') do
      it { should be_attached }
    end
  "

  include AwsResourceMixin

  attr_reader :arn, :default_version_id, :attachment_count

  def to_s
    "Policy #{@policy_name}"
  end

  def attached?
    !attachment_count.zero?
  end

  def attached_users
    return @attached_users if defined? @attached_users
    fetch_attached_entities
    @attached_users
  end

  def attached_groups
    return @attached_groups if defined? @attached_groups
    fetch_attached_entities
    @attached_groups
  end

  def attached_roles
    return @attached_roles if defined? @attached_roles
    fetch_attached_entities
    @attached_roles
  end

  def attached_to_user?(user_name)
    attached_users.include?(user_name)
  end

  def attached_to_group?(group_name)
    attached_groups.include?(group_name)
  end

  def attached_to_role?(role_name)
    attached_roles.include?(role_name)
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:policy_name],
      allowed_scalar_name: :policy_name,
      allowed_scalar_type: String,
    )

    if validated_params.empty?
      raise ArgumentError, "You must provide the parameter 'policy_name' to aws_iam_policy."
    end

    validated_params
  end

  def fetch_from_aws
    backend = AwsIamPolicy::BackendFactory.create

    criteria = { max_items: 1000 } # maxItems max value is 1000
    resp = backend.list_policies(criteria)
    @policy = resp.policies.detect do |policy|
      policy.policy_name == @policy_name
    end

    @exists = !@policy.nil?

    return unless @exists
    @arn = @policy[:arn]
    @default_version_id = @policy[:default_version_id]
    @attachment_count = @policy[:attachment_count]
  end

  def fetch_attached_entities
    unless @exists
      @attached_groups = nil
      @attached_users  = nil
      @attached_roles  = nil
      return
    end
    backend = AwsIamPolicy::BackendFactory.create
    criteria = { policy_arn: arn }
    resp = backend.list_entities_for_policy(criteria)
    @attached_groups = resp.policy_groups.map(&:group_name)
    @attached_users  = resp.policy_users.map(&:user_name)
    @attached_roles  = resp.policy_roles.map(&:role_name)
  end

  class Backend
    class AwsClientApi
      BackendFactory.set_default_backend(self)

      def list_policies(criteria)
        AWSConnection.new.iam_client.list_policies(criteria)
      end

      def list_entities_for_policy(criteria)
        AWSConnection.new.iam_client.list_entities_for_policy(criteria)
      end
    end
  end
end
