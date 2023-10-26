data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    #cidr_block = ""
    values = ["jlr-gdd-vcdp-developers-vpc"]
  }
}

data "aws_subnet" "selected" {
  filter {
    name = "tag:Name"
    #cidr_block = ""
    values = ["jlr-gdd-vcdp-developers-vpc"]
  }
}
