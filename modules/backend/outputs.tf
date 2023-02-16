output "s3_bucket" {
  value = aws_s3_bucket.this.bucket
  description = "s3 bucket name to be used for terraform backend in other apps across organization"
}

output "dynamodb_table" {
  value = aws_dynamodb_table.this.name
  description = "dynamodb table to be used for terraform backend in other apps across organization"
}