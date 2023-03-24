variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
 description = "The CIDR block for the VPC"
 type        = string
 default     = "10.2.0.0/16"
}
