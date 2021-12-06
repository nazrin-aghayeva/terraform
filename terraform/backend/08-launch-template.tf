resource "tls_private_key" "_backend_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "backend-ec2-key" {
  key_name   = "test-23"
  public_key = tls_private_key._backend_key.public_key_openssh
}

resource "aws_launch_template" "phonebook-be" {
  name = "lt-phonebook"
  instance_type = "t2.micro"
  image_id = "ami-01cc34ab2709337aa"
  instance_initiated_shutdown_behavior = "terminate"
  update_default_version = true

  key_name = aws_key_pair.backend-ec2-key.key_name
  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.private-security-group.id]
  }

  placement {
    availability_zone = "us-east-1a"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "phonebook-app"
    }
  }

  user_data_base64 = filebase64("user_data.sh")
}