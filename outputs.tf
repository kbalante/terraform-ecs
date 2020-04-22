output "ecs_cluster" {
  value = aws_ecs_cluster.cluster
}

output "aws_instance" {
  value = aws_instance.ec2_instance
}

output "aws_launch_configuration" {
  value = aws_launch_configuration.as_conf
}

output "ecs_task_definition" {
  value = aws_ecs_task_definition.task_definition
}

output "aws_lb" {
  value = aws_lb.load_balancer
}

output "ecs_service" {
  value = aws_ecs_service.service
}

//output "aws_vpc" {
//  value = aws_vpc.vpc
//}
//
//output "aws_internet_gateway" {
//  value = aws_internet_gateway.gw
//}
//
//output "aws_subnet1" {
//  value = aws_subnet.subnet1
//}
//
//output "aws_subnet2" {
//  value = aws_subnet.subnet2
//}
//
//output "aws_security_group" {
//  value = aws_security_group.security_group
//}
//
//output "aws_route_table" {
//  value = aws_route_table.rt
//}
//
//output "aws_route_table_association" {
//  value = aws_route_table_association.rta
//}