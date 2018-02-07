# Main AWS loader file.  The intent is for this to be
# loaded only if AWS resources are needed.

require 'aws-sdk' # TODO: split once ADK v3 is in use

require 'resource_support/aws/aws_backend_factory_mixin'
require 'resource_support/aws/aws_resource_mixin'
require 'resource_support/aws/aws_connection'

# Load all AWS resources
# TODO: loop over and load entire directory
# for f in ls lib/resources/aws/*; do t=$(echo $f | cut -c 5- | cut -f1 -d. ); echo "require '${t}'"; done
require 'resources/aws/aws_cloudtrail_trail'
require 'resources/aws/aws_cloudtrail_trails'
require 'resources/aws/aws_cloudwatch_alarm'
require 'resources/aws/aws_cloudwatch_log_metric_filter'
require 'resources/aws/aws_ec2_instance'
require 'resources/aws/aws_ec2_security_group'
require 'resources/aws/aws_ec2_security_groups'
require 'resources/aws/aws_iam_access_key'
require 'resources/aws/aws_iam_access_keys'
require 'resources/aws/aws_iam_group'
require 'resources/aws/aws_iam_groups'
require 'resources/aws/aws_iam_password_policy'
require 'resources/aws/aws_iam_policies'
require 'resources/aws/aws_iam_policy'
require 'resources/aws/aws_iam_role'
require 'resources/aws/aws_iam_root_user'
require 'resources/aws/aws_iam_user'
require 'resources/aws/aws_iam_users'
require 'resources/aws/aws_kms_keys'
require 'resources/aws/aws_s3_bucket'
require 'resources/aws/aws_sns_topic'
require 'resources/aws/aws_vpc'
require 'resources/aws/aws_vpcs'