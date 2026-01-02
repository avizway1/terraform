# data "aws_ami" "al2023" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["al2023-ami-*-x86_64"]
#   }
# }

# resource "aws_instance" "web" {
#   ami           = data.aws_ami.al2023.id
#   instance_type = "t3.micro"
# }