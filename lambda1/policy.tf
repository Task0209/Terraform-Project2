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

 
resource "aws_iam_policy" "lambda1-sqs-queue" {
  name        = "lambda1-sqs-queue"
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


resource "aws_iam_role_policy_attachment" "lambda1-policy1-docs" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.lambda1-sqs-queue.arn
}


