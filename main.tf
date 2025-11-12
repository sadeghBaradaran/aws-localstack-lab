locals {
  common_tags = merge(
    var.default_tags,
    {
      Environment = var.environment,
      Project     = var.project_name
    }
  )
}

module "backend_state" {
  source = "./backend"

  project_name = var.project_name
  environment  = var.environment
  tags         = local.common_tags
}

module "vpc" {
  source = "./modules/vpc"

  environment        = var.environment
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  enable_nat_gateway = var.enable_nat_gateway
  tags               = local.common_tags
}

module "ec2" {
  source = "./modules/ec2"

  environment        = var.environment
  instance_count     = var.ec2_instance_count
  instance_type      = var.ec2_instance_type
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.vpc.public_security_group_id]
  key_name           = var.ec2_key_name
  tags               = local.common_tags
}

module "s3" {
  source = "./modules/s3"

  bucket_name = var.s3_bucket_name
  versioning  = var.s3_versioning
  tags        = local.common_tags
}

module "iam" {
  source = "./modules/iam"

  user_name   = var.iam_user_name
  role_name   = var.iam_role_name
  policy_name = var.iam_policy_name
  tags        = local.common_tags
  bucket_arn  = module.s3.bucket_arn
}
