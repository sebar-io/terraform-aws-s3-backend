output "stage_backend_s3_bucket" {
  value = module.backend-stage.s3_bucket
  description = "stage s3 bucket name to be used for terraform backend in other apps across organization"
}

output "stage_backend_dynamodb_table" {
  value = module.backend-stage.dynamodb_table
  description = "stage dynamodb table to be used for terraform backend in other apps across organization"
}

output "prod_backend_s3_bucket" {
  value = module.backend-prod.s3_bucket
  description = "prod s3 bucket name to be used for terraform backend in other apps across organization"
}

output "prod_backend_dynamodb_table" {
  value = module.backend-prod.dynamodb_table
  description = "prod dynamodb table to be used for terraform backend in other apps across organization"
}