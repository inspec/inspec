// This configuration is shared for Auto Scaling Group, Auto Scaling Launch configuration,
// Auto Scaling life cycle hooks
resource "aws_autoscaling_group" "asg" {
  name                      = "TestASG"
  max_size                  = 5
  min_size                  = 1  
  health_check_type         = "EC2"
  desired_capacity          = 2
  
  launch_configuration      = "${aws_launch_configuration.testLC.name}"
  vpc_zone_identifier       = ["${aws_subnet.subnet_01.id}"]

  // We don't care about the instances registered with the ASG
  // for now
  wait_for_capacity_timeout = 0

  
  tag {
    key                 = "Application"
    value               = "TestApplication"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Test"
    propagate_at_launch = true
  }

  depends_on  = [ "aws_subnet.subnet_01" ]
}

output "auto_scaling_group_test_name" {
  value = "${aws_autoscaling_group.asg.name}"
}

resource "aws_launch_configuration" "testLC" {
  name          = "TestLaunchConfiguration"
  image_id      = "${data.aws_ami.debian.id}"
  instance_type = "t2.micro"
  user_data = "#!/bin/bash"
  spot_price = "0.1"

  iam_instance_profile = "${aws_iam_instance_profile.profile_for_ec2_with_role.name}"
  key_name = "${aws_key_pair.lc_test.key_name}"
  
  security_groups = [
      "${aws_security_group.alpha.id}",
      "${aws_security_group.beta.id}",
  ]

}

output "launch_configuration_test_name" {
  value = "${aws_launch_configuration.testLC.name}"
}

resource "aws_key_pair" "lc_test" {
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDu2e1yuAhwxnWbh6qZeGrr1qcNutz+fqIrn5Kfi+7GTp6BGFGz2vnRRhAkTlKGEMrWJQJqclANw522ZS+3iraVTFGoW7y5diRYUY534B0g3soQpgBuM8U8K/FgDQHa58AZjqVujempeBOz264K+Dwd4NI9NlUcHIKYqcwB1EEAr/EKj+fqoClELjdCUsbdQKjdCYCXn0RLBhtXh9yC8UY3BP5GTACPxK5FxrBTyxutyTkNSjSEgsDruN2Yqw9iK2R3jVfO2d7h2B60v+43SiPcOwCE+x1EmLonIRWjRuyoIK/GIsZgbHF2n2JOMNZVRB/eqdwSI2BdLf9CJPT5SkB3"
}

output "key_pair_test_name" {
    value = "${aws_key_pair.lc_test.key_name}"
}