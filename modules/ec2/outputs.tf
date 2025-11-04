output "instance_ids" {
  description = "IDs of the EC2 instances."
  value       = [for instance in aws_instance.this : instance.id]
}

output "public_ips" {
  description = "Public IP addresses of the EC2 instances."
  value       = [for instance in aws_instance.this : instance.public_ip]
}
