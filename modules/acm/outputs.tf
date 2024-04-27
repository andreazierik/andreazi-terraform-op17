output "acm_arn" {
  value       = aws_acm_certificate.app.arn
  description = "ACM ARN para configurar no ALB"
}