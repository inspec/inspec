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
