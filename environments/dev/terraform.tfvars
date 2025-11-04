aws_region         = "us-east-1"
project_name       = "terraform-iac-stack"
environment        = "dev"
vpc_cidr           = "10.0.0.0/16"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.11.0/24", "10.0.12.0/24"]
enable_nat_gateway = false
ec2_instance_count = 1
ec2_instance_type  = "t3.micro"
ec2_key_name       = null
s3_bucket_name     = "dev-terraform-iac-stack-bucket"
s3_versioning      = true
iam_user_name      = "dev-stack-user"
iam_role_name      = "dev-stack-role"
iam_policy_name    = "dev-stack-policy"
default_tags = {
  Owner = "platform-team"
}
