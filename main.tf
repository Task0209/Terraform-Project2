provider "aws" {
  region  = var.region
}

module "cloudwatchlogs" {
  source = "./cloudwatchlogs"
  log-name1 = "/aws/lambda/${var.env}-${var.region}-${var.service}-lambda1-${var.ver}"
  log-name2 = "/aws/lambda/${var.env}-${var.region}-${var.service}-lambda2-${var.ver}"
}

module "lambda1" {
  source          = "./lambda1/"
  fun1-name = "${var.env}-${var.region}-${var.service}-lambda1-${var.ver}"
  depends_on = [module.cloudwatchlogs]
}

module "lambda2" {
  source          = "./lambda2/"
  fun2-name = "${var.env}-${var.region}-${var.service}-lambda2-${var.ver}"
  depends_on = [module.cloudwatchlogs]
}

module "api" {
  source = "./api"
  api-name = "${var.env}-${var.region}-${var.service}-api-${var.ver}"
  fun1-name = "${var.env}-${var.region}-${var.service}-lambda1-${var.ver}"
  lambda1-arn = module.lambda1.lambda1-arn
}

module "s3" {
  source = "./s3/"
  fun1-name = "${var.env}-${var.region}-${var.service}-lambda1-${var.ver}"
  fun2-name = "${var.env}-${var.region}-${var.service}-lambda2-${var.ver}"
  s3bucket = "${var.env}-${var.region}-${var.service}-s3-${var.ver}"
  OwnerShip-Permission = var.OwnerShip-Permission
  access_control_list = var.access_control_list
  s3bucket-arn = module.s3.s3bucket-arn
  arn-lambda1 = module.lambda1.arn-lambda1
  arn-lambda2 = module.lambda2.arn-lambda2
} 

