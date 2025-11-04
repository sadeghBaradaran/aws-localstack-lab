variable "aws_region" {
  description = "AWS region to deploy resources into."
  type        = string
}

variable "project_name" {
  description = "Project name for tagging."
  type        = string
  default     = "terraform-iac-stack"
}

variable "default_tags" {
  description = "Additional default tags to apply."
  type        = map(string)
  default     = {}
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
  default     = []
}

variable "enable_nat_gateway" {
  description = "Whether to create a NAT Gateway."
  type        = bool
  default     = false
}

variable "ec2_instance_count" {
  description = "Number of EC2 instances to launch."
  type        = number
  default     = 1
}

variable "ec2_instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "ec2_key_name" {
  description = "Name of the EC2 key pair."
  type        = string
  default     = null
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to create."
  type        = string
}

variable "s3_versioning" {
  description = "Whether to enable S3 versioning."
  type        = bool
  default     = true
}

variable "iam_user_name" {
  description = "Name of the IAM user."
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role."
  type        = string
}

variable "iam_policy_name" {
  description = "Name of the IAM policy."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}
