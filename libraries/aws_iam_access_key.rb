# author: Chris Redekop
class AwsIamAccessKey < Inspec.resource(1)
  name 'aws_iam_access_key'
  desc 'Verifies settings for AWS IAM access keys'
  example "
    describe aws_iam_access_key('access-key id') do
      its('last_use') { should be > Time.now - 90 * 86400 }
    end
  "
  def initialize(opts, conn = AWSConnection.new)
    @opts = opts
    @access_key = opts[:access_key]
    @iam_client = conn.iam_client
  end

  def id
    access_key.access_key_id
  end

  def active?
    'Active'.eql? access_key.status
  end

  def create_date
    access_key.create_date
  end

  def last_used_date
    access_key_last_used.last_used_date
  end

  private

  def access_key_last_used
    @access_key_last_used ||= @iam_client.get_access_key_last_used({ access_key_id: access_key.access_key_id }).access_key_last_used
  end

  def access_key
    if !@access_key
      @iam_client.list_access_keys({ user_name: @opts[:username] }).access_key_metadata.each do |access_key|
        if access_key.access_key_id.eql? @opts[:id]
          @access_key = access_key
          break
        end
      end
    end

    @access_key
  end
end
