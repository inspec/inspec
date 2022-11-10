title 'Test AliCloud Instances count'

control 'ali-cloud-instances-1.0' do
  impact 1.0
  title 'Ensure AliCloud ECS Instances Class has correct attributes.'
  
  describe alicloud_ecs_instances do
    it { should exist }
    its('entries.count') { should be >= 1 }
  end
end
