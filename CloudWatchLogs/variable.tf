variable "Book_logs" {
  type = string
  description = "Booking Request Log Name"
  default = "Booking_Request_logs"
}

variable "Book_logs_Stream" {
  type = string
  description = "Booking Request Log stream"
  default = "Booking_Request_logs_stream"
}

variable "Impex_policy_Name"{
    type = string
    description = "Policy name for Impex"
    default ="impex-booking-request"
}

variable "retention_days" {
  type = number
  default = 30
}