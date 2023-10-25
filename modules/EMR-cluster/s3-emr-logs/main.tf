resource "aws_s3_bucket" "emr-logs-s3" {
  bucket = var.bucket_name
  force_destroy = true
  lifecycle {
    #    prevent_destroy = true # if you want to prevet bucket deletion
  }
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.emr-logs-s3.id
  key    = "bootstrap/bootfile.sh"
  source = "./modules/bootfile.sh"
  etag = filemd5("./modules/bootfile.sh")
}