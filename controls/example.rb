describe aws_ec2(name: 'aws-inspec') do
  it { should be_running }
  its('state') { should eq 'running' }
  its('instance_id') { should eq 'i-1234a1ab' }
  its('image_id') { should eq 'ami-c123aaa1' }
  its('public_ip_address') { should eq '123.123.123.123' }
  its('private_ip_address') { should eq '123.123.123.123' }
  its('vpc_id') { should eq 'vpc-1234567' }
  its('subnet_id') { should eq 'subnet-1234567' }
end

describe aws_ec2(name: 'aws-opsworks-cm-serdar2') do
  it { should_not be_running }
end
