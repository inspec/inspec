require 'resource_support/aws/aws_singular_resource_mixin'
require 'resource_support/aws/aws_backend_base'
require 'aws-sdk-ec2'

class AwsEbsVolume < Inspec.resource(1)
  name 'aws_ebs_volume'
  desc 'Verifies settings for an EBS volume'

  example <<~EXAMPLE
    describe aws_ebs_volume('vol-123456') do
      it { should be_encrypted }
      its('size') { should cmp 8 }
    end

    describe aws_ebs_volume(name: 'my-volume') do
      its('encrypted') { should eq true }
      its('iops') { should cmp 100 }
    end
  EXAMPLE
  supports platform: 'aws'

  # TODO: rewrite to avoid direct injection, match other resources, use AwsSingularResourceMixin
  def initialize(opts, conn = nil)
    @opts = opts
    @display_name = opts.is_a?(Hash) ? @opts[:name] : opts
    @ec2_client = conn ? conn.ec2_client : inspec_runner.backend.aws_client(Aws::EC2::Client)
    @ec2_resource = conn ? conn.ec2_resource : inspec_runner.backend.aws_resource(Aws::EC2::Resource, {})
  end

  # TODO: DRY up, see https://github.com/chef/inspec/issues/2633
  # Copied from resource_support/aws/aws_resource_mixin.rb
  def catch_aws_errors
    yield
  rescue Aws::Errors::MissingCredentialsError
    # The AWS error here is unhelpful:
    # "unable to sign request without credentials set"
    Inspec::Log.error "It appears that you have not set your AWS credentials. You may set them using environment variables, or using the 'aws://region/aws_credentials_profile' target. See https://www.inspec.io/docs/reference/platforms for details."
    fail_resource('No AWS credentials available')
  rescue Aws::Errors::ServiceError => e
    fail_resource(e.message)
  end

  # TODO: DRY up, see https://github.com/chef/inspec/issues/2633
  # Copied from resource_support/aws/aws_singular_resource_mixin.rb
  def inspec_runner
    # When running under inspec-cli, we have an 'inspec' method that
    # returns the runner. When running under unit tests, we don't
    # have that, but we still have to call this to pass something
    # (nil is OK) to the backend.
    # TODO: remove with https://github.com/chef/inspec-aws/issues/216
    # TODO: remove after rewrite to include AwsSingularResource
    inspec if respond_to?(:inspec)
  end

  def id
    return @volume_id if defined?(@volume_id)
    catch_aws_errors do
      if @opts.is_a?(Hash)
        first = @ec2_resource.volumes(
          {
            filters: [{
              name: 'tag:Name',
              values: [@opts[:name]],
            }],
          },
        ).first
        # catch case where the volume is not known
        @volume_id = first.id unless first.nil?
      else
        @volume_id = @opts
      end
    end
  end
  alias volume_id id

  def exists?
    !volume.nil?
  end

  def encrypted?
    volume.encrypted
  end

  # attributes that we want to expose
  %w{
    availability_zone encrypted iops kms_key_id size snapshot_id state volume_type
  }.each do |attribute|
    define_method attribute do
      catch_aws_errors do
        volume.send(attribute) if volume
      end
    end
  end

  # Don't document this - it's a bit hard to use.  Our current doctrine
  # is to use dumb things, like arrays of strings - use security_group_ids instead.
  def security_groups
    catch_aws_errors do
      @security_groups ||= volume.security_groups.map { |sg|
        { id: sg.group_id, name: sg.group_name }
      }
    end
  end

  def security_group_ids
    catch_aws_errors do
      @security_group_ids ||= volume.security_groups.map(&:group_id)
    end
  end

  def tags
    catch_aws_errors do
      @tags ||= volume.tags.map { |tag| { key: tag.key, value: tag.value } }
    end
  end

  def to_s
    "EBS Volume #{@display_name}"
  end

  private

  def volume
    catch_aws_errors { @volume ||= @ec2_resource.volume(id) }
  end
end
