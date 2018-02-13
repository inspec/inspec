# author: Viktor Yakovlyev
class AwsIamPasswordPolicy < Inspec.resource(1)
  name 'aws_iam_password_policy'
  desc 'Verifies iam password policy'

  example <<-EOX
    describe aws_iam_password_policy do
      its('requires_lowercase_characters?') { should be true }
    end

    describe aws_iam_password_policy do
      its('requires_uppercase_characters?') { should be true }
    end
EOX
  supports platform: 'aws'

  # TODO: rewrite to avoid direct injection, match other resources, use AwsSingularResourceMixin
  def initialize(conn = nil)
    catch_aws_errors do
      iam_resource = conn ? conn.iam_resource : inspec_runner.backend.aws_resource(Aws::IAM::Resource, {})
      @policy = iam_resource.account_password_policy
    end
  rescue Aws::IAM::Errors::NoSuchEntity
    @policy = nil
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

  def exists?
    !@policy.nil?
  end

  def requires_lowercase_characters?
    @policy.require_lowercase_characters
  end

  def requires_uppercase_characters?
    @policy.require_uppercase_characters
  end

  def minimum_password_length
    @policy.minimum_password_length
  end

  def requires_numbers?
    @policy.require_numbers
  end

  def requires_symbols?
    @policy.require_symbols
  end

  def allows_users_to_change_password?
    @policy.allow_users_to_change_password
  end

  def expires_passwords?
    @policy.expire_passwords
  end

  def max_password_age
    raise 'this policy does not expire passwords' unless expires_passwords?
    @policy.max_password_age
  end

  def prevents_password_reuse?
    !@policy.password_reuse_prevention.nil?
  end

  def number_of_passwords_to_remember
    raise 'this policy does not prevent password reuse' \
      unless prevents_password_reuse?
    @policy.password_reuse_prevention
  end

  def to_s
    'IAM Password-Policy'
  end
end
