
variable "impex-booking-request-kmskey-id" {
  description = "KMS Key ID for Impex Client"
  type        = string
}

variable "secret-manager-name" {
  description = "Name of the Secret Manager"
  type = string
}

variable "rec_win_in_days" {
  description = "Recovery Windows in Days"
  type = number
}

variable "impex-booking-request-cred" {
  type = map(object({
# Is there a variable for strings in JSON format?
    ftp_server  = any
    aws = any
  }))
  default = {
    "server_cred1"={
      ftp_server = {
        "host" : "TwentyFour_Hours",
        "username" : "ftpbroadwayinfo",
        "password": "zMIMlpRWpRG$",
        "directory": "/DM/Watcher/",
        "pol_time" : 10
      }
       aws = {
        "region" : "us-east-1",
        "s3bucket" : "bookingresponsedummy",
        "secretmanagerkey": "bookingresponsedummy",
        "sqs_url": " ",
        "access_id" : "AKIAUJ3LZ2VZ5Z5VX2KQ",
        "access_secret": "X7c2W4i9J4l9z8N7y0Kb8fP5mzJ6T4I8"
      }
      }
  }
}