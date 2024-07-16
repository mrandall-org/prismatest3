# Define the required provider
provider "aws" {
  region = "us-east-1" # Specify the AWS region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-12345" # Replace with your desired bucket name
  acl    = "private"                     # Access control list

  tags = {
    Name        = "MyBucket"
    Environment = "Development"
    mrandall    = "mrandalltagtest"
  }
}

# Define the bucket policy
data "aws_iam_policy_document" "bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.my_bucket.arn}/*"]
    effect    = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::111122223333:user/MyUser"] # Replace with your IAM user/role
    }
  }

  # Optional: Add more statements if needed
}

# Attach the policy to the bucket
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}

# Optional: Outputs to get information about the created resources
output "bucket_id" {
  value = aws_s3_bucket.my_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}

output "bucket_policy_id" {
  value = aws_s3_bucket_policy.bucket_policy.id
}
