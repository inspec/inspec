describe aws_ec2(name: 'Example') do
  it { should be_running }
  its('image_id') { should eq 'ami-0d729a60' }
  its('instance_type') { should eq 't2.micro' }
end
