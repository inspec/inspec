fixtures = {}
[
  'eks_cluster_id',
  'eks_cluster_name',
  'eks_cluster_security_group_id',
  'eks_vpc_subnets',
].each do |fixture_name|
  fixtures[fixture_name] = input(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/eks.tf',
  )
end

control "aws_eks_cluster recall" do

  describe aws_eks_cluster(fixtures['eks_cluster_id']) do
    it { should exist }
  end

  describe aws_eks_cluster('i-dont-exist') do
    it { should_not exist }
  end

end

control "aws_eks_cluster properties" do
  describe aws_eks_cluster(fixtures['eks_cluster_id']) do
    its('name') { should eq fixtures['eks_cluster_name'] }
    its('status') { should be_in %w(ACTIVE CREATING) }
    its('subnets_count') { should eq 3 }
    its('security_groups_count') { should eq 1 }

    fixtures['eks_vpc_subnets'].each do |subnet|
      its('subnet_ids') { should include (subnet) }
    end
  end
end

control "aws_eks_cluster matchers" do
  describe aws_eks_cluster(fixtures['eks_cluster_id']) do
    it { should exist }
    it { should be_active }
  end
end
