
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

variable "s3bucket-arn" {
  type = string
  description = "ARN of s3 bucket"
  default = ""
}

variable "ftp-lamda-arn" {
  description = "ARN for ftp Lambda"
  type = string
  default = ""
}