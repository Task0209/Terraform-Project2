output "impex-booking-request-kmskey-id" {
  description = "The globally unique identifier for the Impex key"
  value       = aws_kms_key.impex-booking-request-kmskey.key_id
}

output key_spec {
  description = "Key specification"
  value = aws_kms_key.impex-booking-request-kmskey.customer_master_key_spec
}

output usage {
  description = "Key Functions"
  value = aws_kms_key.impex-booking-request-kmskey.key_usage
}

output del_win_in_days {
  description = "Number of deletion in day "
  value = aws_kms_key.impex-booking-request-kmskey.deletion_window_in_days
}