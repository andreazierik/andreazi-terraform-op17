variable "domain" {
  type        = string
  description = "Nome do dominio"
}

variable "domain_zone_id" {
  type        = string
  description = "Zone ID do dominio cadastrado no Route 53"
}

variable "alb_dns_name" {
  type        = string
  description = "ALB dns name"
}

variable "alb_zone_id" {
  type        = string
  description = "ALB zone id"
}