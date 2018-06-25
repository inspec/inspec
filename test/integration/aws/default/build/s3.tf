#=================================================================#
#                          S3 Bucket
#=================================================================#

resource "aws_s3_bucket" "public" {
  bucket        = "inspec-testing-public-${terraform.env}.chef.io"
  acl           = "public-read"
}

output "s3_bucket_public_name" {
  value = "${aws_s3_bucket.public.id}"
}

output "s3_bucket_public_region" {
  value = "${aws_s3_bucket.public.region}"
}

resource "aws_s3_bucket" "private" {
  bucket        = "inspec-testing-private-${terraform.env}.chef.io"
  acl           = "private"
}

output "s3_bucket_private_name" {
  value = "${aws_s3_bucket.private.id}"
}

resource "aws_s3_bucket" "public_bucket_for_objects" {
  bucket        = "inspec-testing-public-objects-${terraform.env}.chef.io"
  acl           = "public-read"
}

output "s3_bucket_public_for_objects" {
  value = "${aws_s3_bucket.public_bucket_for_objects.id}"
}

resource "aws_s3_bucket" "auth" {
  bucket        = "inspec-testing-auth-${terraform.env}.chef.io"
  acl           = "authenticated-read"
}

output "s3_bucket_auth_name" {
  value = "${aws_s3_bucket.auth.id}"
}

resource "aws_s3_bucket" "private_acl_public_policy" {
  bucket        = "inspec-testing-mixed-01-${terraform.env}.chef.io"
  acl           = "private"
}

output "s3_bucket_private_acl_public_policy_name" {
  value = "${aws_s3_bucket.private_acl_public_policy.id}"
}


resource "aws_s3_bucket" "log_bucket" {
  bucket        = "inspec-testing-log-bucket-${terraform.env}.chef.io"
  force_destroy = true
  acl           = "log-delivery-write"
}

output "s3_bucket_log_bucket_name" {
  value = "${aws_s3_bucket.log_bucket.id}"
}

resource "aws_s3_bucket" "acess_logging_enabled" {
  bucket = "inspec-testing-acess-logging-enabled-${terraform.env}.chef.io"
  acl    = "private"

  logging {
    target_bucket = "${aws_s3_bucket.log_bucket.id}"
    target_prefix = "log/"
  }
}

output "s3_bucket_access_logging_enabled_name" {
  value = "${aws_s3_bucket.acess_logging_enabled.id}"
}

resource "aws_s3_bucket" "acess_logging_not_enabled" {
  bucket = "inspec-testing-acess-logging-not-enabled-${terraform.env}.chef.io"
  acl    = "private"
}

output "s3_bucket_access_logging_not_enabled_name" {
  value = "${aws_s3_bucket.acess_logging_not_enabled.id}"
}

resource "aws_s3_bucket" "default_encryption_enabled" {
  bucket = "inspec-testing-defencrypt-enabled-${terraform.env}.chef.io"
  acl    = "private"

  server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm     = "aws:kms"
        }
      }
    }
}

output "s3_bucket_default_encryption_enabled_name" {
  value = "${aws_s3_bucket.default_encryption_enabled.id}"
}

resource "aws_s3_bucket" "default_encryption_not_enabled" {
  bucket = "inspec-testing-defencrypt-not-enabled-${terraform.env}.chef.io"
  acl    = "private"
}

output "s3_bucket_default_encryption_not_enabled_name" {
  value = "${aws_s3_bucket.default_encryption_not_enabled.id}"
}

#=================================================================#
#                       S3 Bucket Policies
#=================================================================#
resource "aws_s3_bucket_policy" "allow" {
  bucket = "${aws_s3_bucket.public.id}"
  policy =<<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.public.id}/*"
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_policy" "deny" {
  bucket = "${aws_s3_bucket.private.id}"
  policy =<<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyGetObject",      
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.private.id}/*"
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_policy" "allow-02" {
  bucket = "${aws_s3_bucket.private_acl_public_policy.id}"
  policy =<<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.private_acl_public_policy.id}/*"
    }
  ]
}
POLICY
}

#=================================================================#
#                       S3 Bucket Object
#=================================================================#
resource "aws_s3_bucket_object" "inspec_logo_public" {
  bucket = "${aws_s3_bucket.public_bucket_for_objects.id}"
  key    = "inspec-logo-public"
  source = "inspec-logo.png"
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "inspec_logo_private" {
  bucket = "${aws_s3_bucket.public_bucket_for_objects.id}"
  key    = "inspec-logo-private"
  source = "inspec-logo.png"
  acl    = "private"
}

output "s3_bucket_object_inspec_logo_public" {
  value = "${aws_s3_bucket_object.inspec_logo_public.id}"
}

output "s3_bucket_object_inspec_logo_private" {
  value = "${aws_s3_bucket_object.inspec_logo_private.id}"
}