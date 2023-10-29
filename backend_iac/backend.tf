terraform {
  backend "s3" {
    bucket = "qhowell-cloud-resume-challenge"
    key    = "qhowell-cloud-resume-challenge/backend/terraform.tfstate"
    region = "us-east-1"
  }
}
