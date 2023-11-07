
variable "ftp-lamda-name" {
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
  default = "impex-ftp-lambda-role"
}

variable "lamda-handler" {
  type = string
  description =  "Lambda Handler"
  default = ""
}

