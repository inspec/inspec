require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-iam'

class AwsIamAccessKey < Inspec.resource(1)
  name 'aws_iam_access_key'
  desc 'Verifies settings for an individual IAM access key'
  example <<~EXAMPLE
    describe aws_iam_access_key(username: 'username', id: 'access-key id') do
      it { should exist }
      it { should_not be_active }
      its('create_date') { should be > Time.now - 365 * 86400 }
      its('last_used_date') { should be > Time.now - 90 * 86400 }
    end
  EXAMPLE
  supports platform: 'aws'

  include AwsSingularResourceMixin
  attr_reader :access_key_id, :create_date, :status, :username
  alias id access_key_id

  def validate_params(raw_params)
    recognized_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:username, :id, :access_key_id],
      allowed_scalar_name: :access_key_id,
      allowed_scalar_type: String,
    )

    # id and access_key_id are aliases; standardize on access_key_id
    recognized_params[:access_key_id] = recognized_params.delete(:id) if recognized_params.key?(:id)

    # Validate format of access_key_id
    if recognized_params[:access_key_id] and
       recognized_params[:access_key_id] !~ /^AKIA[0-9A-Z]{16}$/
      raise ArgumentError, 'Incorrect format for Access Key ID - expected AKIA followed ' \
            'by 16 letters or numbers'
    end

    # One of username and access_key_id is required
    if recognized_params[:username].nil? && recognized_params[:access_key_id].nil?
      raise ArgumentError, 'You must provide at lease one of access_key_id or username to aws_iam_access_key'
    end

    recognized_params
  end

  def active?
    return nil unless exists?
    status == 'Active'
  end

  def to_s
    "IAM Access-Key #{access_key_id}"
  end

  def last_used_date
    return nil unless exists?
    return @last_used_date if defined? @last_used_date
    backend = BackendFactory.create(inspec_runner)
    catch_aws_errors do
      @last_used_date = backend.get_access_key_last_used({ access_key_id: access_key_id }).access_key_last_used.last_used_date
    end
  end

  def fetch_from_api
    backend = BackendFactory.create(inspec_runner)
    query = {}
    query[:user_name] = username if username

    response = backend.list_access_keys(query)

    access_keys = response.access_key_metadata.select do |key|
      if access_key_id
        key.access_key_id == access_key_id
      else
        true
      end
    end

    if access_keys.empty?
      @exists = false
      return
    end

    if access_keys.count > 1
      raise 'More than one access key matched for aws_iam_access_key.  Use more specific paramaters, such as access_key_id.'
    end

    @exists = true
    @access_key_id = access_keys[0].access_key_id
    @username = access_keys[0].user_name
    @create_date = access_keys[0].create_date
    @status = access_keys[0].status
    # Last used date is lazily loaded, separate API call
  rescue Aws::IAM::Errors::NoSuchEntity
    @exists = false
  end

  class Backend
    class AwsClientApi < AwsBackendBase
      BackendFactory.set_default_backend(self)
      self.aws_client_class = Aws::IAM::Client

      def list_access_keys(query)
        aws_service_client.list_access_keys(query)
      end
    end
  end
end
