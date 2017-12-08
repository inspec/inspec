# author: Alex Bedley
# author: Steffanie Freeman
# author: Simon Varlow
# author: Chris Redekop
class AwsIamUsers < Inspec.resource(1)
  name 'aws_iam_users'
  desc 'Verifies settings for AWS IAM users'
  example '
    describe aws_iam_users.where(has_mfa_enabled?: false) do
      it { should_not exist }
    end

    describe aws_iam_users.where(has_console_password?: true) do
      it { should exist }
    end
  '

  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add(:exists?) { |x| !x.entries.empty? }
        .add(:has_mfa_enabled?, field: :has_mfa_enabled)
        .add(:has_console_password?, field: :has_console_password)
        .add(:username, field: :user_name)
  filter.connect(self, :collect_user_details)

  # No resource params => no overridden constructor
  # AWS API only offers filtering on path prefix;
  # little other opportunity for server-side filtering.

  def collect_user_details
    backend = Backend.create
    users = backend.list_users.users.map(&:to_h)

    # TODO: lazy columns - https://github.com/chef/inspec-aws/issues/100
    users.each do |user|
      begin
        _login_profile = backend.get_login_profile(user_name: user[:user_name])
        user[:has_console_password] = true
      rescue Aws::IAM::Errors::NoSuchEntity
        user[:has_console_password] = false
      end
      user[:has_console_password?] = user[:has_console_password]

      begin
        aws_mfa_devices = backend.list_mfa_devices(user_name: user[:user_name])
        user[:has_mfa_enabled] = !aws_mfa_devices.mfa_devices.empty?
      rescue Aws::IAM::Errors::NoSuchEntity
        user[:has_mfa_enabled] = false
      end
      user[:has_mfa_enabled?] = user[:has_mfa_enabled]
    end
    users
  end

  def to_s
    'IAM Users'
  end

  # Entry cooker.  Needs discussion.
  # def users
  # end

  #===========================================================================#
  #                        Backend Implementation
  #===========================================================================#
  class Backend
    #=====================================================#
    #                 Concrete Implementation
    #=====================================================#
    # Uses AWS API to really talk to AWS
    class AwsClientApi < Backend
      # TODO: delegate this out
      def list_users(query = {})
        AWSConnection.new.iam_client.list_users(query)
      end

      def get_login_profile(query)
        AWSConnection.new.iam_client.get_login_profile(query)
      end

      def list_mfa_devices(query)
        AWSConnection.new.iam_client.list_mfa_devices(query)
      end
    end

    #=====================================================#
    #                   Factory Interface
    #=====================================================#
    # TODO: move this to a mix-in
    DEFAULT_BACKEND = AwsClientApi
    @selected_backend = DEFAULT_BACKEND

    def self.create
      @selected_backend.new
    end

    def self.select(klass)
      @selected_backend = klass
    end
  end
end
