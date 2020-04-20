resource "aws_ecs_task_definition" "task_definition" {
  container_definitions    = data.template_file.task_definition_json.rendered
  task_role_arn = "arn:aws:iam::798617457475:role/ecsTaskExecutionRole"
  execution_role_arn = "arn:aws:iam::798617457475:role/ecsTaskExecutionRole"
  family                   = "terraform-ecs-task-definition"
  memory                   = "2048"
  cpu                      = "1024"
  requires_compatibilities = ["EC2"]
}

data "template_file" "task_definition_json" {
  template = "${file("${path.module}/task_definition.json")}"
}