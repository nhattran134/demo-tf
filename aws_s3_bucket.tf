resource "aws_s3_bucket" "uci-buckets" {
  bucket = "demo-${var.environment}"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = local.common_tags
}