data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.debian_ami_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = [var.debian_ami_owner] # Debian
}

