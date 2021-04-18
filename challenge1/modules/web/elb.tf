resource "aws_lb" "lb" {
  name            = "${terraform.workspace}-lb"
  internal           = false
  security_groups = [var.private_sg, var.public_sg]
  subnets         = [var.public_subnet_b, var.public_subnet_c]
 load_balancer_type = "application"

#   health_check {
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     interval            = 30
#     target              = "HTTP:80/"
#   }

#   listener {
#     lb_port           = 80
#     lb_protocol       = "http"
#     instance_port     = 80
#     instance_protocol = "http"
#   }
   tags = {
    Name = "${terraform.workspace}-lb"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

 default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}

resource "aws_lb_target_group" "web_tg_1" {
  name        = "${terraform.workspace}-web-tg1"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.main_vpc
}

resource "aws_lb_target_group" "web_tg_2" {
  name        = "${terraform.workspace}-web-tg2"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.main_vpc
}