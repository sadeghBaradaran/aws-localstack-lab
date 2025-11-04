aws_region         = "us-east-1"
project_name       = "terraform-iac-stack"
environment        = "staging"
vpc_cidr           = "10.1.0.0/16"
public_subnets     = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnets    = ["10.1.11.0/24", "10.1.12.0/24"]
enable_nat_gateway = true
ec2_instance_count = 2
ec2_instance_type  = "t3.small"
ec2_key_name       = null
s3_bucket_name     = "staging-terraform-iac-stack-bucket"
s3_versioning      = true
iam_user_name      = "staging-stack-user"
iam_role_name      = "staging-stack-role"
iam_policy_name    = "staging-stack-policy"
default_tags = {
  Owner = "platform-team"
}
