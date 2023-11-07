resource "aws_api_gateway_rest_api" "impex-api" {
  name = "${var.api-name}"
}

resource "aws_api_gateway_method" "impex-book" {
  rest_api_id   = aws_api_gateway_rest_api.impex-api.id
  resource_id   = aws_api_gateway_rest_api.impex-api.root_resource_id
  http_method   = "POST"
  authorization = "NONE"
}
resource "aws_api_gateway_integration" "impex-integration" {
  rest_api_id             = aws_api_gateway_rest_api.impex-api.id
  http_method             = aws_api_gateway_method.impex-book.http_method
  resource_id             = aws_api_gateway_rest_api.impex-api.root_resource_id
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${var.lambda1-arn}"
}
resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = "${var.fun1-name}"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.impex-api.execution_arn}/*"
}

resource "aws_api_gateway_deployment" "impex-dep" {
  rest_api_id = aws_api_gateway_rest_api.impex-api.id
  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.impex-api.body))
  }
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_api_gateway_method.impex-book, aws_api_gateway_integration.impex-integration]
}
resource "aws_api_gateway_stage" "impex" {
  deployment_id = aws_api_gateway_deployment.impex-dep.id
  rest_api_id   = aws_api_gateway_rest_api.impex-api.id
  stage_name    = "dev"
}