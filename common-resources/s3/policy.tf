resource "aws_s3_bucket_policy" "booking-request-s3bucketpolicy" {
   bucket = aws_s3_bucket.impex-booking-request-s3bucket.id
  policy = data.aws_iam_policy_document.booking-request-s3bucketpolicy-docs.json
}

data "aws_iam_policy_document" "booking-request-s3bucketpolicy-docs" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["266842636661"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.impex-booking-request-s3bucket.arn,
      "${aws_s3_bucket.impex-booking-request-s3bucket.arn}/*"
    ]
  }
}