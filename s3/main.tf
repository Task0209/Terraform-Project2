resource "aws_s3_bucket" "impex-booking-request-s3bucket" {
  bucket = "${var.s3bucket}"

}

resource "aws_s3_bucket_ownership_controls" "impex-booking-request-owner" {
  bucket = aws_s3_bucket.impex-booking-request-s3bucket.id
  rule {
    object_ownership = "${var.OwnerShip-Permission}"
  }
}

resource "aws_s3_bucket_acl" "access-control" {
  depends_on = [aws_s3_bucket_ownership_controls.impex-booking-request-owner]

  bucket = aws_s3_bucket.impex-booking-request-s3bucket.id
  acl    = "${var.access_control_list}"
}

resource "aws_lambda_permission" "lambda_s3_permission1" {
  statement_id  = "AllowS3InvokeLambda1"
  action        = "lambda:InvokeFunction"
  function_name = "${var.fun1-name}"
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.impex-booking-request-s3bucket.arn
}

resource "aws_lambda_event_source_mapping" "s3_trigger1" {
  batch_size  = "${var.bsize}"
  event_source_arn = aws_s3_bucket.impex-booking-request-s3bucket.arn
  function_name    = "${var.fun1-name}"
  enabled          = true
}

resource "aws_s3_bucket_notification" "aws-lambda-trigger1" {
  bucket = aws_s3_bucket.impex-booking-request-s3bucket.id

lambda_function {
    lambda_function_arn = "${var.arn-lambda1}"
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]

  }
}

resource "aws_s3_bucket_notification" "aws-lambda-trigger2" {
  bucket = aws_s3_bucket.impex-booking-request-s3bucket.id

lambda_function {
    lambda_function_arn = "${var.arn-lambda2}"
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]

  }
}

resource "aws_lambda_permission" "lambda_s3_permission2" {
  statement_id  = "AllowS3InvokeLambda1"
  action        = "lambda:InvokeFunction"
  function_name = "${var.fun2-name}"
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.impex-booking-request-s3bucket.arn
}

resource "aws_lambda_event_source_mapping" "s3_trigger2" {
  batch_size  = "${var.bsize}"
  event_source_arn = aws_s3_bucket.impex-booking-request-s3bucket.arn
  function_name    = "${var.fun2-name}"
  enabled          = true
}
