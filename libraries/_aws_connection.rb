# author: Christoph Hartmann

# This class exists so that we can intercept AWS API connection setup
# and have an opportunity to provide credentials from another mechanism
# (such as a train transport URI) in the future.
#
# We commit to always supporting the standard AWS environment variables.

class AWSConnection
  def initialize
    creds = nil
    if ENV['AWS_PROFILE']
      creds = Aws::SharedCredentials.new(profile_name: ENV['AWS_PROFILE'])
    else
      creds = Aws::Credentials.new(
        ENV['AWS_ACCESS_KEY_ID'],
        ENV['AWS_SECRET_ACCESS_KEY'],
        ENV['AWS_SESSION_TOKEN'],
      )
    end
    opts = {
      region: ENV['AWS_REGION'] || ENV['AWS_DEFAULT_REGION'],
      credentials: creds,
    }
    Aws.config.update(opts)
  end

  def sns_client
    @sns_client ||= Aws::SNS::Client.new
  end

  def cloudwatch_client
    @cloudwatch_client ||= Aws::CloudWatch::Client.new
  end

  def cloudwatch_logs_client
    @cloudwatch_logs_client ||= Aws::CloudWatchLogs::Client.new
  end

  def cloudtrail_client
    @cloudtrail_client ||= Aws::CloudTrail::Client.new
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

  def s3_client
    @s3_client ||= Aws::S3::Client.new
  end
end
