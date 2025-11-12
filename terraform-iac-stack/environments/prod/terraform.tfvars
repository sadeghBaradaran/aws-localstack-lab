aws_region         = "us-east-1"
project_name       = "terraform-iac-stack"
environment        = "prod"
vpc_cidr           = "10.2.0.0/16"
public_subnets     = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
private_subnets    = ["10.2.11.0/24", "10.2.12.0/24", "10.2.13.0/24"]
enable_nat_gateway = true
ec2_instance_count = 3
ec2_instance_type  = "t3.medium"
ec2_key_name       = null
s3_bucket_name     = "prod-terraform-iac-stack-bucket"
s3_versioning      = true
iam_user_name      = "prod-stack-user"
iam_role_name      = "prod-stack-role"
iam_policy_name    = "prod-stack-policy"
default_tags = {
  Owner = "platform-team"
}
