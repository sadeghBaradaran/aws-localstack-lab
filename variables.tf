variable "aws_region" {
  description = "AWS region to deploy resources into."
  type        = string
}

variable "project_name" {
  description = "Name of the project used for tagging."
  type        = string
  default     = "terraform-iac-stack"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)."
  type        = string
}

variable "default_tags" {
  description = "Additional tags to apply to all resources."
  type        = map(string)
  default     = {}
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether to provision a NAT Gateway for private subnet egress."
  type        = bool
  default     = false
}

variable "ec2_instance_count" {
  description = "Number of EC2 instances to create."
  type        = number
  default     = 1
}

variable "ec2_instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "ec2_key_name" {
  description = "Name of the EC2 key pair to associate with instances."
  type        = string
  default     = null
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to provision."
  type        = string
}

variable "s3_versioning" {
  description = "Enable versioning on the S3 bucket."
  type        = bool
  default     = true
}

variable "iam_user_name" {
  description = "Name of the IAM user to create."
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role to create."
  type        = string
}

variable "iam_policy_name" {
  description = "Name of the IAM policy to attach to the IAM role."
  type        = string
}
