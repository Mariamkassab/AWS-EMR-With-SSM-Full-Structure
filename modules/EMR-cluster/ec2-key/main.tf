resource "tls_private_key" "tls_private_k" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.tls_private_k.public_key_openssh
}


resource "local_file" "private_key_file" {
  filename = "./ec2-key.pem"
  content  = tls_private_key.tls_private_k.private_key_pem
}