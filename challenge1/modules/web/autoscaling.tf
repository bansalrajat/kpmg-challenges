resource "aws_autoscaling_group" "autoscaling_group" {
  launch_configuration = aws_launch_configuration.launch_configuration.id
  vpc_zone_identifier  = [var.private_subnet_b, var.private_subnet_c]
  min_size             = 2
  max_size             = 10
  target_group_arns       = [aws_lb_target_group.web_tg_2.arn,aws_lb_target_group.web_tg_1.arn]
  health_check_type    = "ELB"

  tag {
    key                 = "Name"
    value               = "autoscaling_group"
    propagate_at_launch = true
  }
}


resource "aws_launch_configuration" "launch_configuration" {
  image_id             = var.ami_image_id
  name_prefix = terraform.workspace
  instance_type        = "t2.micro"
  security_groups      = [var.private_sg]
  iam_instance_profile = aws_iam_instance_profile.instance_profile.id
  
  user_data = <<-EOF
              #!/bin/bash
              #test
              sudo su -
              yum install docker -y
              systemctl enable docker
              systemctl start docker  
              yum install docker -y 
              mkdir -p  /usr/share/nginx/html
              echo "Hello KPMG" > /usr/share/nginx/html/index.html
              docker run --name some-nginx -p80:80 -v /usr/share/nginx/html:/usr/share/nginx/html:ro -d nginx
              EOF

  lifecycle {
    create_before_destroy = true
  }
}