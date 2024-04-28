variable "projeto" {
  type        = string
  description = "Nome do projeto"
}

variable "desired_capacity" {
  type        = string
  description = "Capacidade desejada"
}

variable "max_capacity" {
  type        = string
  description = "Capacidade maxima desejada"
}

variable "min_capacity" {
  type        = string
  description = "Capacidade minima desejada"
}

variable "private_subnets_ids" {
  type        = list(string)
  description = "Zonas de disponibilidades"
}

variable "tg_arn" {
  type        = list(string)
  description = "ARN do Target Group"
}

variable "lt_id" {
  type        = string
  description = "ID do Taget Group"
}

variable "lt_version" {
  type        = string
  description = "Versao do Launch Template"
}