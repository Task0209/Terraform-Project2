
variable "submission-lambda-name" {
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
  default = "impex-submission-lambda-role"
}

variable "lamda-handler" {
  type = string
  description =  "Lambda Handler"
  default = ""
}

