resource "aws_launch_template" "phonebook-be" {
  name                                 = "lt-phonebook"
  instance_type                        = "t2.micro"
  image_id                             = "ami-01cc34ab2709337aa"
  instance_initiated_shutdown_behavior = "terminate"
  update_default_version               = true

  key_name = "test23"
  network_interfaces {
    associate_public_ip_address = true
    subnet_id = aws_subnet.public-subnet-1.id
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

  user_data = filebase64("user_data.sh")
}