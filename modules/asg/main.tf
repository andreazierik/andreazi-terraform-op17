resource "aws_autoscaling_group" "projeto17-app" {
  name     = "${var.projeto}-asg"
  min_size = var.min-capacity
  max_size = var.max-capacity

  health_check_type = "EC2"

  vpc_zone_identifier = var.public-subnets-ids

  target_group_arns = []
}

resource "aws_autoscaling_policy" "projeto17-app-scaling" {
  name        = var.projeto
  policy_type = "TargetTrackingScaling"
}