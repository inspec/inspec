# author: Christoph Hartmann

class AWSConnection
  def initialize
    require 'aws-sdk'
    opts = {
      region: ENV['AWS_REGION'] || ENV['AWS_DEFAULT_REGION'],
      credentials: Aws::Credentials.new(
        ENV['AWS_ACCESS_KEY_ID'],
        ENV['AWS_SECRET_ACCESS_KEY'],
        ENV['AWS_SESSION_TOKEN'],
      ),
    }
    Aws.config.update(opts)
  end

  def sns_client
    @sns_client ||= Aws::SNS::Client.new
  end

  def ec2_resource
    @ec2_resource ||= Aws::EC2::Resource.new
  end

  def ec2_client
    @ec2_client ||= Aws::EC2::Client.new
  end

  def iam_resource
    @iam_resource ||= Aws::IAM::Resource.new
  end

  def iam_client
    @iam_client ||= Aws::IAM::Client.new
  end
end
