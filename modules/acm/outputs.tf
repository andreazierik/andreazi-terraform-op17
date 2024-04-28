output "acm_arn" {
  value       = aws_acm_certificate.app.arn
  description = "ACM ARN para configurar no ALB"
}

output "app" {
  value = aws_route53_record.app.name
  description = "Exportando record"
}