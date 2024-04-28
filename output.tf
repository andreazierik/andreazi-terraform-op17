output "rds-endpoint" {
  value = "Endpoint do banco de dados SQL Server: ${module.rds.rds-endpoint}"
}

output "app" {
  value = "URL para acessar a aplicacao: https://${module.acm.app}/"
}