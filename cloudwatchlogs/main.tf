resource "aws_cloudwatch_log_group" "impex-log-lambda1" {
  name              = "${var.log-name1}"
  retention_in_days = var.ret_days
}

resource "aws_cloudwatch_log_group" "impex-log-lambda2" {
  name              = "${var.log-name2}"
  retention_in_days = var.ret_days
}

