fixtures = {}
%w{
  role_for_config_recorder_arn
  config_recorder_name
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/config.tf"
  )
end

#======================================================#
#               aws_config_recorder - Singular
#======================================================#

#-------------------  Recall / Miss -------------------#

control "aws_config_recorder recall" do

  # Get the singleton if you don't pass a name
  describe aws_config_recorder do
    it { should exist }
  end

  # Test scalar param
  describe aws_config_recorder(fixtures["config_recorder_name"]) do
    it { should exist }
  end

  # Test hash parameter
  describe aws_config_recorder(recorder_name: fixtures["config_recorder_name"]) do
    it { should exist }
  end

  # Test recorder that doesnt exist
  describe aws_config_recorder(recorder_name: "NonExistentRecorder") do
    it { should_not exist }
  end
end

#-------------------  Properties -------------------#
control "aws_config_recorder properties" do
  describe aws_config_recorder do
    its("recorder_name") { should eq fixtures["config_recorder_name"] }
  end

  describe aws_config_recorder(fixtures["config_recorder_name"]) do
    its("recorder_name") { should eq fixtures["config_recorder_name"] }
    its("role_arn") { should eq fixtures["role_for_config_recorder_arn"] }
    its("resource_types") { should eq [] }
  end
end

#-------------------  Matchers -------------------#
control "aws_config_recorder matchers" do
  describe aws_config_recorder(fixtures["config_recorder_name"]) do
    it { should_not be_recording }
    it { should be_recording_all_resource_types }
    it { should_not be_recording_all_global_types }
  end
end
