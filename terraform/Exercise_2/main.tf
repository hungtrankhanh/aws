provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region =var.aws_region
}
provider "archive" {}
data "archive_file" "zip" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_path = "greet_lambda.zip"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    sid    = ""
    effect = "Allow"
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda_exec_role" {
  name               = "lambda_exec_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}


data "aws_iam_policy_document" "lambda_logging" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"
  policy      = data.aws_iam_policy_document.lambda_logging.json
}


resource "aws_iam_role_policy_attachment" "logs_policy_attachment" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/greet_lambda"
  retention_in_days = 14
}


resource "aws_lambda_function" "lambda" {
  function_name = "greet_lambda"
  filename         = data.archive_file.zip.output_path
  source_code_hash = data.archive_file.zip.output_base64sha256
  role    = aws_iam_role.lambda_exec_role.arn
  handler = "greet_lambda.lambda_handler"
  runtime = "python3.8"
  environment{
      variables = {
          greeting = "Saying Hello World!"
      }
  }

  depends_on = [aws_iam_role_policy_attachment.logs_policy_attachment, aws_cloudwatch_log_group.lambda_log_group]

}