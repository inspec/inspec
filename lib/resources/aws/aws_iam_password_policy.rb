require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-iam'

class AwsIamPasswordPolicy < Inspec.resource(1)
  name 'aws_iam_password_policy'
  desc 'Verifies iam password policy'

  example <<~EXAMPLE
    describe aws_iam_password_policy do
      its('requires_lowercase_characters?') { should be true }
    end

    describe aws_iam_password_policy do
      its('requires_uppercase_characters?') { should be true }
    end
  EXAMPLE
  supports platform: 'aws'

  # TODO: rewrite to avoid direct injection, match other resources, use AwsSingularResourceMixin
  def initialize(conn = nil)
    catch_aws_errors do
      begin
        if conn
          # We're in a mocked unit test.
          @policy = conn.iam_resource.account_password_policy
        else
          # Don't use the resource approach.  It's a CRUD operation
          # - if the policy does not exist, you get back a blank object to  populate and save.
          # Using the Client will throw an exception if no policy exists.
          @policy = inspec_runner.backend.aws_client(Aws::IAM::Client).get_account_password_policy.password_policy
        end
      rescue Aws::IAM::Errors::NoSuchEntity
        @policy = nil
      end
    end
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

  def to_s
    'IAM Password-Policy'
  end

  def exists?
    !@policy.nil?
  end

  #-------------------------- Properties ----------------------------#

  def minimum_password_length
    @policy.minimum_password_length
  end

  def max_password_age_in_days
    raise 'this policy does not expire passwords' unless expire_passwords?
    @policy.max_password_age
  end

  def number_of_passwords_to_remember
    raise 'this policy does not prevent password reuse' \
      unless prevent_password_reuse?
    @policy.password_reuse_prevention
  end

  #-------------------------- Matchers ----------------------------#
  [
    :require_lowercase_characters,
    :require_uppercase_characters,
    :require_symbols,
    :require_numbers,
    :expire_passwords,
  ].each do |matcher_stem|
    # Create our predicates (for example, 'require_symbols?')
    stem_with_question_mark = (matcher_stem.to_s + '?').to_sym
    define_method stem_with_question_mark do
      @policy.send(matcher_stem)
    end
    # RSpec will expose that as (for example) `be_require_symbols`.
    # To undo that, we have to make a matcher alias.
    stem_with_be = ('be_' + matcher_stem.to_s).to_sym
    RSpec::Matchers.alias_matcher matcher_stem, stem_with_be
  end

  # This one has an awkward name mapping
  def allow_users_to_change_passwords?
    @policy.allow_users_to_change_password
  end
  RSpec::Matchers.alias_matcher :allow_users_to_change_passwords, :be_allow_users_to_change_passwords

  # This one has custom logic and renaming
  def prevent_password_reuse?
    !@policy.password_reuse_prevention.nil?
  end
  RSpec::Matchers.alias_matcher :prevent_password_reuse, :be_prevent_password_reuse
end
