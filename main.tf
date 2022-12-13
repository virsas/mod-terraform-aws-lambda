provider "aws" {
  profile = var.profile
  region = var.region

  assume_role {
    role_arn = var.assumeRole ? "arn:aws:iam::${var.accountID}:role/${var.assumableRole}" : null
  }
}

resource "aws_lambda_function" "vss" {
  function_name     = var.name

  role              = var.lambdaRole

  filename          = "${var.lambda_path}/${var.name}.zip"
  source_code_hash  = filebase64sha256("${var.lambda_path}/${var.name}.zip")

  architectures     = [ var.architecture ]
  runtime           = var.runtime
  handler           = var.handler

  memory_size       = var.memory
  timeout           = var.timeout

  publish           = var.publish

  ephemeral_storage {
    size = var.storage
  }

  environment {
    variables = var.env
  }
}