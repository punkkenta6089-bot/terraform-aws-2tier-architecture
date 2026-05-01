resource "aws_launch_template" "web" {
  name_prefix   = "web-launch-template-"
  image_id      = data.aws_ssm_parameter.al2023.value
  instance_type = "t2.micro"
  key_name      = "terraform-key"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello Terraform!! Auto Scaling" > /var/www/html/index.html
              EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "terraform-asg-ec2"
    }
  }
}