terraform {
  backend "s3" {
    bucket = "qhowell-cloud-resume-challenge" # Specify the S3 bucket name
    key    = "backend/terraform.tfstate"      # Path to the state file within the bucket
    region = "us-east-1"           # AWS region where the S3 bucket is located
  }
}
