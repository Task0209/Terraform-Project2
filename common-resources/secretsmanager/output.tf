output "secret-manager-name1" {
  description = "Name of Secret"
  value = aws_secretsmanager_secret.impex-booking-request-secret1.name
}

output "secret-manager-name2" {
  description = "Name of Secret"
  value = aws_secretsmanager_secret.impex-booking-request-secret2.name
}