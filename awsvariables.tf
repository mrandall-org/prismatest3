variable "aws_region" {
  default = "us-east-1"
}

variable "cidr" {
 description = "The CIDR block for the VPC"
 type        = string
 default     = "10.0.0.0/16"
}
