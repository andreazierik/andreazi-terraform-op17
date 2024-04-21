variable "projeto" {
  type        = string
  description = "Nome do projeto"
}

variable "vpcid" {
  type        = string
  description = "ID da VPC"
}

variable "key-pair" {
  type        = string
  description = "Key Pair para conexao"
}

variable "instance_type" {
  type        = string
  description = "Tipo de instancia pro lauch template"
}