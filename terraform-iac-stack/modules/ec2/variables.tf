variable "environment" {
  description = "Deployment environment for naming."
  type        = string
}

variable "instance_count" {
  description = "Number of instances to launch."
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "Instance type for the EC2 instances."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs in which to launch instances."
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security group IDs to associate with instances."
  type        = list(string)
}

variable "key_name" {
  description = "SSH key pair name."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to EC2 resources."
  type        = map(string)
  default     = {}
}
