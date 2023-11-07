resource "aws_cloudwatch_log_group" "Booking_Request_logs" {
  name = var.Book_logs
  retention_in_days = var.retention_days
  #kms_key_id = aws_kms_key.impex_kms_key_aus.id
}

resource "aws_cloudwatch_log_stream" "Booking_Request_logs_stream" {
  name           = var.Book_logs_Stream
  log_group_name = aws_cloudwatch_log_group.Booking_Request_logs.name
}

resource "aws_cloudwatch_log_resource_policy" "impex-booking-request" {
  policy_document = data.aws_iam_policy_document.impex-booking-request.json
  policy_name     = var.Impex_policy_Name
}