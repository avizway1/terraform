# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "6.22.0"
#     }
#   }
# }

# provider "aws" {
#   region = "ap-south-1"
# }

# locals {
#   ingress_rules = [
#     { port = 443 },
#     { port = 80 },
#     { port = 22 },
#     { port = 8080 },
#     { port = 8888 }
#   ]
# }

# resource "aws_security_group" "dynamic_example" {
#   name   = "testing-dynamic-sg"
#   vpc_id = "vpc-047489d5215aae1cc"

#   dynamic "ingress" {
#     for_each = local.ingress_rules
#     content {
#       from_port   = ingress.value.port
#       to_port     = ingress.value.port
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }
# }