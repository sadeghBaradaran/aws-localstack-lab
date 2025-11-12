variable "project_name" {
  description = "Name of the project using the backend."
  type        = string
}

variable "environment" {
  description = "Deployment environment for tagging purposes."
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket for state storage."
  type        = string
  default     = "my-terraform-state-bucket"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for state locking."
  type        = string
  default     = "terraform-locks"
}

variable "tags" {
  description = "Tags to apply to backend resources."
  type        = map(string)
  default     = {}
}
