terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "env/${terraform.workspace}/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = merge({
      Project = var.project_name
    }, var.default_tags)
  }
}
