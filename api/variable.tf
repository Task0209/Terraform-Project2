variable api-name {
  type = string
  description = "Api name of the Lambda Function"
}

variable "fun1-name" {
  type = string
  description = "Name of the Lambda Function"
  default = ""
}

variable "lambda1-arn" {
  description = "ARN for Lambda"
  type = string
  default = ""
}
