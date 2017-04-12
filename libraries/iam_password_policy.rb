# author: Viktor Yakovlyev

require 'aws_conn'

class IamPasswordPolicy < Inspec.resource(1)
  name 'iam_password_policy'
  desc 'Verifies iam password policy'

  example "
    describe iam_password_policy('i-123456') do
      its('requires_lowercase_letters?') { should be true }
    end

    describe iam_password_policy('i-123456') do
      its('requires_uppercase_letters?') { should be true }
    end
  "

  def initialize(conn = AWSConnection.new)
    @policy = conn.iam_resource.account_password_policy
  rescue Aws::IAM::Errors::NoSuchEntity
    @policy = nil
  end

  def exists?
    !@policy.nil?
  end

  def requires_lowercase_characters?
    @policy.require_lowercase_characters
  end

  def requires_uppercase_characters?
    @policy.require_uppercase_characters
  end

  def minimum_password_length
    @policy.minimum_password_length
  end

  def requires_numbers?
    @policy.require_numbers
  end

  def requires_symbols?
    @policy.require_symbols
  end

  def allows_users_to_change_password?
    @policy.allow_users_to_change_password
  end
end
