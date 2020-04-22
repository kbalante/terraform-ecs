resource "aws_ecs_service" "service" {
  cluster                = aws_ecs_cluster.cluster.id
  desired_count          = 1
  launch_type            = "EC2"
  name                   = "terraform-ecs-service"
  task_definition        = aws_ecs_task_definition.task_definition.arn
  scheduling_strategy    = "DAEMON"
  load_balancer {
    container_name       = "terraform-ecs-container"
    container_port       = "80"
    target_group_arn     = aws_lb_target_group.lb_target_group.id
  }
}