output "ecs_cluster" {
  value = aws_ecs_cluster.cluster
}

output "ecs_service" {
  value = aws_ecs_service.service
}

output "ecs_task_definition" {
  value = aws_ecs_task_definition.task_definition
}

output "aws_lb" {
  value = aws_lb.loadbalancer
}

output "aws_instance" {
  value = aws_instance.ec2_instance
}