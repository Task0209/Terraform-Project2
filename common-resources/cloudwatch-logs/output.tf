output "cloudwatch_log_group_name" {
  description = "Log Group name for Booking Request"
  value       = aws_cloudwatch_log_group.impex-booking-request-logs.name
}

output "retention_in_days" {
  description = "No of Retention days"
  value       = aws_cloudwatch_log_group.impex-booking-request-logs.retention_in_days
}

output "cloudwatch_log_stream_name" {
  description = "Log stream name for Booking Request"
  value       = aws_cloudwatch_log_stream.impex-booking-request-logsstream.name
}

output "log-policy-name" {
  description = "Log stream name for Booking Request"
  value       = aws_cloudwatch_log_resource_policy.impex-booking-request-logpolicy.policy_name
}


