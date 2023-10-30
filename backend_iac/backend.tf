terraform {
  backend "s3" {
    bucket = "qhowell-cloud-resume-challenge"
    key    = "backend/terraform.tfstate"  # Specify the desired path within your S3 bucket
    region = "us-east-1"      # Replace with your preferred AWS region
    
  }
}
