require '_aws'

# author: Chris Redekop
class AwsIamAccessKey < Inspec.resource(1)
  name 'aws_iam_access_key'
  desc 'Verifies settings for AWS IAM access keys'
  example "
    describe aws_iam_access_key(username: 'username', id: 'access-key id') do
      it { should exist }
      it { should_not be_active }
      its('create_date') { should be > Time.now - 365 * 86400 }
      its('last_used_date') { should be > Time.now - 90 * 86400 }
    end
  "

  def initialize(opts, decorator = IamClientDecorator.new)
    @access_key = opts[:access_key]
    @username = opts[:username]
    @id = @access_key ? @access_key.access_key_id : opts[:id]

    @decorator = decorator
  end

  def exists?
    !access_key.nil?
  rescue AccessKeyNotFoundError, Aws::IAM::Errors::NoSuchEntity
    false
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

  def to_s
    "IAM Access-Key #{@id}"
  end

  class AccessKeyNotFoundError < StandardError
  end

  class IamClientDecorator
    def initialize(validator = ArgumentValidator.new,
                   conn = AWSConnection.new)

      @validator = validator
      @client = conn.iam_client
    end

    def get_access_key(username, id)
      @validator.validate_username(username)
      @validator.validate_id(id)

      access_key =
        @client.list_access_keys({ user_name: username })
               .access_key_metadata.select { |x| x.access_key_id.eql? id }.first

      if access_key.nil?
        raise AccessKeyNotFoundError, 'access key not found '.concat(
          "[username = \"#{username}\", id = \"#{id}\"]",
        )
      end

      access_key
    end

    def get_access_key_last_used(id)
      @validator.validate_id(id)

      @client.get_access_key_last_used({ access_key_id: id })
             .access_key_last_used
    end

    class ArgumentValidator
      [:username, :id].each do |argument|
        define_method "validate_#{argument}" do |value|
          return unless value.nil?

          raise ArgumentError,
                "missing required resource argument \"#{argument}\""
        end
      end
    end
  end

  private

  def access_key
    @access_key ||= @decorator.get_access_key(@username, @id)
  end

  def access_key_last_used
    @access_key_last_used ||= @decorator.get_access_key_last_used(@id)
  end
end
