data "aws_ami" "debian_jessie_latest" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-jessie-*"]
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

  owners = ["379101102735"] # Debian
}

data "aws_ami" "debian_jessie" {
  most_recent = false

  filter {
    name   = "name"
    values = ["debian-jessie-amd64-hvm-2017-01-15-1221-ebs"]
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

  owners = ["379101102735"] # Debian
}
