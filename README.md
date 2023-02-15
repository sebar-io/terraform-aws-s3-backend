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

terraform_backend_dynamodb_table = "tfstate"
terraform_backend_s3_bucket = "org-tfstate"
```

## Usage

Use the `terraform_backend_dynamodb_table` and `terraform_backend_s3_bucket` outputs in your organizational app infra backends with a corresponding S3 key

```
# backend.tf
terraform {
    backend "s3" {
        bucket = "${terraform_backend_s3_bucket}"
        key    = "${app_name}/${env}.tfstate"
        region = "us-east-1"
        dynamodb_table = "${terraform_backend_s3_bucket}"
    }
}
```

You will need to replace the `${variables}` in `backend.tf` manually since terraform backend configurations do not support variables.

## Notes

The resulting `tfstate` for this `terraform apply` is stored locally, which isn't usually what we want; in fact, this whole repo is to avoid doing so in other infra definitions.

Since all our other organizational apps depend on the resources we're creating here, we can disregard this reality since in practice, we ought to **never** delete these resources.

If we really really need to delete these resources we can do so manually through the aws console fairly easily.

## Support

<a href="https://www.buymeacoffee.com/sebario"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="48"></a>
