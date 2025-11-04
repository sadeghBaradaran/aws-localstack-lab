module "stack" {
  source = "../../"

  aws_region          = var.aws_region
  project_name        = var.project_name
  environment         = var.environment
  default_tags        = merge({ Environment = var.environment }, var.default_tags)
  vpc_cidr            = var.vpc_cidr
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  enable_nat_gateway  = var.enable_nat_gateway
  ec2_instance_count  = var.ec2_instance_count
  ec2_instance_type   = var.ec2_instance_type
  ec2_key_name        = var.ec2_key_name
  s3_bucket_name      = var.s3_bucket_name
  s3_versioning       = var.s3_versioning
  iam_user_name       = var.iam_user_name
  iam_role_name       = var.iam_role_name
  iam_policy_name     = var.iam_policy_name
}
