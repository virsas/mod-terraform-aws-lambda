# Account setup
variable "profile" {
  description           = "The profile from ~/.aws/credentials file used for authentication. By default it is the default profile."
  type                  = string
  default               = "default"
}

variable "accountID" {
  description           = "ID of your AWS account. It is a required variable normally used in JSON files or while assuming a role."
  type                  = string

  validation {
    condition           = length(var.accountID) == 12
    error_message       = "Please, provide a valid account ID."
  }
}

variable "region" {
  description           = "The region for the resources. By default it is us-east-1."
  type                  = string
  default               = "us-east-1"
}

variable "assumeRole" {
  description           = "Enable / Disable role assume. This is disabled by default and normally used for sub organization configuration."
  type                  = bool
  default               = false
}

variable "assumableRole" {
  description           = "The role the user will assume if assumeRole is enabled. By default, it is OrganizationAccountAccessRole."
  type                  = string
  default               = "OrganizationAccountAccessRole"
}

# Required
variable "name" {
  description = "Name of the function, it is the same as the name of the zip."
  type        = string
}

variable "lambdaRole" {
  description = "Role used to execute the lambda. This role must have an access to resources lambda will work with."
  type        = string
}

variable "runtime" {
  description = "Valid Values: nodejs | nodejs4.3 | nodejs6.10 | nodejs8.10 | nodejs10.x | nodejs12.x | nodejs14.x | nodejs16.x | java8 | java8.al2 | java11 | python2.7 | python3.6 | python3.7 | python3.8 | python3.9 | dotnetcore1.0 | dotnetcore2.0 | dotnetcore2.1 | dotnetcore3.1 | dotnet6 | nodejs4.3-edge | go1.x | ruby2.5 | ruby2.7 | provided | provided.al2 | nodejs18.x"
  type        = string
}

# Preset
variable "lambda_path" {
  description = "By default the lambda zip files are located in ./lambdas directory with names *NAME*.zip."
  type        = string
  default     = "./lambdas"
}

variable "architecture" {
  description = "Instance architecture. Valid values are [\"x86_64\"] and [\"arm64\"]. Default is [\"x86_64\"]"
  type        = list(string)
  default     = ["x86_64"]
}

variable "handler" {
  description = "Function entrypoint. By default index.handler"
  type        = string
  default     = "index.handler"
}

variable "memory" {
  description = "Amount of memory available to Lambda function. In MB and defaults to 128."
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Allowed time for function to run. In seconds. Defaults to 3. Max value 900"
  type        = number
  default     = 3
}

variable "publish" {
  description = "Weather to publish a change as a new version of lambda function. Valid values true/false. Defaults to true."
  type        = bool
  default     = true
}

variable "storage" {
  description = "The amount of /tmp storage allocated for the Lambda. In MB. Defaults to 512."
  type        = number
  default     = 512
}

variable "env" {
  description = "In case your lambda needs env variables you can configure them as list of objects {\"foo\" = \"bar\"}"
  type        = map
  default     = {"foo" = "bar"}
}