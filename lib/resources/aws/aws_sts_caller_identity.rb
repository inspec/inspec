class AwsStsCallerIdentity < Inspec.resource(1)
  name 'aws_sts_caller_identity'
  desc 'Verifies settings for an AWS STS Caller Identity.'
  example '
    describe aws_sts_caller_identity do
      its("arn") { should match "arn:aws:iam::.*:user/human-user" }
    end

    # Test if the account is GovCloud
    describe aws_sts_caller_identity do
      it { should be_govcloud }
    end
  '
  supports platform: 'aws'
  include AwsSingularResourceMixin

  attr_reader :arn, :arn_components

  def to_s
    'AWS Security Token Service Caller Identity'
  end

  def govcloud?
    arn_components[:partition] == 'aws-us-gov'
  end

  def arn_components
    @arn_components = fetch_arn_components
  end

  private

  def catch_aws_errors
    yield
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    gci_response = backend.get_caller_identity
    @arn = gci_response.arn
  end

  def fetch_arn_components
    @arn_components = Hash[ [:arn, :partition, :service, :region, :account_id, :resource].zip(@arn.split(':'))]
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend self
      self.aws_client_class = Aws::STS::Client

      def get_caller_identity
        aws_service_client.get_caller_identity
      end
    end
  end
end
