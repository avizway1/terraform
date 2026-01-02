
resource "aws_instance" "web" {
  ami                    = "ami-02d05f76acbed4e3e"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0e244adb6f393f9b9"]
  key_name               = "awar06-lnx"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("/Users/avizway/Desktop/keypairs/awar06-lnx.pem")
    host        = self.public_ip
    agent       = false
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd --now",
      "echo '<h1> Deployed via Terraform </h1>' | sudo tee /var/www/html/index.html"
    ]
  }
  tags = {
    Name = "webserver"
  }
}