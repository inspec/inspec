class AwsOrganizationsMember < Inspec.resource(1)
  name 'aws_organizations_member'
  desc 'Verifies status of an account within Organizations service.'
  example '
    describe aws_organizations_member do
      it { should_not be_master }
      its("master_account_id") { should cmp "111111111111" }
    end
  '
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :master_account_id, :master
  alias master? master

  def to_s
    'Organizations Member Status'
  end

  private

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)

    do_response = backend.describe_organization
    @master_account_id = do_response.organization.master_account_id
    my_id = backend.fetch_my_id

    # This should always work
    if do_response.organization.arn.empty?
      @master = false
      return
    end

    begin
      da_response = backend.describe_account(my_id)
    rescue
      @master = false
    end

    # If we can view org and account, we're master account
    if do_response.organization.arn && da_response && da_response.account.arn
      @master = true
      return
    end

    # If we can call describe_org and NOT describe_acct, we are a member
    @master = false
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend self
      self.aws_client_class = Aws::Organizations::Client

      def describe_organization
        aws_service_client.describe_organization
      end

      def describe_account(account_id)
        aws_service_client.describe_account(account_id: account_id)
      end

      def fetch_my_id
        sts = Aws::STS::Client.new(
          region: 'us-east-1',
        )
        resp = sts.get_caller_identity({})

        arn_parts = resp.arn.split(':')
        account_num = arn_parts[4]
        account_num
      end
    end
  end
end
