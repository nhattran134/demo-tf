resource "aws_s3_bucket" "buckets" {
  bucket = "demo-${var.environment}-${local.account_id}"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = local.common_tags
}