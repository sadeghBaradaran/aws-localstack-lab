# terraform-iac-stack

This repository provides a reusable Terraform stack that provisions core AWS infrastructure components with a remote backend for collaborative workflows.

## Features

- **Remote backend**: S3 bucket for Terraform state with DynamoDB state locking and encryption.
- **Modular design**: Reusable modules for VPC networking, EC2 compute, S3 storage, and IAM access management.
- **Environment support**: Preconfigured `dev`, `staging`, and `prod` environments with dedicated variable files.
- **Consistent tagging**: Common tagging strategy applied to all resources.
- **Extensible**: Easily extendable with additional modules or environments.

## Repository layout

```
terraform-iac-stack/
├── backend/                # Resources that create the remote backend bucket and lock table
├── modules/                # Reusable infrastructure modules
│   ├── ec2/
│   ├── iam/
│   ├── s3/
│   └── vpc/
├── environments/           # Environment specific wrappers
│   ├── dev/
│   ├── staging/
│   └── prod/
├── main.tf                 # Root module wiring the stack together
├── provider.tf             # AWS provider configuration
├── variables.tf            # Input variables for the stack
├── outputs.tf              # Outputs exported by the stack
├── versions.tf             # Terraform and provider version constraints
└── README.md
```

## Prerequisites

- Terraform >= 1.5.0
- AWS credentials with permissions to create VPC, EC2, S3, DynamoDB, and IAM resources
- The remote backend S3 bucket and DynamoDB table must exist before running `terraform init` with the backend configuration.
  - Use the [`backend/`](backend/) module to bootstrap these resources locally before enabling the remote backend.

## Bootstrapping the backend

```bash
# From the repository root
terraform init
terraform apply -target=module.backend_state
```

Alternatively, execute the standalone backend module:

```bash
terraform -chdir=backend init
terraform -chdir=backend apply
```

Ensure the bucket (`my-terraform-state-bucket`) and DynamoDB table (`terraform-locks`) match the values configured in each environment backend (see [`environments/*/provider.tf`](./environments)).

## Using environments

Each environment directory wraps the root module and supplies environment-specific variables. Example workflow for the `dev` environment:

```bash
# Initialize the dev environment (configures the remote backend defined in this directory)
terraform -chdir=environments/dev init

# Review the infrastructure changes for dev
terraform -chdir=environments/dev plan

# Apply the infrastructure changes
terraform -chdir=environments/dev apply
```

Repeat the same workflow for the `staging` and `prod` directories. Customize variables via the respective `terraform.tfvars` files.

## Common configuration

Key variables exposed by the stack:

- `aws_region`: AWS region for deployment.
- `environment`: Environment label used for tagging and resource names.
- `vpc_cidr`: CIDR block for the VPC.
- `public_subnets` / `private_subnets`: CIDR blocks for subnets.
- `ec2_instance_count`, `ec2_instance_type`, `ec2_key_name`: EC2 configuration.
- `s3_bucket_name`, `s3_versioning`: S3 module inputs.
- `iam_user_name`, `iam_role_name`, `iam_policy_name`: IAM resources for access management.

Outputs provided after `terraform apply`:

- `vpc_id`
- `public_subnet_ids`
- `private_subnet_ids`
- `ec2_instance_ids`
- `ec2_public_ips`
- `s3_bucket_name`
- `dynamodb_table_name`
- `iam_role_arn`

## Validation & linting

Before committing changes, validate and format your configuration:

```bash
terraform fmt -recursive
terraform validate
# Optional: run tflint if available
```

## Extending the stack

- Add new modules under `modules/` and wire them into `main.tf`.
- Introduce additional environments by copying one of the existing environment directories and adjusting the variable values.
- Configure CI/CD (e.g., GitHub Actions) to automatically run `terraform fmt`, `validate`, and `plan`.

## Security considerations

- Keep sensitive values (like access keys) out of version control. Environment-specific secrets should be managed via Terraform variables passed through `-var` or environment variables.
- Enable MFA and IAM best practices for the created user and role.
- Review resource tagging to ensure compliance with your organization's policies.

## Support

For issues or feature requests, open an issue or submit a pull request.
