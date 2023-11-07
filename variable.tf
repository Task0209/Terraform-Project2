variable region {
  type = string
  description = "Aws Region"
}

variable env {
  type = string
  description = "Environment"
}

variable service {
  type = string
  description = "Service"
}

variable ver {
  type = string
  description = "Version"
}


variable fun1-name {
  type = string
  description = "Name of the Lambda Function1"
  default = ""
}

variable fun2-name {
  type = string
  description = "Name of the Lambda Function2"
  default = ""
}

variable "sqs_name" {
  description = "Name of SQS Queue"
  type = string
  default = ""
}

variable "dead_sqs_name" {
  description = "Name of SQS Queue"
  type = string
  default = ""
}

variable "retention_period" {
  description = "Time (in seconds) that messages will remain in queue before being purged"
  type = number
}

variable "receive_count" {
  description = "Time (in seconds) that messages will remain in queue before being purged"
  type = number
}

variable "visibility_timeout" {
  description = "Time (in seconds) that consumers have to process a message before it becomes available again"
  type = number
}


variable "delay_sec" {
  description = "Any message that is sent to the queue remains invisible to consumers for the duration of this delay period"
  type = number
}

variable "max_msg_sz"{
  description = "The maximum size of the message that can be sent to the SQS queue. If a message exceeds this size, it will be rejected"
  type = number
}

variable receive_wait_sec {
   description = "This argument is useful to provide a time period that a request could wait for a message to become available in the queue. If no messages are available within this time, the request will return an empty response"
   type = number
}