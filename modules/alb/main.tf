resource "aws_security_group" "alb-sg" {
  name   = "${var.projeto}-alb-sg"
  vpc_id = var.vpcid

  tags = {
    Name = "${var.projeto}-alb-sg"
  }
}

resource "aws_security_group_rule" "alb-http-sg-ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.alb-sg.id
  cidr_blocks       = var.any-ip
}

resource "aws_security_group_rule" "alb-https-sg-ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.alb-sg.id
  cidr_blocks       = var.any-ip
}

# REGRA DE SAIDA PADRAO
resource "aws_security_group_rule" "alb_egress_traffic" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.alb-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_lb_target_group" "projeto17-tg" {
  name     = "${var.projeto}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpcid


  health_check {
    enabled             = true
    port                = 80
    interval            = 50
    protocol            = "HTTPS"
    path                = "/"
    matcher             = "200-299"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb" "projeto17-alb" {
  name               = "${var.projeto}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]

  subnets = var.public-subnets-ids

  access_logs {
    bucket  = var.bucket-name
    enabled = true
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.projeto17-alb.arn
  port              = "80"
  protocol          = "HTTP"

  # default_action {
  #   type             = "forward"
  #   target_group_arn = aws_lb_target_group.projeto17-tg.arn
  # }

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "alb_listener_tls" {
  load_balancer_arn = aws_lb.projeto17-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.acm_arn
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.projeto17-tg.arn
  }
}