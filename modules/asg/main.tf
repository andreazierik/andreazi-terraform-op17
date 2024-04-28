resource "aws_autoscaling_group" "projeto17-app" {
  name                = "${var.projeto}-asg"
  desired_capacity    = var.desired_capacity
  max_size            = var.max_capacity
  min_size            = var.min_capacity
  vpc_zone_identifier = var.private_subnets_ids
  target_group_arns   = var.tg_arn
  health_check_type   = "EC2"

  launch_template {
    id      = var.lt_id
    version = var.lt_version
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["desired_capacity"]
  }

  tag {
    key                 = "Name"
    value               = "${var.projeto}-app"
    propagate_at_launch = true
  }
}