#===========================================================================#
#                                 KMS Key
#===========================================================================#

resource "aws_kms_key" "kms_key_1" {
  description             = "${terraform.env}-kms_key_1"
  deletion_window_in_days = 10
  key_usage               = "ENCRYPT_DECRYPT"
  is_enabled              = true
  enable_key_rotation     = true
}

resource "aws_kms_key" "kms_key_2" {
  description             = "${terraform.env}-kms_key_2"
  deletion_window_in_days = 10
  key_usage               = "ENCRYPT_DECRYPT"
  is_enabled              = false
  enable_key_rotation     = false
}

output "kms_key_recall_hit_arn" {
  value = "${aws_kms_key.kms_key_1.arn}"
}

output "kms_key_enabled_key_id" {
  value = "${aws_kms_key.kms_key_1.key_id}"
}

output "kms_key_disabled_key_id" {
  value = "${aws_kms_key.kms_key_2.key_id}"
}

output "kms_key_enabled_key_description" {
  value = "${terraform.env}-kms_key_1"
}

output "kms_key_enabled_arn" {
  value = "${aws_kms_key.kms_key_1.arn}"
}

output "kms_key_disabled_arn" {
  value = "${aws_kms_key.kms_key_2.arn}"
}
