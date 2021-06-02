resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}"
  acl    = "${var.acl_policy}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}