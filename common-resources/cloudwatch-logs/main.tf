resource "aws_cloudwatch_log_group" "impex-booking-request-logs" {
  name = "${var.cloudwatch_log_group_name}"
  retention_in_days = var.retention_days
  #kms_key_id = aws_kms_key.impex_kms_key_aus.id
}

resource "aws_cloudwatch_log_stream" "impex-booking-request-logsstream" {
  name           = "${var.cloudwatch_log_stream_name}"
  log_group_name = aws_cloudwatch_log_group.impex-booking-request-logs.name
}

resource "aws_cloudwatch_log_resource_policy" "impex-booking-request-logpolicy" {
  policy_document = data.aws_iam_policy_document.impex-booking-request-policy-docs.json
  policy_name     = "${var.log-policy-name}"
}