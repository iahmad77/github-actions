# provision to us-east-2 region
provider "aws" {
  region  = "us-east-2"
}

#AWS Instance

resource "aws_instance" "web-server" {
     ami = data.aws_ami.windows.id
     instance_type = "t2.micro"

lifecycle {
     ignore_changes = [ami]
     }
tags = {
    Name = var.ec2_name
  }

 }

#AMI Filter for Windows Server 2019 Base

data "aws_ami" "windows" {
     most_recent = true

filter {
        name   = "name"
        values = ["Windows_Server-2019-English-Full-Base-*"]

 }

filter {
       name   = "virtualization-type"
       values = ["hvm"]

 }

owners = ["007666661890"] # Canonical

 }
