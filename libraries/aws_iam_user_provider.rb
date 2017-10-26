# author: Alex Bedley
# author: Steffanie Freeman

module AwsIam
  class UserProvider
    def initialize(conn = AWSConnection.new)
      @iam_resource = conn.iam_resource
    end

    def user(name)
      @iam_resource.user(name)
    end

    def list_users
      @iam_resource.users
    end
  end
end
