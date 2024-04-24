# SECURITY GROUP PARA ADICIONAR NA EC2
resource "aws_security_group" "lt-security-group" {
  name   = "${var.projeto}-lt-sg"
  vpc_id = var.vpcid

  tags = {
    Name = "${var.projeto}-lt-sg"
  }
}

resource "aws_security_group_rule" "ingress-ec2" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.lt-security-group.id
  source_security_group_id = var.alb-sg
}

# # REGRA DE SAIDA PADRAO
# resource "aws_security_group_rule" "lt-security-group_egress_traffic" {
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   security_group_id = aws_security_group.lt-security-group.id
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# FILTRAR AS AMI DA MINHA CONTA, PEGANDO PELA TAG NAME
data "aws_ami" "app-projeto17" {
  most_recent = true

  filter {
    name   = "name"
    values = ["app-projeto17"]
  }

  owners = ["self"]
}

# CRIANDO LAUCH TEMPLATE
resource "aws_launch_template" "lt-config" {
  name                   = "${var.projeto}-lt"
  image_id               = data.aws_ami.app-projeto17.id
  key_name               = var.key-pair
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.lt-security-group.id]

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      delete_on_termination = true
      encrypted             = true
      volume_size           = 12
      volume_type           = "gp3"
    }
  }

  tags = {
    Name = "${var.projeto}-lt"
  }
}