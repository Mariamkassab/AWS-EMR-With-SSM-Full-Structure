output "selected-vpc-id" {
  value = aws_vpc.selected.id
}

output "selected-subnet-id" {
  value = data.aws_subnet.selected.id
}