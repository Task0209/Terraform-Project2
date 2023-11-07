
provider "aws" {
  region  = var.aws_region
}

module "SecretManager" {
    source = "./SecretManager"
    impex_kms_key_id = module.KeyMService.impex_kms_key_id
}

module "KeyMService" {
    source = "./KeyMService"
}

module "CloudWatchLogs" {
    source = "./CloudWatchLogs"
}

module "S3Bucket" {
    source = "./S3Bucket"
}

module "SQS" {
    source = "./SQS"
}
