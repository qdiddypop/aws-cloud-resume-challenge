# Declare data resources
data "aws_iam_role" "existing_role" {
  name = "cloudresume_lambda_role"
}

data "aws_iam_policy" "existing_policy" {
  name = "aws_iam_policy_for_terraform_resume_project_policy"
}

# Conditionally create the IAM role and policy if they don't exist
resource "aws_iam_role" "iam_for_lambda" {
  count = data.aws_iam_role.existing_role ? 0 : 1  # Conditionally create if it doesn't exist
  name = "cloudresume_lambda_role"

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

resource "aws_iam_policy" "iam_policy_for_resume_project" {
  count = data.aws_iam_policy.existing_policy ? 0 : 1  # Conditionally create if it doesn't exist
  name        = "aws_iam_policy_for_terraform_resume_project_policy"
  path        = "/"
  description = "AWS IAM Policy for managing the resume project role"
  
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "arn:aws:logs:*:*:*",
        "Effect" : "Allow"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:UpdateItem",
          "dynamodb:Query",
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:GetItem"
        ],
        "Resource" : "arn:aws:dynamodb:us-east-1:326768895355:table/cloudresume-test"
      },
    ]
  })
}

# Define the IAM role policy attachment
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  count = data.aws_iam_role.existing_role ? 0 : 1  # Conditionally create attachment if the role doesn't exist
  role       = aws_iam_role.iam_for_lambda[count.index].name
  policy_arn = aws_iam_policy.iam_policy_for_resume_project[count.index].arn
}

# The rest of your configuration remains the same
resource "aws_lambda_function" "myfunc" {
  filename         = data.archive_file.zip_the_python_code.output_path
  source_code_hash = data.archive_file.zip_the_python_code.output_base64sha256
  function_name    = "myfunc"
  handler          = "func.lambda_handler"
  runtime          = "python3.8"
  
  role = aws_iam_role.iam_for_lambda[0].arn  # Specify the role from the first instance
}


data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_file = "${path.module}/lambda/func.py"
  output_path = "${path.module}/lambda/func.zip"
}

resource "aws_lambda_function_url" "url1" {
  function_name = aws_lambda_function.myfunc[0].function_name != null ? aws_lambda_function.myfunc[0].function_name : aws_lambda_function.myfunc[1].function_name

  authorization_type = "NONE"

  cors {
    allow_credentials = true
    allow_origins     = ["https://resume.qhowell.cloud"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["keep-alive", "date"]
    max_age           = 86400
  }
}

