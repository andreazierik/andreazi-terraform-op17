data "aws_vpc" "default_vpc" {
    id = var.vpcid
}

data "aws_subnets" "public-subnets" {
  filter {
    name   = "tag:Name"
    values = ["Public-*"]
  }
}