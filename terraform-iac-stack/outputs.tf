output "vpc_id" {
  description = "ID of the provisioned VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets."
  value       = module.vpc.private_subnet_ids
}

output "ec2_instance_ids" {
  description = "IDs of the created EC2 instances."
  value       = module.ec2.instance_ids
}

output "ec2_public_ips" {
  description = "Public IP addresses of the EC2 instances."
  value       = module.ec2.public_ips
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket."
  value       = module.s3.bucket_name
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table used for locking."
  value       = module.backend_state.dynamodb_table_name
}

output "iam_role_arn" {
  description = "ARN of the IAM role."
  value       = module.iam.role_arn
}
