resource "aws_security_group" "emr_master" {
  name                   = "EMR_master_security_group"
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = true

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks]
  }

  ingress {
    from_port   = 4040
    to_port     = 4040
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks]
  }

  ingress {
    from_port   = 8888
    to_port     = 8888
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks]
  }

  ingress {
    from_port   = 20888
    to_port     = 20888
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks]
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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks]
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

resource "aws_security_group" "emr-service-access-sg" {
  name         = "emr-service-access-sg"
  vpc_id       = var.vpc_id
  ingress {
    from_port   = 9443
    to_port     = 9443
    protocol    = "tcp"
    security_groups = [aws_security_group.emr_master.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
  ignore_changes = [ ingress, egress ]
  }

  tags = {
    Name = "emr-service-access-sg"
  }

}