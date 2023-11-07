variable "OwnerShip-Permission" {
    type = string
    description = "Permission behaviour for S3 Bucket Priority"
}

variable "access_control_list" {
    type = string
    description = "Types of access control list"
}

variable "s3bucket" {
    type = string
    description = "Name of s3 bucket"
}


variable "s3bucket-arn" {
  description = "ARN of s3 buckets"
  type = string
}

variable "bsize" {
   description = "Batch Size"
   type = number
   default = 10
}

variable "fun1-name" {
  type = string
  description = "Name of the Lambda Function1"
  default = ""
}

variable "fun2-name" {
  type = string
  description = "Name of the Lambda Function2"
  default = ""
}

variable "arn-lambda1" {
  description = "ARN for Lambda"
  type = string
}

variable "arn-lambda2" {
  description = "ARN for Lambda"
  type = string
}