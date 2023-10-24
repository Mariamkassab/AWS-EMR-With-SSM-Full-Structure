resource "aws_s3_bucket" "emr-logs-s3" {
  bucket = "emr-logs-mohan"
  lifecycle {
    #    prevent_destroy = true # if you want to prevet bucket deletion
  }
}



resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.emr-logs-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}