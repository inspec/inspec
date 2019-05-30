require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-eks'

class AwsEksCluster < Inspec.resource(1)
  name 'aws_eks_cluster'
  desc 'Verifies settings for an EKS cluster'

  example <<~EXAMPLE
    describe aws_eks_cluster('default') do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :version, :arn, :cluster_name, :certificate_authority, :name,
              :status, :endpoint, :subnets_count, :subnet_ids, :security_group_ids,
              :created_at, :role_arn, :vpc_id, :security_groups_count, :creating,
              :active, :failed, :deleting
  # Use aliases for matchers
  alias active? active
  alias failed? failed
  alias creating? creating
  alias deleting? deleting

  def to_s
    "AWS EKS cluster #{cluster_name}"
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:cluster_name],
      allowed_scalar_name: :cluster_name,
      allowed_scalar_type: String,
    )

    if validated_params.empty?
      raise ArgumentError, 'You must provide a cluster_name to aws_eks_cluster.'
    end

    validated_params
  end

  def fetch_from_api # rubocop:disable Metrics/AbcSize
    backend = BackendFactory.create(inspec_runner)
    begin
      params = { name: cluster_name }
      resp = backend.describe_cluster(params)
    rescue Aws::EKS::Errors::ResourceNotFoundException
      @exists = false
      populate_as_missing
      return
    end
    @exists = true
    cluster = resp.to_h[:cluster]
    @version = cluster[:version]
    @name = cluster[:name]
    @arn = cluster[:arn]
    @certificate_authority = cluster[:certificate_authority][:data]
    @created_at = cluster[:created_at]
    @endpoint = cluster[:endpoint]
    @security_group_ids = cluster[:resources_vpc_config][:security_group_ids]
    @subnet_ids = cluster[:resources_vpc_config][:subnet_ids]
    @subnets_count = cluster[:resources_vpc_config][:subnet_ids].length
    @security_groups_count = cluster[:resources_vpc_config][:security_group_ids].length
    @vpc_id = cluster[:resources_vpc_config][:vpc_id]
    @role_arn = cluster[:role_arn]
    @status = cluster[:status]
    @active = cluster[:status] == 'ACTIVE'
    @failed = cluster[:status] == 'FAILED'
    @creating = cluster[:status] == 'CREATING'
    @deleting = cluster[:status] == 'DELETING'
  end

  def populate_as_missing
    @version = nil
    @name = cluster_name # name is an alias for cluster_name, and it is retained on a miss
    @arn = nil
    @certificate_authority = nil
    @created_at = nil
    @endpoint = nil
    @security_group_ids = []
    @subnet_ids = []
    @subnets_count = nil
    @security_groups_count = nil
    @vpc_id = nil
    @role_arn = nil
    @status = nil
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::EKS::Client

      def describe_cluster(query = {})
        aws_service_client.describe_cluster(query)
      end
    end
  end
end
