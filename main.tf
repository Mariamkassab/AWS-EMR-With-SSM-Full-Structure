module "terraform_vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  gw_name  = var.gw_name
}

module "terraform_subnet" {
  source         = "./modules/subnet"
  created_vpc_id = module.terraform_vpc.vpc_id
  subnet_cidr    = var.subnet_cidr
  az             = var.az
  subnet_name    = var.subnet_name
}

module "nat_gateway" {
  source           = "./modules/nat"
  public_subnet_id = module.terraform_subnet.first_pub_id
  nat_name         = var.nat_name
}

module "public_routing_table" {
  source         = "./modules/route_table"
  created_vpc_id = module.terraform_vpc.vpc_id
  wanted_cidr    = var.pub-wanted-cidr 
  needed_gatway  = module.terraform_vpc.internet_gateway_id
  table_name     = var.pub-table-name
  chosen_subnets  = [module.terraform_subnet.first_pub_id]
   } 


module "private_routing_table" {
  source         = "./modules/route_table"
  created_vpc_id = module.terraform_vpc.vpc_id
  wanted_cidr    = var.pri-wanted-cidr 
  needed_gatway  = module.nat_gateway.nat_id
  table_name     = var.pri-table-name 
  chosen_subnets  = [module.terraform_subnet.first_pri_id]
   } 




module "iam" {
  source = "./modules/EMR-cluster/iam"
}

module "security-groups" {
  source              = "./modules/EMR-cluster/security-groups"
  vpc_id              = module.terraform_vpc.vpc_id
  ingress_cidr_blocks = var.ingress_cidr_blocks
}

module "s3-emr-logs" {
  source           = "./modules/EMR-cluster/s3-emr-logs"
}

module "ec2-key-creation" {
  source = "./modules/EMR-cluster/ec2-key"
  key_name                  = var.key_name
}


module "emr" {
  source                    = "./modules/EMR-cluster/EMR"
  name                      = var.name
  release_label             = var.release_label
  applications              = var.applications
  s3_bucket                 = module.s3-emr-logs.s3_uri
  subnet_id                 = module.terraform_subnet.first_pri_id
  key_name                  = var.key_name
  service_access_security_group = module.security-groups.service_access_security_group
  master_instance_type      = var.master_instance_type
  master_ebs_size           = var.master_ebs_size
  core_instance_type        = var.core_instance_type
  core_instance_count       = var.core_instance_count
  core_ebs_size             = var.core_ebs_size
  emr_master_security_group = module.security-groups.emr_master_security_group
  emr_slave_security_group  = module.security-groups.emr_slave_security_group
  emr_ec2_instance_profile  = module.iam.emr_ec2_instance_profile
  emr_service_role          = module.iam.emr_service_role
  emr_autoscaling_role      = module.iam.emr_autoscaling_role
}