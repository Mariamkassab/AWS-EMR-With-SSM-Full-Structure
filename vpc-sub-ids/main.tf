data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    #cidr_block = ""
    values = ["my_vpc_name"]
  }
}

data "aws_subnet" "selected" {
  filter {
    name = "tag:Name"
    #cidr_block = ""
    values = ["my_subnet_name"]
  }
}
