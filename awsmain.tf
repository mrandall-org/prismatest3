# Configure and downloading plugins for aws
provider "aws" {
  region = "${var.aws_region}"
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "iacruletestbucket" # Replace with your desired bucket name
  acl    = "private"           # Access control list

  tags = {
    Name                 = "MyBucket"
    Environment          = "Development"
    git_commit           = "90b83ea8d393f13e4a699738644a8f0268f0959d"
    git_file             = "awsmain.tf"
    git_last_modified_at = "2024-06-21 15:02:23"
    git_last_modified_by = "113141616+blahsi@users.noreply.github.com"
    git_modifiers        = "113141616+blahsi"
    git_org              = "blahsi"
    git_repo             = "awstest"
    yor_name             = "my_bucket"
    yor_trace            = "cb8b5a15-8acc-4eda-9557-698fd4ea577d"
    mrandall             = "mrandalltagtest"
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
