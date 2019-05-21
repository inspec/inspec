require 'resource_support/aws'

class AwsIamUser < Inspec.resource(1)
  name 'aws_iam_user'
  desc 'Verifies settings for AWS IAM user'
  example <<~EXAMPLE
    describe aws_iam_user(username: 'test_user') do
      it { should have_mfa_enabled }
      it { should_not have_console_password }
      it { should_not have_inline_user_policies }
      it { should_not have_attached_user_policies }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :access_keys, :attached_policy_names, :attached_policy_arns, \
              :has_console_password, :has_mfa_enabled, :inline_policy_names, :username
  alias has_mfa_enabled? has_mfa_enabled
  alias has_console_password? has_console_password

  def name
    Inspec.deprecate(:properties_aws_iam_user, 'The aws_iam_user `name` property is deprecated. Please use `username` instead')
    username
  end

  def to_s
    "IAM User #{username}"
  end

  def has_attached_policies?
    return nil unless exists?
    !attached_policy_names.empty?
  end

  def has_inline_policies?
    return nil unless exists?
    !inline_policy_names.empty?
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:username, :aws_user_struct, :name, :user],
      allowed_scalar_name: :username,
      allowed_scalar_type: String,
    )
    # If someone passed :name, rename it to :username
    if validated_params.key?(:name)
      Inspec.deprecate(:properties_aws_iam_user, 'The aws_iam_users `name` property is deprecated. Please use `username` instead')
      validated_params[:username] = validated_params.delete(:name)
    end

    # If someone passed :user, rename it to :aws_user_struct
    if validated_params.key?(:user)
      Inspec.deprecate(:properties_aws_iam_user, 'The aws_iam_users `user` property is deprecated. Please use `aws_user_struct` instead')
      validated_params[:aws_user_struct] = validated_params.delete(:user)
    end

    if validated_params.empty?
      raise ArgumentError, 'You must provide a username to aws_iam_user.'
    end
    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @aws_user_struct ||= nil # silence unitialized warning
    unless @aws_user_struct
      begin
        @aws_user_struct = backend.get_user(user_name: username)
      rescue Aws::IAM::Errors::NoSuchEntity
        @exists = false
        @access_keys = []
        @inline_policy_names = []
        @attached_policy_arns = []
        @attached_policy_names = []
        return
      end
    end
    # TODO: extract properties from aws_user_struct?

    @exists = true

    begin
      _login_profile = backend.get_login_profile(user_name: username)
      @has_console_password = true
      # Password age also available here
    rescue Aws::IAM::Errors::NoSuchEntity
      @has_console_password = false
    end

    mfa_info = backend.list_mfa_devices(user_name: username)
    @has_mfa_enabled = !mfa_info.mfa_devices.empty?

    # TODO: consider returning InSpec AwsIamAccessKey objects
    @access_keys = backend.list_access_keys(user_name: username).access_key_metadata
    # If the above call fails, we get nil here; but we promise access_keys will be an array.
    @access_keys ||= []

    @inline_policy_names = backend.list_user_policies(user_name: username).policy_names

    attached_policies = backend.list_attached_user_policies(user_name: username).attached_policies
    @attached_policy_arns = attached_policies.map { |p| p[:policy_arn] }
    @attached_policy_names = attached_policies.map { |p| p[:policy_name] }
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::IAM::Client

      def get_user(criteria)
        aws_service_client.get_user(criteria)
      end

      def get_login_profile(criteria)
        aws_service_client.get_login_profile(criteria)
      end

      def list_mfa_devices(criteria)
        aws_service_client.list_mfa_devices(criteria)
      end

      def list_access_keys(criteria)
        aws_service_client.list_access_keys(criteria)
      end

      def list_user_policies(criteria)
        aws_service_client.list_user_policies(criteria)
      end

      def list_attached_user_policies(criteria)
        aws_service_client.list_attached_user_policies(criteria)
      end
    end
  end
end
