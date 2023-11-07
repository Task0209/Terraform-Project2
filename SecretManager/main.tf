resource "aws_secretsmanager_secret" "impex-cred" {
  name = var.sect_name
   recovery_window_in_days = 0 // Overriding the default recovery window of 30 days
   kms_key_id = var.impex_kms_key_id
}
 

resource "aws_secretsmanager_secret_version" "impex-secret-version" {
  secret_id = aws_secretsmanager_secret.impex-cred.id
  secret_string = "${jsonencode(var.impex-cred)}"
}

