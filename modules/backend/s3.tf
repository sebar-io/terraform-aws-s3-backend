# create bucket to store terraform resources such as terraform.tfstate and outputs.json
resource "aws_s3_bucket" "this" {
  bucket = "${var.env}-${var.organization}-terraform-bucket"

  lifecycle {
    prevent_destroy = true
  }
  
  tags = {
    env = var.env
  }
}

# block all public access
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# enable bucket versioning
resource "aws_s3_bucket_versioning" "this" {
    bucket = aws_s3_bucket.this.id

    versioning_configuration {
      status = "Enabled"
    }
}