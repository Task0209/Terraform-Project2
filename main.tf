provider "aws" {
  region  = var.region
}


module "lambda1" {
  source          = "./lambda1/"
  fun1-name = "${var.env}-${var.region}-${var.service}-lambda1-${var.ver}"
}

module "api" {
  source = "./api"
  api-name = "${var.env}-${var.region}-${var.service}-api-${var.ver}"
  fun1-name = "${var.env}-${var.region}-${var.service}-lambda1-${var.ver}"
  lambda1-arn = module.lambda1.lambda1-arn
}

