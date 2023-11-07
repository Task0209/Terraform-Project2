
variable "fun2-name" {
  type = string
  description = "Name of the Lambda Function"
  default = ""
}

variable "run-time" {
  type        = string
  description = "Execution Runtime for Lambda"
  default = "python3.11"
}

variable "lamda-role" {
  type = string
  description =  "Lambda Role name"
  default = "impex-lambda-role"
}

variable "lamda-handler" {
  type = string
  description =  "Lambda Handler"
  default = "impex.lambda_handler"
}

variable "s3bucket-arn" {
  type = string
  description = "ARN of s3 bucket"
  default = ""
}

variable "sqs_arn" {
  description = "ARN of SQS Queue"
}

variable "sqs_dead_arn" {
  description = "ARN of SQS dead Queue"
}