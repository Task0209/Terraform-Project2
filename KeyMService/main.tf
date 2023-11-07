resource "aws_kms_key" "impex_kms_key_aus" {
  description         =  "KMS Keys for Data Encryption of Booking service"
  customer_master_key_spec = var.key_spec
  key_usage = var.usage
  is_enabled               = var.enabled
  deletion_window_in_days  = 7
  enable_key_rotation      = var.rotation_enabled
  tags = {
    Name = "${var.kms_alias_key_name}"
  }
}

resource "aws_kms_alias" "impex_kms_key" {
  target_key_id = aws_kms_key.impex_kms_key_aus.id
  name          = var.kms_alias_key_name
}
