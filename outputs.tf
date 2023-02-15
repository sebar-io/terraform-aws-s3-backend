output "terraform_backend_s3_bucket" {
  value = aws_s3_bucket.terraform_state.bucket
  description = "s3 bucket name to be used for terraform backend in other apps across organization"
}

output "terraform_backend_dynamodb_table" {
  value = aws_dynamodb_table.terraform_state_lock.name
  description = "dynamodb table to be used for terraform backend in other apps across organization"
}