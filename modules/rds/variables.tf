variable "projeto" {
  type        = string
  description = "Nome do projeto"
}

variable "vpcid" {
  type        = string
  description = "ID da VPC"
}

variable "private_subnets" {
  type        = list(string)
  description = "Subnets privadas"
}

variable "db_engine" {
  type        = string
  description = "DB engine"
}

variable "db_engine_version" {
  type        = string
  description = "DB engine version"
}

variable "db_username" {
  type        = string
  description = "Username padrao"
}

variable "db_password" {
  type        = string
  description = "Password padrao"
}

variable "db_instance" {
  type        = string
  description = "Tipo da instancia pro SQL Server"
}