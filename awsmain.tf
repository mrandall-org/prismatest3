# Configure and downloading plugins for aws
provider "aws" {
  region = "${var.aws_region}"
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "iacbucket5" # Replace with your desired bucket name
  acl    = "private"    # Access control list

  tags = {
    Name                 = "iacbucket5"
    Environment          = "Development"
    git_commit           = "bd04c2c1e6efa48345bff3561d2e5319f6e08744"
    git_file             = "awsmain.tf"
    git_last_modified_at = "2024-06-21 15:25:55"
    git_last_modified_by = "113141616+blahsi@users.noreply.github.com"
    git_modifiers        = "113141616+blahsi"
    git_org              = "blahsi"
    git_repo             = "awstest"
    yor_name             = "my_bucket"
    yor_trace            = "be734335-aecf-4a2d-840a-eca932356e16"
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
      identifiers = ["arn:aws:iam::142844302461:user/github"] # Replace with your IAM user/role
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
