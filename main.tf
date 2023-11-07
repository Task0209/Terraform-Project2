provider "aws" {
  region  = var.region
}


module "lambda1" {
  source          = "./lambda1/"
  fun1-name = "${var.env}-${var.region}-${var.service}-lambda1-${var.ver}"
  sqs_arn = module.sqs.sqs_arn
}

module "lambda2" {
  source          = "./lambda2/"
  fun2-name = "${var.env}-${var.region}-${var.service}-lambda2-${var.ver}"
  sqs_arn = module.sqs.sqs_arn
  sqs_dead_arn = module.dead-sqs.sqs_dead_arn
}

module "sqs" {
  source = "./sqs"
  fun1-name = "${var.env}-${var.region}-${var.service}-lambda1-${var.ver}"
  fun2-name = "${var.env}-${var.region}-${var.service}-lambda2-${var.ver}"
  sqs_name = "${var.env}-${var.region}-${var.service}-sqs-${var.ver}"
  sqs_dead_arn = module.dead-sqs.sqs_dead_arn
  retention_period = var.retention_period
  visibility_timeout = var.visibility_timeout
  delay_sec = var.delay_sec
  max_msg_sz = var.max_msg_sz
  receive_wait_sec = var.receive_wait_sec
  receive_count = var.receive_count
}

module "dead-sqs" {
  source = "./dead-sqs"
  fun2-name = "${var.env}-${var.region}-${var.service}-lambda2-${var.ver}"
  dead_sqs_name = "${var.env}-${var.region}-${var.service}-dead-sqs-${var.ver}"
  sqs_arn = module.sqs.sqs_arn
}



