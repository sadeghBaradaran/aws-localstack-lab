variable "user_name" {
  description = "Name of the IAM user to create."
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role to create."
  type        = string
}

variable "policy_name" {
  description = "Name of the IAM policy to create."
  type        = string
}

variable "bucket_arn" {
  description = "ARN of the S3 bucket the IAM policy should allow access to."
  type        = string
}

variable "tags" {
  description = "Tags to apply to IAM resources."
  type        = map(string)
  default     = {}
}
