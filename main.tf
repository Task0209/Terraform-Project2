provider "aws" {
  region  = var.region
}

module "cloudwatch-logs" {
  source          = "./common-resources/cloudwatch-logs/"
  cloudwatch_log_group_name = "${var.env}-${var.region}-${var.service}-logs-${var.ver}"
  cloudwatch_log_stream_name = "${var.env}-${var.region}-${var.service}-logsstream-${var.ver}"
  log-policy-name = var.log-policy-name
  retention_days = var.retention_days
}

module "kms-key" {
  source = "./common-resources/kms-key/"
  key_spec = var.key_spec
  usage = var.usage
  enabled = var.enabled
  rotation_enabled = var.rotation_enabled
  del_win_in_days = var.del_win_in_days
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

module "submission-secret-manager" {
  source = "./submission-service/secretsmanager/"
  secret-manager-name = "${var.env}-${var.region}-${var.service}-submission-secret-${var.ver}"
  rec_win_in_days = var.rec_win_in_days
  impex-booking-request-kmskey-id = module.kms-key.impex-booking-request-kmskey-id
}

module "ftp-submitter-secret-manager" {
  source = "./ftp-submitter/secretsmanager/"
  secret-manager-name = "${var.env}-${var.region}-${var.service}-ftp-submitter-secret-${var.ver}"
  rec_win_in_days = var.rec_win_in_days
  impex-booking-request-kmskey-id = module.kms-key.impex-booking-request-kmskey-id
}

module "ftp-submitter-sqs-dead-letter" {
  source = "./ftp-submitter/sqs-dead-letter/"
  dead_queue_name = "${var.env}-${var.region}-${var.service}-dead-letter-queue-${var.ver}"
  retention_period = var.retention_period
  visibility_timeout = var.visibility_timeout
}

