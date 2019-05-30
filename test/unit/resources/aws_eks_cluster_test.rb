require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_eks_cluster'

require 'resource_support/aws'
require 'resources/aws/aws_eks_cluster'

# MAEKSB = MockAwsEksClusterSingularBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsEksClusterConstructorTest < Minitest::Test

  def setup
    AwsEksCluster::BackendFactory.select(MAEKSB::Empty)
  end

  def test_empty_params_rejected
    assert_raises(ArgumentError) { AwsEksCluster.new }
  end

  def test_string_accepted
    AwsEksCluster.new 'kangaroo'
  end

  def test_hash_accepted
    AwsEksCluster.new cluster_name: 'polar_bear'
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsEksCluster.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                            Search / Recall
#=============================================================================#
class AwsEksClusterFilterCriteriaTest < Minitest::Test

  def setup
    AwsEksCluster::BackendFactory.select(MAEKSB::Basic)
  end

  def test_search_miss
    refute AwsEksCluster.new('nonesuch').exists?
  end

  def test_recall_when_provided_a_string
    cluster = AwsEksCluster.new 'kangaroo'
    assert cluster.exists?
    assert_equal('kangaroo', cluster.cluster_name)
  end

  def test_recall_when_provided_a_hash
    cluster = AwsEksCluster.new cluster_name: 'kang-the-alien'
    assert cluster.exists?
    assert_equal('kang-the-alien', cluster.name)
  end

end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsEksClusterProperties < Minitest::Test

  def setup
    AwsEksCluster::BackendFactory.select(MAEKSB::Basic)
    @roo = AwsEksCluster.new('kangaroo')
    @kang = AwsEksCluster.new('kang-the-alien')
    @kodos = AwsEksCluster.new('kodos-the-alien')
    @gamma = AwsEksCluster.new('gamma')
    @miss = AwsEksCluster.new('nonesuch')
  end

  def test_property_with_cluster_arn
    assert_equal('arn:aws:eks:ab-region-1:012345678910:cluster/kangaroo', @roo.arn)
    assert_equal('arn:aws:eks:ab-region-1:019876543210:cluster/kang-the-alien', @kang.arn)
    assert_equal('arn:aws:eks:ab-region-1:013836573410:cluster/gamma', @gamma.arn)
    assert_nil(@miss.arn)
  end

  def test_property_with_name
    assert_equal('kangaroo', @roo.name)
    assert_equal('kang-the-alien', @kang.name)
    assert_equal('gamma', @gamma.name)
    assert_equal('nonesuch', @miss.name) # Even misses retain their identifier
  end

  def test_property_with_status
    assert_equal('ACTIVE', @roo.status)
    assert_equal('CREATING', @kang.status)
    assert_equal('DELETING', @gamma.status)
    assert_equal('FAILED', @kodos.status)
    assert_nil(@miss.status)
  end

  def test_property_with_status_predicate
    assert(@roo.active?)
    refute(@kang.active?)
    assert(@kang.creating?)
    assert(@gamma.deleting?)
    assert(@kodos.failed?)
    assert_nil(@miss.active?)
  end

  def test_property_with_subnets_count
    assert_equal(4, @roo.subnets_count)
    assert_equal(2, @kang.subnets_count)
    assert_equal(0, @gamma.subnets_count)
    assert_nil(@miss.subnets_count)
  end

  def test_property_with_security_groups_count
    assert_equal(0, @roo.security_groups_count)
    assert_equal(1, @kang.security_groups_count)
    assert_equal(2, @gamma.security_groups_count)
    assert_nil(@miss.security_groups_count)
  end

  def test_property_with_subnet_ids
    assert_includes(@roo.subnet_ids, 'subnet-e7e741bc')
    assert_includes(@kang.subnet_ids, 'subnet-1234e12a')
    refute_includes(@gamma.subnet_ids, nil)
    assert_kind_of(Array, @miss.subnet_ids)
    assert_empty(@miss.subnet_ids)
  end

  def test_property_with_security_group_ids
    refute_includes(@roo.security_group_ids, nil)
    assert_includes(@kang.security_group_ids, 'sg-6979fe18')
    assert_includes(@gamma.security_group_ids, 'sg-6975fe18')
    assert_kind_of(Array, @miss.security_group_ids)
    assert_empty(@miss.security_group_ids)
  end

  def test_property_with_version
    assert_includes(@roo.version,'1.0')
    assert_includes(@kang.version, '1.3')
    assert_includes(@gamma.version, '2.3')
    assert_nil(@miss.version)
  end

  def test_property_with_created_at
    assert_operator(@roo.created_at, :>, Time.at(1527807878))
    assert_operator(@kang.created_at, :<, Time.at(1527807979))
    assert_operator(@kang.created_at, :<, @gamma.created_at)
    refute_operator(@kang.created_at, :>, @gamma.created_at)
    assert_equal(@gamma.created_at, Time.at(9999999999))
    assert_nil(@miss.created_at)
  end

  def test_property_with_role_arn
    assert_equal(@roo.role_arn, 'arn:aws:iam::012345678910:role/eks-service-role-AWSServiceRoleForAmazonEKS-J7ONKE3BQ4PI')
    assert_nil(@miss.role_arn)
  end

  def test_property_with_certificate_authority
    assert_equal(@roo.certificate_authority, 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRFNE1EVXpNVEl6TVRFek1Wb1hEVEk0TURVeU9ESXpNVEV6TVZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTTZWCjVUaG4rdFcySm9Xa2hQMzRlVUZMNitaRXJOZGIvWVdrTmtDdWNGS2RaaXl2TjlMVmdvUmV2MjlFVFZlN1ZGbSsKUTJ3ZURyRXJiQyt0dVlibkFuN1ZLYmE3ay9hb1BHekZMdmVnb0t6b0M1N2NUdGVwZzRIazRlK2tIWHNaME10MApyb3NzcjhFM1ROeExETnNJTThGL1cwdjhsTGNCbWRPcjQyV2VuTjFHZXJnaDNSZ2wzR3JIazBnNTU0SjFWenJZCm9hTi8zODFUczlOTFF2QTBXb0xIcjBFRlZpTFdSZEoyZ3lXaC9ybDVyOFNDOHZaQXg1YW1BU0hVd01aTFpWRC8KTDBpOW4wRVM0MkpVdzQyQmxHOEdpd3NhTkJWV3lUTHZKclNhRXlDSHFtVVZaUTFDZkFXUjl0L3JleVVOVXM3TApWV1FqM3BFbk9RMitMSWJrc0RzQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFNZ3RsQ1dIQ2U2YzVHMXl2YlFTS0Q4K2hUalkKSm1NSG56L2EvRGt0WG9YUjFVQzIrZUgzT1BZWmVjRVZZZHVaSlZCckNNQ2VWR0ZkeWdBYlNLc1FxWDg0S2RXbAp1MU5QaERDSmEyRHliN2pVMUV6VThTQjFGZUZ5ZFE3a0hNS1E1blpBRVFQOTY4S01hSGUrSm0yQ2x1UFJWbEJVCjF4WlhTS1gzTVZ0K1Q0SU1EV2d6c3JRSjVuQkRjdEtLcUZtM3pKdVVubHo5ZEpVckdscEltMjVJWXJDckxYUFgKWkUwRUtRNWEzMHhkVWNrTHRGQkQrOEtBdFdqSS9yZUZPNzM1YnBMdVoyOTBaNm42QlF3elRrS0p4cnhVc3QvOAppNGsxcnlsaUdWMm5SSjBUYjNORkczNHgrYWdzYTRoSTFPbU90TFM0TmgvRXJxT3lIUXNDc2hEQUtKUT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=',
                 )
    assert_nil(@miss.certificate_authority)
  end

  def test_property_with_vpc_id
    assert_equal(@roo.vpc_id,'vpc-166723ec')
    assert_equal(@kang.vpc_id, 'vpc-266723ec')
    assert_equal(@gamma.vpc_id, 'vpc-366723ec')
    assert_nil(@miss.vpc_id)
  end

end
#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAEKSB
  class Empty < AwsBackendBase
    def describe_cluster(query = {})
      raise Aws::EKS::Errors::ResourceNotFoundException.new(nil, nil)
    end
  end

  class Basic < AwsBackendBase
    def describe_cluster(query = {})
      fixtures = [
          OpenStruct.new({
              version: '1.0',
              name: 'kangaroo',
              arn: 'arn:aws:eks:ab-region-1:012345678910:cluster/kangaroo',
              certificate_authority: OpenStruct.new({
                  data: 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRFNE1EVXpNVEl6TVRFek1Wb1hEVEk0TURVeU9ESXpNVEV6TVZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTTZWCjVUaG4rdFcySm9Xa2hQMzRlVUZMNitaRXJOZGIvWVdrTmtDdWNGS2RaaXl2TjlMVmdvUmV2MjlFVFZlN1ZGbSsKUTJ3ZURyRXJiQyt0dVlibkFuN1ZLYmE3ay9hb1BHekZMdmVnb0t6b0M1N2NUdGVwZzRIazRlK2tIWHNaME10MApyb3NzcjhFM1ROeExETnNJTThGL1cwdjhsTGNCbWRPcjQyV2VuTjFHZXJnaDNSZ2wzR3JIazBnNTU0SjFWenJZCm9hTi8zODFUczlOTFF2QTBXb0xIcjBFRlZpTFdSZEoyZ3lXaC9ybDVyOFNDOHZaQXg1YW1BU0hVd01aTFpWRC8KTDBpOW4wRVM0MkpVdzQyQmxHOEdpd3NhTkJWV3lUTHZKclNhRXlDSHFtVVZaUTFDZkFXUjl0L3JleVVOVXM3TApWV1FqM3BFbk9RMitMSWJrc0RzQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFNZ3RsQ1dIQ2U2YzVHMXl2YlFTS0Q4K2hUalkKSm1NSG56L2EvRGt0WG9YUjFVQzIrZUgzT1BZWmVjRVZZZHVaSlZCckNNQ2VWR0ZkeWdBYlNLc1FxWDg0S2RXbAp1MU5QaERDSmEyRHliN2pVMUV6VThTQjFGZUZ5ZFE3a0hNS1E1blpBRVFQOTY4S01hSGUrSm0yQ2x1UFJWbEJVCjF4WlhTS1gzTVZ0K1Q0SU1EV2d6c3JRSjVuQkRjdEtLcUZtM3pKdVVubHo5ZEpVckdscEltMjVJWXJDckxYUFgKWkUwRUtRNWEzMHhkVWNrTHRGQkQrOEtBdFdqSS9yZUZPNzM1YnBMdVoyOTBaNm42QlF3elRrS0p4cnhVc3QvOAppNGsxcnlsaUdWMm5SSjBUYjNORkczNHgrYWdzYTRoSTFPbU90TFM0TmgvRXJxT3lIUXNDc2hEQUtKUT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=',
                                                    }),
              created_at: Time.at(1527807879),
              endpoint: 'https://A0DCCD80A04F01705DD065655C30CC3D.yl4.aq-south-2.eks.amazonaws.com',
              resources_vpc_config: OpenStruct.new({
                security_group_ids: [],
                subnet_ids: %w[subnet-1234e12a subnet-e7e741bc subnet-e7a763ac subnet-e7b781cc],
                vpc_id: 'vpc-166723ec',
                }),
              role_arn: 'arn:aws:iam::012345678910:role/eks-service-role-AWSServiceRoleForAmazonEKS-J7ONKE3BQ4PI',
              status: 'ACTIVE',
          }),
      OpenStruct.new({
                         version: '1.3',
                         name: 'kang-the-alien',
                         arn: 'arn:aws:eks:ab-region-1:019876543210:cluster/kang-the-alien',
                         certificate_authority: OpenStruct.new({
                                                                   data: 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRFNE1EVXpNVEl6TVRFek1Wb1hEVEk0TURVeU9ESXpNVEV6TVZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTTZWCjVUaG4rdFcySm9Xa2hQMzRlVUZMNitaRXJOZGIvWVdrTmtDdWNGS2RaaXl2TjlMVmdvUmV2MjlFVFZlN1ZGbSsKUTJ3ZURyRXJiQyt0dVlibkFuN1ZLYmE3ay9hb1BHekZMdmVnb0t6b0M1N2NUdGVwZzRIazRlK2tIWHNaME10MApyb3NzcjhFM1ROeExETnNJTThGL1cwdjhsTGNCbWRPcjQyV2VuTjFHZXJnaDNSZ2wzR3JIazBnNTU0SjFWenJZCm9hTi8zODFUczlOTFF2QTBXb0xIcjBFRlZpTFdSZEoyZ3lXaC9ybDVyOFNDOHZaQXg1YW1BU0hVd01aTFpWRC8KTDBpOW4wRVM0MkpVdzQyQmxHOEdpd3NhTkJWV3lUTHZKclNhRXlDSHFtVVZaUTFDZkFXUjl0L3JleVVOVXM3TApWV1FqM3BFbk9RMitMSWJrc0RzQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFNZ3RsQ1dIQ2U2YzVHMXl2YlFTS0Q4K2hUalkKSm1NSG56L2EvRGt0WG9YUjFVQzIrZUgzT1BZWmVjRVZZZHVaSlZCckNNQ2VWR0ZkeWdBYlNLc1FxWDg0S2RXbAp1MU5QaERDSmEyRHliN2pVMUV6VThTQjFGZUZ5ZFE3a0hNS1E1blpBRVFQOTY4S01hSGUrSm0yQ2x1UFJWbEJVCjF4WlhTS1gzTVZ0K1Q0SU1EV2d6c3JRSjVuQkRjdEtLcUZtM3pKdVVubHo5ZEpVckdscEltMjVJWXJDckxYUFgKWkUwRUtRNWEzMHhkVWNrTHRGQkQrOEtBdFdqSS9yZUZPNzM1YnBMdVoyOTBaNm42QlF3elRrS0p4cnhVc3QvOAppNGsxcnlsaUdWMm5SSjBUYjNORkczNHgrYWdzYTRoSTFPbU90TFM0TmgvRXJxT3lIUXNDc2hEQUtKUT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=',
                                                               }),
                         created_at: Time.at(1527807879),
                         endpoint: 'https://A0DCCD80A04F01705DD065655C30CC3D.yl4.aq-south-1.eks.amazonaws.com',
                         resources_vpc_config: OpenStruct.new({
                                                                  security_group_ids: ['sg-6979fe18'],
                                                                  subnet_ids: %w[subnet-1234e12a subnet-e7e741bc],
                                                                  vpc_id: 'vpc-266723ec',
                                                              }),
                         role_arn: 'arn:aws:iam::012345678910:role/eks-service-role-AWSServiceRoleForAmazonEKS-J7ONKE3BQ4PI',
                         status: 'CREATING',
                     }),
      OpenStruct.new({
                         version: '2.3',
                         name: 'gamma',
                         arn: 'arn:aws:eks:ab-region-1:013836573410:cluster/gamma',
                         certificate_authority: OpenStruct.new({
                                                                   data: 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRFNE1EVXpNVEl6TVRFek1Wb1hEVEk0TURVeU9ESXpNVEV6TVZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTTZWCjVUaG4rdFcySm9Xa2hQMzRlVUZMNitaRXJOZGIvWVdrTmtDdWNGS2RaaXl2TjlMVmdvUmV2MjlFVFZlN1ZGbSsKUTJ3ZURyRXJiQyt0dVlibkFuN1ZLYmE3ay9hb1BHekZMdmVnb0t6b0M1N2NUdGVwZzRIazRlK2tIWHNaME10MApyb3NzcjhFM1ROeExETnNJTThGL1cwdjhsTGNCbWRPcjQyV2VuTjFHZXJnaDNSZ2wzR3JIazBnNTU0SjFWenJZCm9hTi8zODFUczlOTFF2QTBXb0xIcjBFRlZpTFdSZEoyZ3lXaC9ybDVyOFNDOHZaQXg1YW1BU0hVd01aTFpWRC8KTDBpOW4wRVM0MkpVdzQyQmxHOEdpd3NhTkJWV3lUTHZKclNhRXlDSHFtVVZaUTFDZkFXUjl0L3JleVVOVXM3TApWV1FqM3BFbk9RMitMSWJrc0RzQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFNZ3RsQ1dIQ2U2YzVHMXl2YlFTS0Q4K2hUalkKSm1NSG56L2EvRGt0WG9YUjFVQzIrZUgzT1BZWmVjRVZZZHVaSlZCckNNQ2VWR0ZkeWdBYlNLc1FxWDg0S2RXbAp1MU5QaERDSmEyRHliN2pVMUV6VThTQjFGZUZ5ZFE3a0hNS1E1blpBRVFQOTY4S01hSGUrSm0yQ2x1UFJWbEJVCjF4WlhTS1gzTVZ0K1Q0SU1EV2d6c3JRSjVuQkRjdEtLcUZtM3pKdVVubHo5ZEpVckdscEltMjVJWXJDckxYUFgKWkUwRUtRNWEzMHhkVWNrTHRGQkQrOEtBdFdqSS9yZUZPNzM1YnBMdVoyOTBaNm42QlF3elRrS0p4cnhVc3QvOAppNGsxcnlsaUdWMm5SSjBUYjNORkczNHgrYWdzYTRoSTFPbU90TFM0TmgvRXJxT3lIUXNDc2hEQUtKUT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=',
                                                               }),
                         created_at: Time.at(9999999999),
                         endpoint: 'https://A0DCCD80A04F01705DD065655C30CC3D.yl4.aq-south-3.eks.amazonaws.com',
                         resources_vpc_config: OpenStruct.new({
                                                                  security_group_ids: %w[sg-6975fe18 sg-6479fe18],
                                                                  subnet_ids: [],
                                                                  vpc_id: 'vpc-366723ec',
                                                              }),
                         role_arn: 'arn:aws:iam::012345678910:role/eks-service-role-AWSServiceRoleForAmazonEKS-J7ONKE3BQ4PI',
                         status: 'DELETING',
                     }),
      OpenStruct.new({
                         version: '2.0',
                         name: 'kodos-the-alien',
                         arn: 'arn:aws:eks:ab-region-1:013836573410:cluster/kodos',
                         certificate_authority: OpenStruct.new({
                                                                   data: 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRFNE1EVXpNVEl6TVRFek1Wb1hEVEk0TURVeU9ESXpNVEV6TVZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTTZWCjVUaG4rdFcySm9Xa2hQMzRlVUZMNitaRXJOZGIvWVdrTmtDdWNGS2RaaXl2TjlMVmdvUmV2MjlFVFZlN1ZGbSsKUTJ3ZURyRXJiQyt0dVlibkFuN1ZLYmE3ay9hb1BHekZMdmVnb0t6b0M1N2NUdGVwZzRIazRlK2tIWHNaME10MApyb3NzcjhFM1ROeExETnNJTThGL1cwdjhsTGNCbWRPcjQyV2VuTjFHZXJnaDNSZ2wzR3JIazBnNTU0SjFWenJZCm9hTi8zODFUczlOTFF2QTBXb0xIcjBFRlZpTFdSZEoyZ3lXaC9ybDVyOFNDOHZaQXg1YW1BU0hVd01aTFpWRC8KTDBpOW4wRVM0MkpVdzQyQmxHOEdpd3NhTkJWV3lUTHZKclNhRXlDSHFtVVZaUTFDZkFXUjl0L3JleVVOVXM3TApWV1FqM3BFbk9RMitMSWJrc0RzQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFNZ3RsQ1dIQ2U2YzVHMXl2YlFTS0Q4K2hUalkKSm1NSG56L2EvRGt0WG9YUjFVQzIrZUgzT1BZWmVjRVZZZHVaSlZCckNNQ2VWR0ZkeWdBYlNLc1FxWDg0S2RXbAp1MU5QaERDSmEyRHliN2pVMUV6VThTQjFGZUZ5ZFE3a0hNS1E1blpBRVFQOTY4S01hSGUrSm0yQ2x1UFJWbEJVCjF4WlhTS1gzTVZ0K1Q0SU1EV2d6c3JRSjVuQkRjdEtLcUZtM3pKdVVubHo5ZEpVckdscEltMjVJWXJDckxYUFgKWkUwRUtRNWEzMHhkVWNrTHRGQkQrOEtBdFdqSS9yZUZPNzM1YnBMdVoyOTBaNm42QlF3elRrS0p4cnhVc3QvOAppNGsxcnlsaUdWMm5SSjBUYjNORkczNHgrYWdzYTRoSTFPbU90TFM0TmgvRXJxT3lIUXNDc2hEQUtKUT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=',
                                                               }),
                         created_at: Time.at(0),
                         endpoint: 'https://A0DCCD80A04F01705DD065655C30CC3D.yl4.aq-south-3.eks.amazonaws.com',
                         resources_vpc_config: OpenStruct.new({
                                                                  security_group_ids: %w[sg-6975fe18 sg-6479fe18],
                                                                  subnet_ids: [],
                                                                  vpc_id: 'vpc-366723ec',
                                                              }),
                         role_arn: 'arn:aws:iam::012345678910:role/eks-service-role-AWSServiceRoleForAmazonEKS-J7ONKE3BQ4PI',
                         status: 'FAILED',
                     })
      ]
      if query[:name]
        result = fixtures.select do |clst|
          query[:name].include? clst.name
        end
        if result.empty?
          raise Aws::EKS::Errors::ResourceNotFoundException.new(nil,nil)
        else
          OpenStruct.new({ cluster: result[0] })
        end
      end
    end
  end
end
