data "aws_iam_policy_document" "impex-booking-request-secret-policy-docs" {
  statement {
    sid    = "EnableAnotherAWSAccountToReadTheSecret"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::266842636661:user/ubuntu"]
    }

    actions   = ["secretsmanager:GetSecretValue"]
    resources = ["*"]
  }
}

resource "aws_secretsmanager_secret_policy" "impex-booking-request-secret-policy1" {
  secret_arn = aws_secretsmanager_secret.impex-booking-request-secret1.arn
  policy     = data.aws_iam_policy_document.impex-booking-request-secret-policy-docs.json
}

resource "aws_secretsmanager_secret_policy" "impex-booking-request-secret-policy2" {
  secret_arn = aws_secretsmanager_secret.impex-booking-request-secret2.arn
  policy     = data.aws_iam_policy_document.impex-booking-request-secret-policy-docs.json
}

