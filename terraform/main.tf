provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "tools" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "ci-cd-tools"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y docker.io git maven openjdk-17-jdk"
    ]
  }
}

