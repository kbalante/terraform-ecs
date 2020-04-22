resource "aws_lb" "load_balancer" {
  internal            = false
  name                = "terraform-ecs-load-balancer"
  subnets             = var.subnets
  security_groups     = var.security_groups
}

resource "aws_lb_target_group" "lb_target_group" {
  name        = "terraform-ecs-tg"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  depends_on = [aws_lb.load_balancer]
}

resource "aws_lb_listener" "lb_listener" {
  default_action {
    target_group_arn = aws_lb_target_group.lb_target_group.id
    type             = "forward"
  }

  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
}