variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  description = "Name of your AWS key pair"
}

variable "private_key_path" {
  description = "Path to your .pem file"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  default     = "ami-0a7d80731ae1b2435"
}


