# dynamodb table to implement tfstate locking for our backend
resource "aws_dynamodb_table" "this" {
  name           = "${var.env}-${var.organization}-tfstate-table"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}