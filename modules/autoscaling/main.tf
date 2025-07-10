resource "aws_autoscaling_group" "web_asg" {
  name                      = "resume-asg"
  desired_capacity          = 2
  max_size                  = 3
  min_size                  = 1
  vpc_zone_identifier       = var.vpc_zone_identifier
  target_group_arns         = [var.target_group_arn]
  health_check_type         = "EC2"
  health_check_grace_period = 30

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "resume-asg-instance"
    propagate_at_launch = true
  }
}
