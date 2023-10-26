output "emr_master_security_group" {
  value = aws_security_group.emr_master.id
}

output "emr_slave_security_group" {
  value = aws_security_group.emr_slave.id
}

output "service_access_security_group" {
  value = aws_security_group.emr-service-access-sg.id
}