require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_ecs_cluster'

require 'resource_support/aws'
require 'resources/aws/aws_ecs_cluster'

# MAECSB = MockAwsEcsClusterSingularBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsEcsClusterConstructorTest < Minitest::Test

  def setup
    AwsEcsCluster::BackendFactory.select(MAECSB::Basic)
  end

  def test_empty_default_cluster
    AwsEcsCluster.new  
  end

  def test_string_accepted
    AwsEcsCluster.new 'my-cluster'    
  end

  def test_hash_accepted
    AwsEcsCluster.new cluster_name: 'my-cluster'    
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsEcsCluster.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                            Search / Recall
#=============================================================================#
class AwsEcsClusterFilterCriteriaTest < Minitest::Test

  def setup
    AwsEcsCluster::BackendFactory.select(MAECSB::Basic)
  end

  def test_default
    cluster = AwsEcsCluster.new
    assert cluster.exists?
    assert_equal('default', cluster.cluster_name)
  end

  def test_search_miss
    refute AwsEcsCluster.new('nonesuch').exists?
  end

  def test_accepts_cluster_name_as_string
    cluster = AwsEcsCluster.new 'kangaroo'
    assert cluster.exists?
    assert_equal('kangaroo', cluster.cluster_name)
  end

  def test_accepts_cluster_name_as_hash
    cluster = AwsEcsCluster.new cluster_name: 'kangaroo'
    assert cluster.exists?
    assert_equal('kangaroo', cluster.cluster_name)
  end

end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsEcsClusterProperties < Minitest::Test

  def setup
    AwsEcsCluster::BackendFactory.select(MAECSB::Basic)
    @default = AwsEcsCluster.new
    @roo = AwsEcsCluster.new('kangaroo')
    @miss = AwsEcsCluster.new('nonesuch')
  end

  def test_property_with_cluster_arn
    assert_equal('arn:aws:ecs:ab-region-1:123456789:cluster/default', @default.cluster_arn)
    assert_equal('arn:aws:ecs:ab-region-1:123456789:cluster/kangaroo', @roo.cluster_arn)
    assert_empty(@miss.cluster_arn)
  end

  def test_property_with_cluster_name
    assert_equal('default', @default.cluster_name)
    assert_equal('kangaroo', @roo.cluster_name)
    assert_empty(@miss.cluster_name)
  end

  def test_property_with_status
    assert_equal('ACTIVE', @default.status)
    assert_equal('ACTIVE', @roo.status)
    assert_empty(@miss.status)
  end

  def test_property_with_registered_container_instances_count
    assert_equal(0, @default.registered_container_instances_count)
    assert_equal(3, @roo.registered_container_instances_count)
    assert_equal(0, @miss.registered_container_instances_count)
  end

  def test_property_with_running_tasks_count
    assert_equal(0, @default.running_tasks_count)
    assert_equal(10, @roo.running_tasks_count)
    assert_equal(0, @miss.running_tasks_count)
  end

  def test_property_with_pending_tasks_count
    assert_equal(0, @default.pending_tasks_count)
    assert_equal(2, @roo.pending_tasks_count)
    assert_equal(0, @miss.pending_tasks_count)
  end

  def test_property_with_active_services_count
    assert_equal(0, @default.active_services_count)
    assert_equal(4, @roo.active_services_count)
    assert_equal(0, @miss.active_services_count)
  end

  def test_property_with_statistics
    assert_empty(@default.statistics)
    assert_empty(@roo.statistics)
    assert_empty(@miss.statistics)
  end


end
#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAECSB
  class Basic < AwsBackendBase
    def describe_clusters(query = {})
      clusters = {
        'default' => Aws::ECS::Types::Cluster.new(
          cluster_arn: 'arn:aws:ecs:ab-region-1:123456789:cluster/default',
          cluster_name: 'default',
          status: 'ACTIVE',
          registered_container_instances_count: 0,
          running_tasks_count: 0,
          pending_tasks_count: 0,
          active_services_count: 0,
          statistics: []
        ),
        'kangaroo' => Aws::ECS::Types::Cluster.new(
          cluster_arn: 'arn:aws:ecs:ab-region-1:123456789:cluster/kangaroo',
          cluster_name: 'kangaroo',
          status: 'ACTIVE',
          registered_container_instances_count: 3,
          running_tasks_count: 10,
          pending_tasks_count: 2,
          active_services_count: 4,
          statistics: []
        )
      }

      if query[:clusters]
        clstrs = []
        failures = []

        query[:clusters].each do |cluster_name|
          if clusters.key?(cluster_name)
            clstrs.push(clusters[cluster_name])
          else
            failures.push(Aws::ECS::Types::Failure.new(
              arn: "arn:aws:ecs:ab-region-1:123456789:cluster/#{cluster_name}",
              reason: "MISSING"
            ))
          end
        end
        Aws::ECS::Types::DescribeClustersResponse.new(
          clusters: clstrs,
          failures: failures,
        )
      else
        Aws::ECS::Types::DescribeClustersResponse.new(
          clusters: [
            clusters['default']
          ],
          failures: [],
        )
      end 
    end
  end
end
