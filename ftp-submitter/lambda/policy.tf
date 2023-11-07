resource "aws_iam_role" "lambda_role" {
name   = "${var.lamda-role}"
assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "lambda.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

resource "aws_iam_policy" "ftp-lamda-policy-cloudwatch-logs" {
 
 name         = "ftp-lamda-policy-cloudwatch-logs"
 path         = "/"
 description  = "AWS IAM Policy for managing submission aws lambda role"
 policy = jsonencode(
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents"
     ],
     "Resource": "arn:aws:logs:*:*:*",
     "Effect": "Allow"
   },
  {
     "Action": [
       "secretsmanager:GetSecretValue",
     ],
     "Resource": "*",
     "Effect": "Allow"
   }
 ]
}
)
}
 
# Attach a policy that allows Lambda to send messages to an SQS queue
resource "aws_iam_policy" "ftp-lambda-secret-policy" {
  name        = "ftp-lambda-secret-policy"
  description = "Policy for allow Lambda to retrieve the secret from Secret Manager"
  
  # Define the policy document
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue"   # Add any additional actions you need
        ],
        Effect   = "Allow",
        Resource = "*",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "ftp-lamda-policy-cloudwatch-logs-docs" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.ftp-lamda-policy-cloudwatch-logs.arn
}
 
resource "aws_iam_role_policy_attachment" "ftp-lambda-secret-policy-docs" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.ftp-lambda-secret-policy.arn
}