resource "aws_security_group" "emr_master" {
  name                   = "EMR_master_security_group"
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = true

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EMR_master_security_group"
  }
}

resource "aws_security_group" "emr_slave" {
  name                   = "EMR_slave_security_group"
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = true

  ingress {
    from_port   = 30555
    to_port     = 30555
    protocol    = "tcp"
    cidr_blocks = ["45.247.161.69/32"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EMR_slave_security_group"
  }
}

# resource "aws_security_group" "emr-service-access-sg" {
#   name         = "emr-service-access-sg"
#   vpc_id       = var.vpc_id
#   ingress {
#     from_port   = 0   # need updates
#     to_port     = 0
#     protocol    = "-1"
#     security_groups = [aws_security_group.emr_master.id]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "emr-service-access-sg"
#   }

# }