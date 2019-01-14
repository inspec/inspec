// This configuration is shared for Auto Scaling Group, Auto Scaling Launch configuration,
// Auto Scaling life cycle hooks
resource "aws_autoscaling_group" "asg" {
  name                      = "TestASG"
  max_size                  = 5
  min_size                  = 2  
  health_check_type         = "EC2"
  desired_capacity          = 4
  
  launch_configuration      = "${aws_launch_configuration.testASG.name}"
  vpc_zone_identifier       = ["${aws_subnet.subnet_01.id}"]

  
  tag {
    key                 = "Application"
    value               = "TestApplication"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Test"
    propagate_at_launch = false
  }

  depends_on  = [ "aws_subnet.subnet_01" ]
}

resource "aws_launch_configuration" "testASG" {
  name          = "TestLaunchConfiguration"
  image_id           = "${data.aws_ami.debian.id}"
  instance_type = "t2.micro"
}