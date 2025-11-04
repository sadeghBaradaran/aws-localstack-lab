variable "environment" {
  description = "Environment identifier for resource naming."
  type        = string
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
}

variable "enable_nat_gateway" {
  description = "Whether to create a NAT Gateway for private subnets."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to VPC resources."
  type        = map(string)
  default     = {}
}
