# author: Christoph Hartmann
class AwsEbsVolume < Inspec.resource(1)
  name 'aws_ebs_volume'
  desc 'Verifies settings for an EC2 volume'

  example <<-EOX
    describe aws_ebs_volume('i-123456') do
      it { should be_encrypted }
      its('size') { should = 8 }
    end

    describe aws_ebs_volume(name: 'my-volume') do
      its('encrypted') { should eq true }
      its('iops') { should cmp 100 }
    end
EOX
  supports platform: 'aws'

  # TODO: rewrite to avoid direct injection, match other resources, use AwsSingularResourceMixin
  def initialize(opts, conn = nil)
    @opts = opts
    @opts.is_a?(Hash) ? @display_name = @opts[:name] : @display_name = opts
    @ec2_client = conn ? conn.ec2_client : inspec_runner.backend.aws_client(Aws::EC2::Client)
    @ec2_resource = conn ? conn.ec2_resource : inspec_runner.backend.aws_resource(Aws::EC2::Resource, {})
    @iam_resource = conn ? conn.iam_resource : inspec_runner.backend.aws_resource(Aws::IAM::Resource, {})
  end

  # TODO: DRY up, see https://github.com/chef/inspec/issues/2633
  # Copied from resource_support/aws/aws_resource_mixin.rb
  def catch_aws_errors
    yield
  rescue Aws::Errors::MissingCredentialsError
    # The AWS error here is unhelpful:
    # "unable to sign request without credentials set"
    Inspec::Log.error "It appears that you have not set your AWS credentials.  You may set them using environment variables, or using the 'aws://region/aws_credentials_profile' target.  See https://www.inspec.io/docs/reference/platforms for details."
    fail_resource('No AWS credentials available')
  rescue Aws::Errors::ServiceError => e
    fail_resource e.message
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
    return false if volume.nil?
    volume.exists?
  end

  def encrypted?
    volume.encrypted
  end

  # attributes that we want to expose
  %w{
    encrypted size iops
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
    "EC2 Volume #{@display_name}"
  end

  private

  def volume
    catch_aws_errors { @volume ||= @ec2_resource.volume(id) }
  end
end
