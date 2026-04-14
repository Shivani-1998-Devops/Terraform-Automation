terraform {
  backend "s3" {
    bucket = "sanket-mahajan-terraform-state-file-1234654"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "my-dynamodb-table"
    encrypt        = true
  }
}
