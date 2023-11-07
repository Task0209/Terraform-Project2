output "kms_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = aws_kms_key.impex_kms_key_aus.arn
}

output "impex_kms_key_id" {
  description = "The globally unique identifier for the Impex key"
  value       = aws_kms_key.impex_kms_key_aus.key_id
}
