# mod-terraform-aws-lambda

Terraform module to create AWS lambda function with optional permissions.

## Variables

- **profile** - The profile from ~/.aws/credentials file used for authentication. By default it is the default profile.
- **accountID** - ID of your AWS account. It is a required variable normally used in JSON files or while assuming a role.
- **region** - The region for the resources. By default it is eu-west-1.
- **assumeRole** - Enable / Disable role assume. This is disabled by default and normally used for sub organization configuration.
- **assumableRole** - The role the user will assume if assumeRole is enabled. By default, it is OrganizationAccountAccessRole.
- **name** - Name of the function, it is the same as the name of the zip.
- **lambdaRole** - Role used to execute the lambda. This role must have an access to resources lambda will work with.
- **runtime** - Valid Values: nodejs | nodejs4.3 | nodejs6.10 | nodejs8.10 | nodejs10.x | nodejs12.x | nodejs14.x | nodejs16.x | java8 | java8.al2 | java11 | python2.7 | python3.6 | python3.7 | python3.8 | python3.9 | dotnetcore1.0 | dotnetcore2.0 | dotnetcore2.1 | dotnetcore3.1 | dotnet6 | nodejs4.3-edge | go1.x | ruby2.5 | ruby2.7 | provided | provided.al2 | nodejs18.x
- **lambda_path** - By default the lambda zip files are located in ./lambdas directory with names *NAME*.zip.
- **architecture** - Instance architecture. Valid values are [\"x86_64\"] and [\"arm64\"]. Default is [\"x86_64\"]
- **handler** - Function entrypoint. By default index.handler
- **memory** - Amount of memory available to Lambda function. In MB and defaults to 128.
- **timeout** - Allowed time for function to run. In seconds. Defaults to 3. Max value 900
- **publish** - Weather to publish a change as a new version of lambda function. Valid values true/false. Defaults to true.
- **storage** - The amount of /tmp storage allocated for the Lambda. In MB. Defaults to 512.
- **env** - In case your lambda needs env variables you can configure them as list of objects {\"foo\" = \"bar\"}.
- **enable_policy** - Enable resource policy on this lambda function. By default it is disabled.
- **policy_action** - The AWS Lambda action you want to allow in this statement. By default lambda:InvokeFunction
- **policy_principal** -  The principal who is getting this permission. s3.amazonaws.com, an AWS account ID, or AWS IAM principal, or AWS service principal such as events.amazonaws.com or sns.amazonaws.com. By default it is s3.amazonaws.com
- **policy_source_account** - Optional. The ID of AWS account that is allowed to trigger the function
- **policy_source_arn** - Optional. The ARN of the resource that is allowed to trigger the function

## Example

``` terraform
variable accountID { default = "123456789012"}

module "lambda_example" {
  source   = "git::https://github.com/virsas/mod-terraform-aws-lambda.git?ref=v1.0.5"

  profile = "default"
  accountID = var.accountID
  region = "us-east-1"

  name       = "example"
  lambdaRole = module.iam_role_lambda.arn
  runtime    = "nodejs14.x"
}

output "lambda_example_arn" {
    value = module.lambda_example.arn
}
```

## Outputs

- arn
- invoke_arn
- qualified_arn
- qualified_invoke_arn
- version
- source_code_size