provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "mymanualins" {
  ami           = "ami-0d176f79571d18a8f"
  instance_type = "t3.small"

  tags = {
    Name = "my-imported-instance"
  }
}

# import {
#   to = aws_instance.mymanualins
#   id = "i-00f876847b259043b"
# }

