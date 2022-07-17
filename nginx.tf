provider "aws" {
  region = "us-west-2"
  access_key = "AKIAXVT6HIXSARKTIFXU"
  secret_key = ""
}

resource "aws_instance" "myec2" {
    ami = "ami-098e42ae54c764c35"
    instance_type = "t2.micro"
    key_name = "ec2_key"

connection {
  type     = "ssh"
  user     = "ec2-user"
  private_key = file("./ec2_key.pem")
  host     = self.public_ip
}

provisioner "remote-exec" {
  inline = [
    "sudo amazon-linux-extras install -y nginx1",
    "sudo systemctl start nginx"
  ]
}
}
