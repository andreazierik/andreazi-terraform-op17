variable "projeto" {
  type        = string
  description = "Nome do projeto"
}

variable "vpcid" {
  type        = string
  description = "ID da VPC"
}

variable "any-ip" {
  type        = list(string)
  description = "IP corringa"
}

variable "public-subnets-ids" {
  type        = list(string)
  description = "IDs das subnets publicas para associar ao ALB"
}

variable "bucket-name" {
  type        = string
  description = "Bucket para armazenar os logs"
}

variable "acm_arn" {
  type        = string
  description = "ARN do ACM"
}