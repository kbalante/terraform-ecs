resource "aws_lb" "loadbalancer" {
  internal            = false
  name                = "terraform-ecs-loadbalancer"
  subnets             = ["subnet-05252f85c65945218", "subnet-0ea1ad0f63779cabd"]
  security_groups     = ["sg-04a87c7dcdde7b2da"]
}

resource "aws_lb_target_group" "lb_target_group" {
  name        = "terraform-ecs-tg"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "vpc-00885662b043829e6"
}

resource "aws_lb_listener" "lb_listener" {
  default_action {
    target_group_arn = aws_lb_target_group.lb_target_group.id
    type             = "forward"
  }

  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"
}