# AWS EMR Cluster with SSM Integration - Full Structure

## Overview

This Terraform project automates the deployment of an AWS EMR (Elastic MapReduce) cluster with an integrated AWS Systems Manager (SSM) for centralized management and monitoring. The project aims to simplify the setup process of an EMR cluster while enhancing security and operational efficiency through SSM.

## Features

- **EMR Cluster Provisioning**: Automates the creation of an EMR cluster with configurable settings such as instance types, instance counts, and software configurations.
  
- **Private Subnet Deployment**: Deploys the EMR cluster within a private subnet to restrict external access and enhance security.
  
- **SSM Integration**: Configures SSM agent on EMR instances and establishes associations with SSM documents for seamless management and automation.
  
- **IAM Role Configuration**: Defines IAM roles and policies required for SSM access, EMR service roles, and instance profile roles.

## Project Structure

The project directory structure is as follows:

- `main.tf`: Defines the Terraform resources for VPC, subnets, security groups, IAM roles, SSM documents, and EMR cluster configuration.

- `variables.tf`: Contains input variables used to customize the EMR cluster settings, VPC configuration, and SSM documents.

- `outputs.tf`: Specifies the output values to display after the Terraform apply, including EMR cluster details and SSM association information.

- `modules/`: Contains Terraform modules for modularizing the infrastructure configuration.
  
- `terraform.tfvars`: Contains variable definitions used to customize the Terraform configuration. This file should be created manually and populated with values before running Terraform commands.

- `provider.tf`: Contains the provider configuration for AWS. Specifies the AWS provider version and region.

## Getting Started

## Prerequisites

Before you begin, ensure you have:

- An AWS account
- AWS CLI configured with appropriate credentials
- Terraform installed locally
- Session-Manager-plugin

Additionally, you need to have your AWS credentials configured either via `~/.aws/credentials` or environment variables.

## Usage

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/Mariamkassab/AWS-EMR-With-SSM-Full-Structure
    ```

2. Navigate to the cloned directory:

    ```bash
    cd AWS-EMR-With-SSM-Full-Structure
    ```

3. Initialize Terraform:

    ```bash
    terraform init
    ```

4. Modify `variables.tf` to set your desired configurations for the EMR cluster.

5. Review and modify other Terraform files (`main.tf`, `outputs.tf`, etc.) as needed to match your requirements.

6. Apply the Terraform configuration to create the resources:

    ```bash
    terraform apply
    ```

7. After successful creation, access your EMR cluster via the AWS Management Console or CLI:
    ```bash
    aws ssm start-session \
        --target ${instance-id}
    ```


## Clean Up

To avoid incurring charges, it's essential to destroy the resources when they are no longer needed:

```bash
terraform destroy
```



![image](https://github.com/Mariamkassab/AWS-EMR-With-SSM-Full-Structure/assets/123699968/370ce08e-f2dd-4e57-8dd0-bcabe7bc794b)
