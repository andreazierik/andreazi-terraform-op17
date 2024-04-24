data "aws_vpc" "default_vpc" {
  id = var.vpcid
}

data "aws_subnets" "public-subnets" {
  filter {
    name   = "tag:Name"
    values = ["Public-*"]
  }
}

data "aws_subnets" "private-subnets" {
  filter {
    name   = "tag:Name"
    values = ["Private-*"]
  }
}

module "launch-template" {
  source = "./modules/launch-templates"

  projeto = var.projeto

  # security group
  vpcid  = var.vpcid
  alb-sg = module.alb.alb-sg

  # instancia
  key-pair      = var.key-pair
  instance_type = var.instance_type
}

module "alb" {
  source = "./modules/alb"

  projeto = var.projeto

  # security group
  vpcid  = var.vpcid
  any-ip = [ var.any-ip ]

  public-subnets-ids = data.aws_subnets.public-subnets.ids
  bucket-name        = var.bucket-name
}

module "rds" {
  source = "./modules/rds"

  projeto = var.projeto

  # subnet groups
  private_subnets = data.aws_subnets.private-subnets.ids

  # security group
  vpcid = var.vpcid

  # rds sql server
  db_engine         = var.db_engine
  db_engine_version = var.db_engine_version
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance       = var.db_instance
}