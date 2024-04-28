output "lt_id" {
  value       = aws_launch_template.lt-config.id
  description = "ID do Launch Template par aconfigurar no ASG"
}

output "lt_version" {
  value       = aws_launch_template.lt-config.latest_version
  description = "Versao do Launch Template"
}

output "sg_id" {
  value = aws_security_group.lt-security-group.id
  description = "ID do SG para configurar no RDS"
}