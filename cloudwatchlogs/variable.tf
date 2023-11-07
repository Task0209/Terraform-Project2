variable log-name1 {
  type = string
  description = "Log group name of the Lambda Function"
}

variable log-name2 {
  type = string
  description = "Log group name of the Lambda Function"
}


variable "ret_days" {
  type        = string
  description = "retention_in_days for Log group"
  default = "14"
}



