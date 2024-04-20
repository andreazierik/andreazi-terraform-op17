# CRIAR SUBNET GROUPS PARA UTILIZAR NO RDS
resource "aws_db_subnet_group" "private_subnet_group" {
  name       = "${var.projeto}_db_subnet_group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "${var.projeto}_db_subnet_group"
  }
}

# SECURY GROUP PADRAO
resource "aws_security_group" "rds-sqlserver-sg" {
  name   = "${var.projeto}_sg_sqlserver"
  vpc_id = var.vpcid

  tags = {
    Name = "${var.projeto}_sg_sqlserver"
  }
}

# CRIACAO DO RDS UTILIZANDO O SQL SERVER
resource "aws_db_instance" "rds-sqlserver" {
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  multi_az               = false
  identifier             = "${var.projeto}-sqlserver"
  username               = var.db_username
  password               = var.db_password
  instance_class         = var.db_instance
  db_subnet_group_name   = aws_db_subnet_group.private_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds-sqlserver-sg.id]
  skip_final_snapshot    = true
  allocated_storage      = 20
  storage_type           = "gp3"

  tags = {
    Name = "${var.projeto}_sql_server_${var.db_engine_version}"
  }
}