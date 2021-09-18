resource "aws_s3_bucket" "s3-bucket" {
    bucket = "vishnu-terraform-state-bucket"
    versioning {
        enabled = true
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
    
    tags = {
        Description = "S3 Remote Terraform State Store"
        Name = "vishnu-terraform-state-bucket"
    }
}