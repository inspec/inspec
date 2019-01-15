require 'uri'

class AwsLaunchConfiguration < Inspec.resource(1)
  name 'aws_launch_configuration'
  desc 'Verifies settings for an Auto Scaling Launch Configuration'
  example "
    describe aws_launch_configuration('MyLaunchConfiguration') do
      it { should exist }
      its('image_id') { should eq 'ami-012121aa' }
      its('instance_type') { should eq 't3.micro' }
      its('iam_instance_profile') { should eq 'MyIAMProfile' }
      its('key_name') { should eq 'MyKeyName'}
      its('security_groups') { should include 'sg-121211'}
      its('associate_public_ip_address') { should be false }
      its('user_data') { should include '#!/bin/bash'}
      its('ebs_optimized') { should be true }
      its('instance_monitoring') { should be 'detailed' }
      its('spot_price') { should eq 0.121 }
    end
  "
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :name, :image_id, :instance_type, :iam_instance_profile,
              :key_name, :security_groups, :associate_public_ip_address,
              :ebs_optimized, :spot_price, :instance_monitoring, :user_data

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:name],
      allowed_scalar_name: :name,
      allowed_scalar_type: String,
    )
    if validated_params.empty?
      raise ArgumentError, 'You must provide a name to aws_launch_configuration.'
    end
    validated_params
  end

  def fetch_from_api
    aws_response = BackendFactory.create(inspec_runner).get_launch_configuration_attributes(launch_configuration_names: [@name])
    if aws_response.launch_configurations.length == 1
      @exists = true
      launch_configuration = aws_response.launch_configurations[0]
      @name = launch_configuration[:launch_configuration_name]
      @image_id = launch_configuration[:image_id]
      @instance_type = launch_configuration[:instance_type]
      @iam_instance_profile = launch_configuration[:iam_instance_profile]
      @key_name = launch_configuration[:key_name]
      @security_groups = launch_configuration[:security_groups]
      # associate_public_ip_address is supposed to be true/false, but seems to be nil when false
      @associate_public_ip_address = launch_configuration[:associate_public_ip_address].nil? ? false : true
      @user_data = launch_configuration[:user_data] ? Base64.decode64(launch_configuration[:user_data]) : ""
      @ebs_optimized = launch_configuration[:ebs_optimized]
      @instance_monitoring = launch_configuration[:instance_monitoring][:enabled] ? 'detailed': 'basic'
      @spot_price = launch_configuration[:spot_price].to_f
    else
      @exists = false
    end
  end

  # Uses the SDK API to really talk to AWS
  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::AutoScaling::Client

      def get_launch_configuration_attributes(criteria)
        aws_service_client.describe_launch_configurations(criteria)
      end
    end
  end
end
