describe aws_ec2(name: 'Example') do
  it { should exist }
  its('image_id') { should eq 'ami-0d729a60' }
  its('instance_type') { should eq 't2.micro' }
end

#must use a real EC2 instance name, as the SDK will first check to see if its well formed before sending requests
describe aws_ec2('i-06b4bc106e0d03dfd') do
  it { should_not exist }
end
