output "alb-sg" {
  value       = aws_security_group.alb-sg.id
  description = "ID do SG configurado no ALB"
}