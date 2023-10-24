
# provider
variable "aws-region" {
  type = string
}


#vpc
variable "vpc_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "gw_name" {
  type = string
}


#subnets
variable "subnet_cidr" {
    type = list  
}
variable "subnet_name" {
  type = list
}
variable "az" {
  type = list
}


#nat
variable "nat_name" {
  type = string
}


#public rt
variable "pub-wanted-cidr" {
  type = string
}
variable "pub-table-name" {
  type = string
}

#private rt
variable "pri-wanted-cidr" {
  type = string
}
variable "pri-table-name" {
  type = string
}


#security-group
variable "ingress_cidr_blocks" {}


# emr cluster
variable "name" {}
variable "release_label" {}
variable "applications" {
  type = list
}
variable "key_name" {}
variable "master_instance_type" {}
variable "master_ebs_size" {}
variable "core_instance_type" {}
variable "core_instance_count" {}
variable "core_ebs_size" {}



