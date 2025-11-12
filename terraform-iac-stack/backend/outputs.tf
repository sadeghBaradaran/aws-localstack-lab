output "bucket_name" {
  description = "Name of the S3 bucket used for Terraform state."
  value       = aws_s3_bucket.state.id
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table for Terraform state locking."
  value       = aws_dynamodb_table.lock.name
}
