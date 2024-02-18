resource "aws_s3_bucket" "s3_tf" {
  bucket = var.s3_name

}

resource "aws_s3_bucket_ownership_controls" "s3_ownership_tf" {
  bucket = aws_s3_bucket.s3_tf.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_public_access_tf" {
  bucket = aws_s3_bucket.s3_tf.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3_acl_tf" {
  # depends_on = [
  #   aws_s3_bucket_ownership_controls.s3_ownership_tf,
  #   aws_s3_bucket_public_access_block.s3_public_access_tf,
  # ]


  bucket = aws_s3_bucket.s3_tf.id
  acl    = "public-read"
}