#aws region
aws-region = "us-east-1" 

# vpc & internet gatway
vpc_cidr = "10.0.0.0/16"
vpc_name = "terraform vpc"
gw_name  = "terraform internet gateway"

# subnets
subnet_cidr    = ["10.0.0.0/24", "10.0.2.0/24"]
az             = ["us-east-1a", "us-east-1a"] 
subnet_name    = ["pub_sub1_az1", "private_sub1_az1"]

# nat
nat_name         = "nat_gateway"

# route tables 
pub-wanted-cidr = "0.0.0.0/0"
pub-table-name = "public_rt"

pri-wanted-cidr = "0.0.0.0/0"
pri-table-name = "private_rt"

# security groups
ingress_cidr_blocks = "0.0.0.0/0"  # should change



#emr
name = "mohan-emr-app"
release_label = "emr-6.14.0"
applications = ["Spark", "Hue", "Flink", "Trino"] 
key_name = "vault"

# Master configurations
master_instance_type = "r5.4xlarge"
master_ebs_size = "100"

# Slave configurations
core_instance_type = "m5.xlarge"
core_instance_count = 1
core_ebs_size = "100"

# s3 bucket name 
bucket_name = "emr-logs-mohan"

