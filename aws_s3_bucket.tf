resource "aws_s3_bucket" "uci-buckets" {
  bucket   = "${each.value}-${var.environment}"
  acl      = "private"
  versioning {
    enabled = true
  }
  tags = local.common_tags
}