output "alb-sg" {
  value       = aws_security_group.alb-sg.id
  description = "ID do SG configurado no ALB"
}

output "dns_name" {
  value       = aws_lb.projeto17-alb.dns_name
  description = "ALB dns name"
}

output "zone_id" {
  value       = aws_lb.projeto17-alb.zone_id
  description = "ALB zone id"
}

output "tg_arn" {
  value       = aws_lb_target_group.projeto17-tg.arn
  description = "ARN para configurar no modulo ASG"
}