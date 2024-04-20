output "rds-endpoint" {
  value = aws_db_instance.rds-sqlserver.endpoint
  description = "Endpoint para conexao no SQL Server"
}