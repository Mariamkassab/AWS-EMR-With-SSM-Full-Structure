resource "aws_emr_cluster" "cluster" {
  name = var.name
  release_label = var.release_label
  applications = var.applications

  log_uri = "s3://${var.s3_bucket}/"
  termination_protection = false  # sould be true # Protect your EC2 instances from accidental termination
  keep_job_flow_alive_when_no_steps = true #Switch on/off run cluster with no steps or when all steps are complete (default is on)

# this configration need edits
  configurations_json = <<EOF
[
  {
    "Classification":"iceberg-defaults",
    "Properties":{"iceberg.enabled":"true"}
  },
  {
    "Classification": "spark-hive-site",
    "Properties": {"hive.metastore.client.factory.class": "com.amazonaws.glue.catalog.metastore.AWSGlueDataCatalogHiveClientFactroy"}
  }
]
EOF

  ec2_attributes {
    subnet_id = var.subnet_id
    key_name = var.key_name
    emr_managed_master_security_group = var.emr_master_security_group
    emr_managed_slave_security_group = var.emr_slave_security_group
    service_access_security_group = var.service_access_security_group
    instance_profile = var.emr_ec2_instance_profile
  }

  ebs_root_volume_size = "100"

  master_instance_group {
    name = "EMR master"
    instance_type = var.master_instance_type
    instance_count = "1"

    ebs_config {
      size = var.master_ebs_size
      type = "gp2"
      volumes_per_instance = 1
    }
  }

  core_instance_group {
    name = "EMR slave"
    instance_type = var.core_instance_type
    instance_count = var.core_instance_count

    ebs_config {
      size = var.core_ebs_size
      type = "gp2"
      volumes_per_instance = 1
    }

    autoscaling_policy = <<EOF
{
"Constraints": {
  "MinCapacity": 1,
  "MaxCapacity": 2
},
"Rules": [
  {
    "Name": "ScaleOutMemoryPercentage",
    "Description": "Scale out if YARNMemoryAvailablePercentage is less than 15",
    "Action": {
      "SimpleScalingPolicyConfiguration": {
        "AdjustmentType": "CHANGE_IN_CAPACITY",
        "ScalingAdjustment": 1,
        "CoolDown": 300
      }
    },
    "Trigger": {
      "CloudWatchAlarmDefinition": {
        "ComparisonOperator": "LESS_THAN",
        "EvaluationPeriods": 1,
        "MetricName": "YARNMemoryAvailablePercentage",
        "Namespace": "AWS/ElasticMapReduce",
        "Period": 300,
        "Statistic": "AVERAGE",
        "Threshold": 15.0,
        "Unit": "PERCENT"
      }
    }
  }
]
}
EOF

  }

  tags = {
    Name = "${var.name}"
  }

  service_role = var.emr_service_role
  autoscaling_role = var.emr_autoscaling_role

  bootstrap_action {
    path = "s3://${var.bucket_name}/bootstrap/bootfile.sh"
    name = "bootfile"
    args = ["instance.isMaster=true", "echo running on master node"]
  }
  
}


# resource "aws_emr_instance_group" "task_instance_group" {
#   name = "task-group"
#   cluster_id = join("", aws_emr_cluster.cluster.*.id)
#   instance_count = 1
#   instance_type = "c5.xlarge"
# }