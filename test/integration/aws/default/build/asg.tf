// This configuration is shared for Auto Scaling Group, Auto Scaling Launch configuration,
// Auto Scaling life cycle hooks
resource "aws_autoscaling_group" "asg" {
  name                      = "TestASG"
  max_size                  = 5
  min_size                  = 1  
  health_check_type         = "EC2"
  desired_capacity          = 2
  
  launch_configuration      = "${aws_launch_configuration.testASG.name}"
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

resource "aws_launch_configuration" "testASG" {
  name          = "TestLaunchConfiguration"
  image_id           = "${data.aws_ami.debian.id}"
  instance_type = "t2.micro"
}

output "launch_configuration_test_name" {
  value = "${aws_launch_configuration.testASG.name}"
}