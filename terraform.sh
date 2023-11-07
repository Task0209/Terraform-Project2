#! /bin/bash

set -e

terraform init

# Create the Lambda Resource

terraform plan -target=module.lambda1.aws_lambda_function.impex-lambda1
terraform apply -target=module.lambda1.aws_lambda_function.impex-lambda1 -auto-appprove

# Create the API Gateway Resource

terraform plan -target=module.api.aws_api_gateway_rest_api.impex-api -target=module.api.aws_api_gateway_method.impex-book -target=module.api.aws_api_gateway_integration.impex-integration -target=module.api.aws_lambda_permission.apigw_lambda -target=module.api.aws_api_gateway_deployment.impex-dep -target=module.api.aws_api_gateway_stage.impex
terraform apply -target=module.api.aws_api_gateway_rest_api.impex-api -target=module.api.aws_api_gateway_method.impex-book -target=module.api.aws_api_gateway_integration.impex-integration -target=module.api.aws_lambda_permission.apigw_lambda -target=module.api.aws_api_gateway_deployment.impex-dep -target=module.api.aws_api_gateway_stage.impex -auto-approve
