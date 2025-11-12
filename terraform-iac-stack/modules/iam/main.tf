locals {
  tags = merge(var.tags, {
    Component = "iam"
  })
}

resource "aws_iam_user" "this" {
  name = var.user_name
  tags = local.tags
}

resource "aws_iam_policy" "s3_access" {
  name        = var.policy_name
  description = "Access to project S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = [var.bucket_arn]
      },
      {
        Effect   = "Allow"
        Action   = ["s3:GetObject", "s3:PutObject"]
        Resource = ["${var.bucket_arn}/*"]
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "user_policy" {
  user       = aws_iam_user.this.name
  policy_arn = aws_iam_policy.s3_access.arn
}

resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
  tags               = local.tags
}

resource "aws_iam_role_policy_attachment" "role_policy" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.s3_access.arn
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
