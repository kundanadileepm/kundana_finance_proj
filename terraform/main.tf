provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "master" {
  ami           = "ami-0a7d80731ae1b2435"
  instance_type = "t2.medium"
  key_name      = "Assignment-Key"

  tags = {
    Name = "k8s-master"
  }
}

resource "aws_instance" "worker" {
  ami           = "ami-0a7d80731ae1b2435"
  instance_type = "t2.medium"
  key_name      = "Assignment-Key"

  tags = {
    Name = "k8s-worker"
  }
}

resource "aws_instance" "monitoring" {
  ami           = "ami-0a7d80731ae1b2435"
  instance_type = "t2.medium"
  key_name      = "Assignment-Key"

  tags = {
    Name = "monitoring-node"
  }
}
