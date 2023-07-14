######### Terraform Provider #########

provider "aws" {
  region                      = "eu-central-1"
  access_key                  = "distributed"
  secret_key                  = "distributed"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localhost:4566"
    apigatewayv2   = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    ec2            = "http://localhost:4566"
    es             = "http://localhost:4566"
    elasticache    = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    rds            = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    route53        = "http://localhost:4566"
    s3             = "http://s3.localhost.localstack.cloud:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
  }
}

######### DynamoDB #########

resource "aws_dynamodb_table" "justdice-dev-devops-consumer-events" {
  name           = "justdice-dev-devops-consumer-events"
  read_capacity  = "20"
  write_capacity = "20"
  hash_key       = "Id" 

  attribute {
    name = "Id" 
    type = "S"
  }
}

resource "aws_dynamodb_table" "students" {
  name           = "students"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Id"

  attribute {
    name = "Id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "lessons" {
  name           = "lessons"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Id"

  attribute {
    name = "Id"
    type = "S"
  }

  attribute {
    name = "MasterId"
    type = "S"
  }

  global_secondary_index {
    name               = "MasterIdIndex"
    hash_key           = "MasterId"
    projection_type    = "ALL"
    read_capacity      = 20
    write_capacity     = 20
  }
}

resource "aws_dynamodb_table" "masters" {
  name           = "masters"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Id"

  attribute {
    name = "Id"
    type = "S"
  }

  attribute {
    name = "Name"
    type = "S"
  }

  global_secondary_index {
    name               = "Name-index"
    hash_key           = "Name"
    write_capacity     = 5
    read_capacity      = 5
    projection_type    = "INCLUDE"

    non_key_attributes = [
      "age",
      "address",
      # Add more non-key attributes here if needed
    ]
  }
}

######### SNS Topic #########

resource "aws_sns_topic" "sns_topic" {
  name = "justdice-dev-devops-producer-events"
}


######### SQS Queue #########

resource "aws_sqs_queue" "queue" {
  name = "justdice-dev-devops-consumer-events"
}

######### SNS Subscription #########

resource "aws_sns_topic_subscription" "private_http_subscription" {
  topic_arn              = aws_sns_topic.sns_topic.arn
  protocol               = "sqs"
  endpoint               = aws_sqs_queue.queue.arn
  endpoint_auto_confirms = true
}
