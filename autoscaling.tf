resource "aws_autoscaling_group" "web" {
  name             = "web-asg"
  desired_capacity = 2
  min_size         = 1
  max_size         = 3
  vpc_zone_identifier = [
    aws_subnet.private.id,
    aws_subnet.private_2.id
  ]

  target_group_arns = [
    aws_lb_target_group.web_tg.arn
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "terraform-asg-ec2"
    propagate_at_launch = true
  }
}