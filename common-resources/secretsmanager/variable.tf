
variable "impex-booking-request-kmskey-id" {
  description = "KMS Key ID for Impex Client"
  type        = string
}

variable "secret-manager-name1" {
  description = "Name of the Secret Manager1"
  type = string
}

variable "secret-manager-name2" {
  description = "Name of the Secret Manager2"
  type = string
}


variable "rec_win_in_days" {
  description = "Recovery Windows in Days"
  type = number
}

variable "impex-booking-request-cred" {
  type = map(string)
# Is there a variable for strings in JSON format?
   sensitive = true
   default = {
    host = "TwentyFour_Hours"
    username = "ftpbroadwayinfo"
    password = "zMIMlpRWpRG$"
    directory = "/DM/Watcher/"
    pol_time = 10
}
}

variable "submission-lambda-name" {
  type = string
  description = "Name of the Lambda Function"
  default = ""
}

variable "ftp-lamda-name" {
  type = string
  description = "Name of the Lambda Function"
  default = ""
}