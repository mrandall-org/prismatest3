# Configure and downloading plugins for aws
provider "aws" {
  region = "${var.aws_region}"
}

# Creating VPC
resource "aws_vpc" "demovpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name                 = "Demo VPC"
    git_commit           = "39286d72182eac6b4dce6097c38d08e936a38676"
    git_file             = "awsmain.tf"
    git_last_modified_at = "2023-03-24 16:49:53"
    git_last_modified_by = "113141616+blahsi@users.noreply.github.com"
    git_modifiers        = "113141616+blahsi"
    git_org              = "blahsi"
    git_repo             = "awstest"
    yor_trace            = "a92e23ac-ff39-4007-ac84-ec0c054f0ae8"
    nikhil               = "owneremail.address.test.com"
  }
}
