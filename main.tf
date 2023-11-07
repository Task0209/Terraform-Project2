provider "aws" {
  region  = var.region
}

module "cloudwatch-logs" {
  source          = "./common-resources/cloudwatch-logs/"
  cloudwatch_log_group_name1 = "/aws/lambda/${var.env}-${var.region}-${var.service}-submission-lambda-${var.ver}"
  cloudwatch_log_group_name2 = "/aws/lambda/${var.env}-${var.region}-${var.service}-ftp-lambda-${var.ver}"
}

module "kms-key" {
  source = "./common-resources/kms-key/"
  key_spec = var.key_spec
  usage = var.usage
  kms_key_name = "${var.env}-${var.region}-${var.service}-kmskey-${var.ver}"
  impex_user_arn = var.impex_user_arn
}

module "s3" {
  source = "./common-resources/s3/"
  s3bucket = "${var.env}-${var.region}-${var.service}-s3-${var.ver}"
  OwnerShip-Permission = var.OwnerShip-Permission
  access_control_list = var.access_control_list
  s3bucket-arn = module.s3.s3bucket-arn
} 

module "sqs" {
  source = "./common-resources/sqs/"
  sqs_name = "${var.env}-${var.region}-${var.service}-sqs-${var.ver}"
  sqs_dead_arn = module.ftp-submitter-sqs-dead-letter.sqs_dead_arn
  retention_period = var.retention_period
  visibility_timeout = var.visibility_timeout
  delay_sec = var.delay_sec
  max_msg_sz = var.max_msg_sz
  receive_wait_sec = var.receive_wait_sec
  receive_count = var.receive_count
}

module "secret-manager" {
  source = "./common-resources/secretsmanager/"
  secret-manager-name1 = "${var.env}-${var.region}-${var.service}-a1secret-${var.ver}"
  secret-manager-name2 = "${var.env}-${var.region}-${var.service}-f1secret-${var.ver}"
  submission-lambda-name = "${var.env}-${var.region}-${var.service}-submission-lambda-${var.ver}"
  ftp-lamda-name = "${var.env}-${var.region}-${var.service}-ftp-lambda-${var.ver}"
  rec_win_in_days = var.rec_win_in_days
  impex-booking-request-kmskey-id = module.kms-key.impex-booking-request-kmskey-id
}

module "ftp-submitter-sqs-dead-letter" {
  source = "./ftp-submitter/sqs-dead-letter/"
  dead_queue_name = "${var.env}-${var.region}-${var.service}-dead-letter-queue-${var.ver}"
  retention_period = var.retention_period
  visibility_timeout = var.visibility_timeout
}

module "ftp-submitter-lambda" {
  source          = "./ftp-submitter/lambda/"
  ftp-lamda-name = "${var.env}-${var.region}-${var.service}-ftp-lambda-${var.ver}"
  lamda-handler = "${var.lamda-handler}"
  depends_on = [module.cloudwatch-logs]
}

module "submission-service-lambda" {
  source          = "./submission-service/lambda/"
  submission-lambda-name = "${var.env}-${var.region}-${var.service}-submission-lambda-${var.ver}"
  lamda-handler = "${var.lamda-handler}"
  depends_on = [module.cloudwatch-logs]
}

module "api" {
  source = "./submission-service/api-gateway"
  api-name = "${var.env}-${var.region}-${var.service}-api-${var.ver}"
  submission-lambda-name = "${var.env}-${var.region}-${var.service}-submission-lambda-${var.ver}"
  lambda-arn = module.submission-service-lambda.lambda-arn
}