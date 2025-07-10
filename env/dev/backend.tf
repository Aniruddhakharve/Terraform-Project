terraform {
  backend "s3" {
    bucket         = "terraform-resume-backend"     # ✅ Your actual S3 bucket name
    key            = "env/dev/terraform.tfstate"    # Logical path to the state file
    region         = "ap-south-1"                   # Mumbai region
    dynamodb_table = "terraform-state-lock"         # Your DynamoDB table name
    encrypt        = true                           # Encrypt the state file at rest
  }
}
