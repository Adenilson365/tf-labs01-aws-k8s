resource aws_s3_bucket "bucket" {
  bucket = var.bucket_name
  tags = var.default_tags
}

resource aws_s3_bucket_versioning "versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = var.versioning ? "Enabled" : "Suspended"
  }
}

resource aws_s3_bucket_server_side_encryption_configuration "encryption" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource aws_s3_bucket_public_access_block "public_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource aws_s3_bucket_ownership_controls "ownership_controls" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.acl
  
  depends_on = [
    aws_s3_bucket_public_access_block.public_access_block, 
    aws_s3_bucket_ownership_controls.ownership_controls 
  ]
}

locals {
  # adiciona uma barra no final de cada caminho, se não tiver.
  paths_normalized = [
    for path in var.paths : (
        substr(path, length(path) - 1, 1 ) == "/" ? path : "${path}/"
    )
  ]
}
resource "aws_s3_object" "path" {
  bucket  = aws_s3_bucket.bucket.id
  key     = each.value
  for_each = toset(local.paths_normalized)

}