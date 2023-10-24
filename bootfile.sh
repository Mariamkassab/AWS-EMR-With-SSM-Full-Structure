#!/bin/bash

# Update package repositories
sudo apt-get update

# Install Python 3 and pip
sudo apt-get install -y python3 python3-pip

# Install Java Development Kit (JDK)
sudo apt-get install -y default-jdk

# Install Apache Spark
sudo apt-get install -y spark

# Add environment variables
echo 'export PYSPARK_PYTHON=python3' >> ~/.bashrc
echo 'export SPARK_HOME=/usr/lib/spark' >> ~/.bashrc

# Refresh environment variables
source ~/.bashrc

# Script execution completed
echo "Bootstrap script execution completed." 
