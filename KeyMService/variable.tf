variable "kms_alias_key_name" {
    default = "alias/kms/impex_kms_key"
}

variable "impex_user_arn" {
  default ="arn:aws:iam::266842636661:user/ubuntu"
}

variable key_spec {
  default = "SYMMETRIC_DEFAULT"
}

variable usage {
  default = "ENCRYPT_DECRYPT"
}
variable enabled {
  default = true
}

variable rotation_enabled {
  default = true
}