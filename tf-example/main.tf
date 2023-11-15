provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = "t2.micro"
  key_name      = "app-ssh-key"

  tags = {
    Name = var.ec2_name
  }
}
