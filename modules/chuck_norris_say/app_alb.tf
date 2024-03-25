resource "aws_lb" "cluster" {
  name               = format("%s-cluster-alb", var.environment)
  subnets            = [var.public_subnet_id_1, var.public_subnet_id_2]
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app_alb.id]
  tags               = {
    Environment = var.environment
    Application = "chuck_norris"
  }
}

resource "aws_lb_target_group" "chuck_norris" {
  name        = format("%s-chuck-norris-alb-tg", var.environment)
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
  health_check {
    healthy_threshold   = "3"
    interval            = "90"
    protocol            = "HTTP"
    matcher             = "200-299"
    timeout             = "20"
    path                = "/"
    unhealthy_threshold = "2"
  }
}

resource "aws_lb_listener" "http_forward" {
  load_balancer_arn = aws_lb.cluster.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.chuck_norris.arn
  }
}