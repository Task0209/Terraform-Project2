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

resource "aws_iam_policy" "lambda2-sqs-queue" {
  name        = "lambda2-sqs-queue"
  description = "Grant Lambda permisssion to SQS queue"
  
  # Define the policy document
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        Effect   = "Allow",
        Resource = var.sqs_arn,
      },
    ],
  })
}

resource "aws_iam_policy" "lambda2-sqs-dead-letter-queue" {
  name        = "lambda2-sqs-dead-letter-queue"
  description = "Grant Lambda permisssion to SQS Dead queue"
  
  # Define the policy document
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "sqs:ChangeMessageVisibility",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes",
          "sqs:GetQueueUrl",
          "sqs:ReceiveMessage"
        ],
        Effect   = "Allow",
        Resource = var.sqs_dead_arn,
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "lambda2-policy1-docs" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.lambda2-sqs-queue.arn
}

resource "aws_iam_role_policy_attachment" "lambda2-policy2-docs" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.lambda2-sqs-dead-letter-queue.arn
}
 
