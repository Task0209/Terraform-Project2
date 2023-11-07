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

resource "aws_iam_policy" "lambda2-cloudwatch-logs" {
 
 name         = "lambda2-cloudwatch-logs"
 path         = "/"
 description  = "AWS IAM Policy for managing aws lambda role"
 policy = <<EOF
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
   }
 ]
}
EOF
}

resource "aws_iam_policy" "lambda2-s3-bucket" {
  name        = "lambda2-s3-bucket"
  description = "Policy for allow Lambda to retrieve the secret from Secret Manager"
  
  # Define the policy document
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutObject"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:s3:*:*:*",
      },
    ],
  })
}
 

resource "aws_iam_role_policy_attachment" "lambda2-policy1-docs" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.lambda2-cloudwatch-logs.arn
}
 
resource "aws_iam_role_policy_attachment" "lambda2-policy2-docs" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.lambda2-s3-bucket.arn
}
 