resource "aws_dynamodb_table" "terraform-lock" {
    name           = "vishnu-terraform-state-table"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Description" = "DynamoDB Terraform State Lock Table"
        "Name" = "vishnu-terraform-state-table"

    }
}