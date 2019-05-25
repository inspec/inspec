require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-ecs'

class AwsEcsCluster < Inspec.resource(1)
  name 'aws_ecs_cluster'
  desc 'Verifies settings for an ECS cluster'

  example <<~EXAMPLE
    describe aws_ecs_cluster('default') do
      it { should exist }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :cluster_arn, :cluster_name, :status,
              :registered_container_instances_count, :running_tasks_count,
              :pending_tasks_count, :active_services_count, :statistics

  def to_s
    "AWS ECS cluster #{cluster_name}"
  end

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:cluster_name],
      allowed_scalar_name: :cluster_name,
      allowed_scalar_type: String,
    )

    validated_params
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    begin
      # Use default cluster if no cluster name is specified
      params = cluster_name.nil? ? {} : { clusters: [cluster_name] }
      clusters = backend.describe_clusters(params).clusters

      # Cluster name is unique, we either get back one cluster, or none
      if clusters.length == 1
        @exists = true
        unpack_describe_clusters_response(clusters.first)
      else
        @exists = false
        populate_as_missing
      end
    end
  end

  def unpack_describe_clusters_response(cluster_struct)
    @cluster_arn = cluster_struct.cluster_arn
    @cluster_name = cluster_struct.cluster_name
    @status = cluster_struct.status
    @registered_container_instances_count = cluster_struct.registered_container_instances_count
    @running_tasks_count = cluster_struct.running_tasks_count
    @pending_tasks_count = cluster_struct.pending_tasks_count
    @active_services_count = cluster_struct.active_services_count
    @statistics = cluster_struct.statistics
  end

  def populate_as_missing
    @cluster_arn = ''
    @cluster_name = ''
    @status = ''
    @registered_container_instances_count = 0
    @running_tasks_count = 0
    @pending_tasks_count = 0
    @active_services_count = 0
    @statistics = []
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::ECS::Client

      def describe_clusters(query = {})
        aws_service_client.describe_clusters(query)
      end
    end
  end
end
