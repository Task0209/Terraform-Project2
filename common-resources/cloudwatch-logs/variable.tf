
variable cloudwatch_log_stream_name {
  type = string
  description = "Name of the Log stream"
}

variable cloudwatch_log_group_name {
  type = string
  description = "Name of the Log Group"
}

variable "log-policy-name" {
  type        = string
  description = "Name of the Log Policy"
}

variable "retention_days" {
  type = number
}