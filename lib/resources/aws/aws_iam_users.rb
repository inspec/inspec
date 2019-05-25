require 'resource_support/aws/aws_plural_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-iam'

class AwsIamUsers < Inspec.resource(1)
  name 'aws_iam_users'
  desc 'Verifies settings for AWS IAM users'
  example <<~EXAMPLE
    describe aws_iam_users.where(has_mfa_enabled?: false) do
      it { should_not exist }
    end
    describe aws_iam_users.where(has_console_password?: true) do
      it { should exist }
    end
    describe aws_iam_users.where(has_inline_policies?: true) do
      it { should_not exist }
    end
    describe aws_iam_users.where(has_attached_policies?: true) do
      it { should_not exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsPluralResourceMixin

  def self.lazy_get_login_profile(row, _criterion, table)
    backend = BackendFactory.create(table.resource.inspec_runner)
    begin
      _login_profile = backend.get_login_profile(user_name: row[:user_name])
      row[:has_console_password] = true
    rescue Aws::IAM::Errors::NoSuchEntity
      row[:has_console_password] = false
    end
    row[:has_console_password?] = row[:has_console_password]
  end

  def self.lazy_list_mfa_devices(row, _criterion, table)
    backend = BackendFactory.create(table.resource.inspec_runner)
    begin
      aws_mfa_devices = backend.list_mfa_devices(user_name: row[:user_name])
      row[:has_mfa_enabled] = !aws_mfa_devices.mfa_devices.empty?
    rescue Aws::IAM::Errors::NoSuchEntity
      row[:has_mfa_enabled] = false
    end
    row[:has_mfa_enabled?] = row[:has_mfa_enabled]
  end

  def self.lazy_list_user_policies(row, _criterion, table)
    backend = BackendFactory.create(table.resource.inspec_runner)
    row[:inline_policy_names] = backend.list_user_policies(user_name: row[:user_name]).policy_names
    row[:has_inline_policies] = !row[:inline_policy_names].empty?
    row[:has_inline_policies?] = row[:has_inline_policies]
  end

  def self.lazy_list_attached_policies(row, _criterion, table)
    backend = BackendFactory.create(table.resource.inspec_runner)
    attached_policies = backend.list_attached_user_policies(user_name: row[:user_name]).attached_policies
    row[:has_attached_policies] = !attached_policies.empty?
    row[:has_attached_policies?] = row[:has_attached_policies]
    row[:attached_policy_names] = attached_policies.map { |p| p[:policy_name] }
    row[:attached_policy_arns] = attached_policies.map { |p| p[:policy_arn] }
  end

  filter = FilterTable.create

  # These are included on the initial fetch
  filter.register_column(:usernames, field: :user_name)
        .register_column(:username) { |res| res.entries.map { |row| row[:user_name] } } # We should deprecate this; plural resources get plural properties
        .register_column(:password_ever_used?, field: :password_ever_used?)
        .register_column(:password_never_used?, field: :password_never_used?)
        .register_column(:password_last_used_days_ago, field: :password_last_used_days_ago)

  # Remaining properties / criteria are handled lazily, grouped by fetcher
  filter.register_column(:has_console_password?, field: :has_console_password?, lazy: method(:lazy_get_login_profile))
        .register_column(:has_console_password, field: :has_console_password, lazy: method(:lazy_get_login_profile))

  filter.register_column(:has_mfa_enabled?, field: :has_mfa_enabled?, lazy: method(:lazy_list_mfa_devices))
        .register_column(:has_mfa_enabled, field: :has_mfa_enabled, lazy: method(:lazy_list_mfa_devices))

  filter.register_column(:has_inline_policies?, field: :has_inline_policies?, lazy: method(:lazy_list_user_policies))
        .register_column(:has_inline_policies, field: :has_inline_policies, lazy: method(:lazy_list_user_policies))
        .register_column(:inline_policy_names, field: :inline_policy_names, style: :simple, lazy: method(:lazy_list_user_policies))

  filter.register_column(:has_attached_policies?, field: :has_attached_policies?, lazy: method(:lazy_list_attached_policies))
        .register_column(:has_attached_policies, field: :has_attached_policies, lazy: method(:lazy_list_attached_policies))
        .register_column(:attached_policy_names, field: :attached_policy_names, style: :simple, lazy: method(:lazy_list_attached_policies))
        .register_column(:attached_policy_arns, field: :attached_policy_arns, style: :simple, lazy: method(:lazy_list_attached_policies))
  filter.install_filter_methods_on_resource(self, :table)

  def validate_params(raw_params)
    # No params yet
    unless raw_params.empty?
      raise ArgumentError, 'aws_iam_users does not accept resource parameters'
    end
    raw_params
  end

  def fetch_from_api_paginated(backend)
    table = []
    page_marker = nil
    loop do
      api_result = backend.list_users(marker: page_marker)
      table += api_result.users.map(&:to_h)
      page_marker = api_result.marker
      break unless api_result.is_truncated
    end
    table
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    @table = fetch_from_api_paginated(backend)

    @table.each do |user|
      password_last_used = user[:password_last_used]
      user[:password_ever_used?] = !password_last_used.nil?
      user[:password_never_used?] = password_last_used.nil?
      if user[:password_ever_used?]
        user[:password_last_used_days_ago] = ((Time.now - password_last_used) / (24*60*60)).to_i
      end
    end
    @table
  end

  def to_s
    'IAM Users'
  end

  #===========================================================================#
  #                        Backend Implementation
  #===========================================================================#
  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::IAM::Client

      # TODO: delegate this out
      def list_users(query = {})
        aws_service_client.list_users(query)
      end

      def get_login_profile(query)
        aws_service_client.get_login_profile(query)
      end

      def list_mfa_devices(query)
        aws_service_client.list_mfa_devices(query)
      end

      def list_user_policies(query)
        aws_service_client.list_user_policies(query)
      end

      def list_attached_user_policies(query)
        aws_service_client.list_attached_user_policies(query)
      end
    end
  end
end
