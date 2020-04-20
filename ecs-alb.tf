resource "aws_lb" "loadbalancer" {
  internal            = false
  name                = "terraform-ecs-lb"
  subnets             = ["subnet-00f2624337a16d014", "subnet-0b6bb37a4634b73f2"]
  security_groups     = ["sg-0786e2e7889e0f83f"]
}


resource "aws_lb_target_group" "lb_target_group" {
  name        = "terraform-ecs-tg"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "vpc-00885662b043829e6"


  #STEP 1 - ECS task Running
  health_check {
    healthy_threshold   = "3"
    interval            = "10"
    port                = "8080"
    path                = "/index.html"
    protocol            = "HTTP"
    unhealthy_threshold = "3"
  }
}

resource "aws_lb_listener" "lb_listener" {
  default_action {
    target_group_arn = "${aws_lb_target_group.lb_target_group.id}"
    type             = "forward"
  }

  load_balancer_arn = "${aws_lb.loadbalancer.arn}"
  port              = "80"
  protocol          = "HTTP"
}