# AWS EMR Cluster with SSM Integration - Full Structure

## Overview

This Terraform project automates the deployment of an AWS EMR (Elastic MapReduce) cluster with integrated AWS Systems Manager (SSM) for centralized management and monitoring. The project aims to simplify the setup process of an EMR cluster while enhancing security and operational efficiency through SSM.

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

- `ssm_documents/`: Contains SSM document YAML files used for configuration and automation tasks.

- `modules/`: Contains Terraform modules for modularizing the infrastructure configuration.
  
- `terraform.tfvars`: Contains variable definitions used to customize the Terraform configuration. This file should be created manually and populated with values before running Terraform commands.

## Usage

To use this project:

1. Ensure you have Terraform installed on your local machine.

2. Configure your AWS credentials either via `~/.aws/credentials` or environment variables.

3. Customize the `variables.tf` file to adjust the EMR cluster settings, VPC configuration, and SSM documents according to your requirements.

4. Run `terraform init` to initialize the Terraform project.

5. Run `terraform plan` to review the proposed changes.

6. Run `terraform apply` to apply the Terraform configuration and provision the EMR cluster with SSM integration.

7. Access the EMR cluster instances through AWS Systems Manager (SSM) Session Manager for management tasks.


![image](https://github.com/Mariamkassab/AWS-EMR-With-SSM-Full-Structure/assets/123699968/370ce08e-f2dd-4e57-8dd0-bcabe7bc794b)
