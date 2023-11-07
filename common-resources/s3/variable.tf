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
