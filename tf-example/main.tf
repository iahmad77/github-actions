# provision to us-east-2 region
provider "aws" {
  region  = "us-east-2"
}

#AWS Instance

resource "aws_instance" "web-server" {
     ami = data.aws_ami.windows.id
     instance_type = "t2.micro"
tags = {
    Name = var.ec2_name
  }

 }

# Get latest Windows Server 2022 AMI
data "aws_ami" "windows-2022" {
  most_recent = true
  owners      = ["007666661890"]
  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base*"]
  }
}
