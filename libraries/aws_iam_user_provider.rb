# author: Alex Bedley
# author: Steffanie Freeman

module AwsIam
  class UserProvider
    def initialize(conn = AWSConnection.new)
      @iam_resource = conn.iam_resource
    end

    def user(name)
      aws_user = @iam_resource.user(name)
      self.class.convert(aws_user)
    end

    def list_users
      aws_users = @iam_resource.users
      aws_users.map do |aws_user|
        self.class.convert(aws_user)
      end
    end

    class << self
      def has_mfa_enabled?(aws_user)
        !aws_user.mfa_devices.first.nil?
      end

      def has_console_password?(aws_user)
        return !aws_user.login_profile.create_date.nil?
      rescue Aws::IAM::Errors::NoSuchEntity
        return false
      end

      def access_keys(aws_user)
        aws_user.access_keys
      end

      def convert(aws_user)
        {
          has_mfa_enabled?: has_mfa_enabled?(aws_user),
          has_console_password?: has_console_password?(aws_user),
          access_keys: access_keys(aws_user),
        }
      end
    end
  end
end
