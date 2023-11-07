variable "s3_bucket_name" {
  type = string
  description = "S3 Bucket Name for Impex"
  default = "impex-aus-bucket"
}

variable "OwnerShip-Permission" {
    type = string
    description = "Permission behaviour for S3 Bucket Priority"
    default = "BucketOwnerPreferred"
}

variable "access_control_list" {
    type = string
    description = "Types of access control list"
    default = "private"
}