# terraform-aws-s3-backend

Terraform AWS S3 Backend defines a Terraform backend using an AWS S3 Bucket and DynamoDB Table for other organizational apps to use.

## Prerequisites

- [AWS CLI](https://aws.amazon.com/cli/)
- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)

## Instructions

Run the following commands in the root of this directory to deploy the necessary infrastructure.

```shell
$ terraform init
$ terraform plan
$ terraform apply
```

Make note of the outputs that should look something like this:

```
Outputs:

prod_terraform_backend_dynamodb_table = "prod-${organization}-tfstate-table"
prod_terraform_backend_s3_bucket = "prod-${organization}-terraform-bucket"
stage_terraform_backend_dynamodb_table = "stage-${organization}-tfstate-table"
stage_terraform_backend_s3_bucket = "stage-${organization}-terraform-bucket"
```

## Usage

Use the `terraform_backend_s3_bucket` and `terraform_backend_dynamodb_table` outputs for the appropriate environment in your organizational app infra backends with a corresponding S3 key

### Stage Backend Example:

```
# ${project}/infra/stage/backend.tf
terraform {
    backend "s3" {
        # REPLACE manually with stage_terraform_backend_s3_bucket output
        bucket = "stage-${organization}-terraform-bucket"
        # REPLACE manually with app_name
        key    = "${app_name}/terraform.tfstate"
        region = "us-east-1"
        # REPLACE with stage_terraform_backend_dynamodb_table output
        dynamodb_table = "stage-${organization}-tfstate-table"
    }
}
```

### Prod Backend Example:

```
# ${project}/infra/prod/backend.tf
terraform {
    backend "s3" {
        # REPLACE manually with prod_terraform_backend_s3_bucket output
        bucket = "prod-${organization}-terraform-bucket"
        # REPLACE manually with app_name
        key    = "${app_name}/terraform.tfstate"
        region = "us-east-1"
        # REPLACE with prod_terraform_backend_dynamodb_table output
        dynamodb_table = "prod-${organization}-tfstate-table"
    }
}
```

You will need to replace the `${variables}` in `backend.tf` manually since terraform backend configurations do not allow for variables.

## Notes

The resulting `tfstate` for this `terraform apply` is stored locally, which isn't usually what we want; in fact, this whole repo is to avoid doing so in other infra definitions.

Since all our other organizational apps depend on the resources we're creating here, we can disregard this reality since in practice, we ought to **never** delete these resources.

If we really really need to delete these resources we can do so manually through the aws console fairly easily.

## Support

<a href="https://www.buymeacoffee.com/sebario"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="48"></a>
